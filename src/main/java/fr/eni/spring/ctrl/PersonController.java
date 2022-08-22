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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import fr.eni.spring.bean.Person;
import fr.eni.spring.dao.IPersonRepository;

@Controller()
@RequestMapping("person")
public class PersonController {

	@Autowired
	private IPersonRepository personDAO;

	@PostMapping
	private ModelAndView insert(Person p) {

		personDAO.save(p);

		return display();
	}

	@GetMapping
	private ModelAndView display() {

		List listePersonnes = personDAO.findAll();

		return new ModelAndView("listerPersonnes", "listePersonnes", listePersonnes);
	}
	
	@GetMapping("/{id:\\d+}")
	private ModelAndView getById(@PathVariable("id") int id) { 
		
		Person person = personDAO.getReferenceById(id);
		
		return new ModelAndView("result", "p", person);
		
	}

	@GetMapping("delete/{id:\\d+}")
	private ModelAndView deleteById(@PathVariable("id") int id) {
		
		personDAO.deleteById(id);
		
		return display();
	}
	
	@GetMapping("load/{id:\\d+}")
	private ModelAndView loadById(@PathVariable("id") int id) {
		
		Person person = personDAO.getReferenceById(id);
		
		return new ModelAndView("updatePersonne", "p", person);
	}
	
	@PostMapping("update")
	private ModelAndView updateById(Person p) {
		
		personDAO.save(p);
		
		return display();
	}

}
