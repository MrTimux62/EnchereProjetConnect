package fr.eni.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.eni.spring.bean.Enchere;

public interface IEnchereRepository extends JpaRepository<Enchere, Integer> {
	
}
