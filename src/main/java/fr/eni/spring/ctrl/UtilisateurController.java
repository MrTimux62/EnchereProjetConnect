package fr.eni.spring.ctrl;

import java.util.List;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.jasypt.util.text.AES256TextEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import fr.eni.spring.bean.Utilisateur;
import fr.eni.spring.dao.IUtilisateurRepository;

@Controller()
@SessionAttributes({"session_user", "session_admin"})
@RequestMapping("")
public class UtilisateurController {

	@Autowired
	private IUtilisateurRepository utilisateurDAO;

	StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
	
	@GetMapping("/connexion")
	private ModelAndView page_connexion() {

		return new ModelAndView("connexion");
	}

	@GetMapping("/inscription")
	private ModelAndView page_inscription() {

		return new ModelAndView("inscription");
	}

	@GetMapping("/list_enchere")
	private ModelAndView page_enchere() {

		return new ModelAndView("liste_enchere");
	}

	@GetMapping("/deconnecter")
	private ModelAndView deconnexion() {

		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("connexion");
		modelandview.addObject("session_user", "-1");
		return modelandview;
	}

	@GetMapping("/nouvelle_vente")
	private ModelAndView nouvelle_vente() {

		return new ModelAndView("nouvelle_vente");
	}

	@GetMapping("/profil/{id:\\d+}")
	private ModelAndView page_profil(@PathVariable("id") int id) {
		
		Utilisateur utilisateur = utilisateurDAO.getReferenceById(id);

		return new ModelAndView("profil", "u", utilisateur);
	}
	
	@GetMapping("/profil")
	private ModelAndView page_profil_name(String pseudo) {
		
		List<Utilisateur> list_utilisateur = utilisateurDAO.findAll();
		
		for (Utilisateur utilisateur : list_utilisateur) {
			if (utilisateur.getPseudo().equals(pseudo)) {
				return new ModelAndView("profil", "u", utilisateur);
			}
		}

		return new ModelAndView("profil");
	}
	
	@GetMapping("/edit_profil/{id:\\d+}")
	private ModelAndView page_edit_profil(@PathVariable("id") int id) {
		
		Utilisateur utilisateur = utilisateurDAO.getReferenceById(id);

		return new ModelAndView("edit_profil", "u", utilisateur);
	}
	
	@PostMapping("/edit_profil/{id:\\d+}")
	private ModelAndView edit_profil(Utilisateur utilisateur) {
		
		Utilisateur origin_user = utilisateurDAO.getReferenceById(utilisateur.getNoUtilisateur());
		
		utilisateur.setAdministrateur(origin_user.isAdministrateur());
		utilisateur.setMotDePasse(origin_user.getMotDePasse());
		utilisateur.setPseudo(origin_user.getPseudo());
		utilisateur.setCredit(origin_user.getCredit());
		utilisateur.setDisabled(origin_user.isDisabled());
		
		utilisateurDAO.save(utilisateur);

		return new ModelAndView("profil", "u", utilisateur);
	}
	
	@PostMapping("/inscription")
	private ModelAndView insert(Utilisateur u, String motDePasse2) {

		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("inscription");
		
		if (u.getMotDePasse().isEmpty()) {
			modelandview.addObject("incorrect", "Mot de passe vide");
		} else if (!u.getMotDePasse().equals(motDePasse2)) {
			modelandview.addObject("incorrect", "Les mot de passe ne correspondent pas");
		} else {
			
			boolean same_pseudo = false;
			
			List<Utilisateur> list_utilisateur = utilisateurDAO.findAll();
			
			for (Utilisateur utilisateur : list_utilisateur) {
				if (utilisateur.getPseudo().equals(u.getPseudo())) {
					same_pseudo = true;
				}
			}
			
			if (same_pseudo) {
				modelandview.addObject("incorrect", "Pseudo déjà utilisé");
			} else {
				u.setMotDePasse(passwordEncryptor.encryptPassword(u.getMotDePasse()));

				utilisateurDAO.save(u);
				
				List<Utilisateur> liste_utilisateur = utilisateurDAO.findAll();
				
				modelandview.setViewName("liste_enchere");
				
				for (Utilisateur utilisateur : liste_utilisateur) {
					if (utilisateur.getPseudo().equals(u.getPseudo()) && utilisateur.getMotDePasse().equals(u.getMotDePasse())) {
						modelandview.addObject("session_user", utilisateur.getNoUtilisateur());
					}
				}
			}
			
		}

		return modelandview;
	}
	
	@PostMapping("/delete")
	private ModelAndView delete_utilisateur(int id, String motdepasse) {
		ModelAndView modelandview = new ModelAndView();
		
		Utilisateur utilisateur = utilisateurDAO.getReferenceById(id);
		
		if (passwordEncryptor.checkPassword(motdepasse, utilisateur.getMotDePasse())) {
			utilisateurDAO.deleteById(id);
			modelandview.setViewName("connexion");
			modelandview.addObject("session_user", "-1");
		} else {
			modelandview.setViewName("profil");
			modelandview.addObject("incorrect", "Mot de passe ou utilisateur incorrect");
		}
		
		return modelandview;
	}

	@PostMapping("/connexion")
	private ModelAndView connexion_utilisateur(String username, String password) {

		List<Utilisateur> liste_utilisateur = utilisateurDAO.findAll();
		ModelAndView modelandview = new ModelAndView();

		modelandview.setViewName("connexion");
		modelandview.addObject("incorrect", "Mot de passe ou utilisateur incorrect");

		for (Utilisateur utilisateur : liste_utilisateur) {
			if (utilisateur.getPseudo().equals(username) && passwordEncryptor.checkPassword(password, utilisateur.getMotDePasse())) {
				modelandview.addObject("session_user", utilisateur.getNoUtilisateur());
				modelandview.setViewName("liste_enchere");
				modelandview.addObject("incorrect", "");
				if (utilisateur.isAdministrateur()) {
					modelandview.addObject("session_admin", utilisateur.getNoUtilisateur());
				}
			}
		}

		return modelandview;
	}

}
