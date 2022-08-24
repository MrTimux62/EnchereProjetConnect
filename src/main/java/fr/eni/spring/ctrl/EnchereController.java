package fr.eni.spring.ctrl;

import java.util.List;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import fr.eni.spring.bean.ArticleVendu;
import fr.eni.spring.bean.Utilisateur;
import fr.eni.spring.dao.IArticleVenduRepository;
import fr.eni.spring.dao.ICategorieRepository;
import fr.eni.spring.dao.IEnchereRepository;
import fr.eni.spring.dao.IRetraitRepository;
import fr.eni.spring.dao.IUtilisateurRepository;

@Controller()
@SessionAttributes({ "session_user", "session_admin" })
@RequestMapping("")
public class EnchereController {

	@Autowired
	private IUtilisateurRepository utilisateurDAO;
	
	@Autowired
	private ICategorieRepository categorieDAO;
	
	@Autowired
	private IArticleVenduRepository articleVenduDAO;
	
	@Autowired
	private IRetraitRepository retraitDAO;
	
	@Autowired
	private IEnchereRepository enchereDAO;

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
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("liste_enchere");
		
		modelandview.addObject("categories", categorieDAO.findAll());
		modelandview.addObject("utilisateurs", utilisateurDAO.findAll());
		return modelandview;
	}
	
	@GetMapping("/list_enchere/{id:\\d+}")
	private ModelAndView page_enchere_utilisateur(@PathVariable("id") int id) {
		
		ModelAndView modelandview = new ModelAndView();
		
		modelandview.setViewName("liste_enchere");
		modelandview.addObject("utilisateurs", utilisateurDAO.findAll());
		modelandview.addObject("categories", categorieDAO.findAll());
		modelandview.addObject("filter", id);

		return modelandview;
	}


	@GetMapping("/deconnecter")
	private ModelAndView deconnexion(SessionStatus status) {
		status.setComplete();
		return new ModelAndView("connexion");
	}

	@GetMapping("/nouvelle_vente/{id:\\d+}")
	private ModelAndView nouvelle_vente(@PathVariable("id") int id) {
		
		Utilisateur utilisateur = utilisateurDAO.getReferenceById(id);
		
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("nouvelle_vente");
		modelandview.addObject("categories", categorieDAO.findAll());
		modelandview.addObject("u", utilisateur);
		
		return modelandview;
	}
	
	@PostMapping("/nouvelle_vente/{id:\\d+}")
	private ModelAndView nouvelle_vente_confirm(@PathVariable("id") int id, ArticleVendu article) {
		
		Utilisateur utilisateur = utilisateurDAO.getReferenceById(id);
		//articleVenduDAO.save(article);
		//System.out.println(article.toString());
		List<ArticleVendu> list_article = utilisateur.getVend();
		list_article.add(article);
		utilisateur.setVend(list_article);
		utilisateurDAO.save(utilisateur);
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject("categories", categorieDAO.findAll());
		modelandview.addObject("utilisateurs", utilisateurDAO.findAll());
		modelandview.setViewName("liste_enchere");
		
		return modelandview;
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

	@GetMapping("/admin")
	private ModelAndView admin_index() {

		return new ModelAndView("admin_index");
	}

	@PostMapping("/profil")
	private ModelAndView page_profil_noname(Utilisateur u) {
		return new ModelAndView("profil", "u", u);
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

	@PostMapping("/edit_profil_mdp/{id:\\d+}")
	private ModelAndView edit_profil_mdp(@PathVariable("id") int id, String motDePasse, String new_motDePasse,
			String new_motDePasse2) {

		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("profil");
		Utilisateur origin_user = utilisateurDAO.getReferenceById(id);

		if (!motDePasse.isEmpty()) {
			if (passwordEncryptor.checkPassword(motDePasse, origin_user.getMotDePasse())) {
				if (!new_motDePasse.isEmpty() && !new_motDePasse2.isEmpty() && new_motDePasse.equals(new_motDePasse2)) {
					new_motDePasse = passwordEncryptor.encryptPassword(new_motDePasse);
					origin_user.setMotDePasse(new_motDePasse);
					utilisateurDAO.save(origin_user);
					modelandview.addObject("valid", "Mot de passe modifié");
				} else {
					modelandview.addObject("incorrect", "Confirmation invalide");
				}

			} else {
				modelandview.addObject("incorrect", "Mot de passe incorrect");
			}
		} else {
			modelandview.addObject("incorrect", "Mot de passe vide");
		}

		modelandview.addObject("u", origin_user);
		return modelandview;
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
					if (utilisateur.getPseudo().equals(u.getPseudo())
							&& utilisateur.getMotDePasse().equals(u.getMotDePasse())) {
						modelandview.addObject("session_user", utilisateur.getNoUtilisateur());
					}
				}
			}

		}

		return modelandview;
	}

	@PostMapping("/delete")
	private ModelAndView delete_utilisateur(int id, String motdepasse, SessionStatus status) {
		ModelAndView modelandview = new ModelAndView();

		Utilisateur utilisateur = utilisateurDAO.getReferenceById(id);

		if (passwordEncryptor.checkPassword(motdepasse, utilisateur.getMotDePasse())) {
			utilisateurDAO.deleteById(id);
			return deconnexion(status);
		} else {
			modelandview.setViewName("profil");
			modelandview.addObject("u", utilisateur);
			modelandview.addObject("incorrect", "Mot de passe incorrect");
		}

		return modelandview;
	}

	@PostMapping("/connexion")
	private ModelAndView connexion_utilisateur(String username, String password) {

		List<Utilisateur> liste_utilisateur = utilisateurDAO.findAll();
		ModelAndView modelandview = new ModelAndView();
		
		modelandview.addObject("utilisateurs", utilisateurDAO.findAll());
		modelandview.addObject("categories", categorieDAO.findAll());

		modelandview.setViewName("connexion");
		modelandview.addObject("incorrect", "Mot de passe ou utilisateur incorrect");

		for (Utilisateur utilisateur : liste_utilisateur) {
			if (utilisateur.getPseudo().equals(username)
					&& passwordEncryptor.checkPassword(password, utilisateur.getMotDePasse())) {
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

	@RequestMapping("/endsession")
	public String endSessionHandlingMethod(SessionStatus status) {
		status.setComplete();
		return "connexion";
	}

}
