package fr.eni.spring.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import fr.eni.spring.bean.Utilisateur;
import fr.eni.spring.dao.IUtilisateurRepository;

@Controller()
@SessionAttributes("session_user")
@RequestMapping("")
public class UtilisateurController {

	@Autowired
	private IUtilisateurRepository utilisateurDAO;

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
	
	@GetMapping("/profil")
	private ModelAndView page_profil() {

		return new ModelAndView("profil");
	}
	
	@PostMapping("/connexion")
	private ModelAndView connexion_utilisateur(String username, String password) {
		
		List<Utilisateur> liste_utilisateur = utilisateurDAO.findAll();
		ModelAndView modelandview = new ModelAndView();
		
		modelandview.setViewName("liste_enchere");
		
		for (Utilisateur utilisateur : liste_utilisateur) {
			if (utilisateur.getPseudo().equals(username) && utilisateur.getMotDePasse().equals(password)) {
				System.out.println("Connecté");
				modelandview.addObject("session_user", utilisateur.getNoUtilisateur());
			}
		}
		
		return modelandview;
	}
	
	@PostMapping("/inscription")
	private ModelAndView inscription_utilisateur(Utilisateur u) {

		utilisateurDAO.save(u);
		
		return new ModelAndView("inscription");
	}

}
