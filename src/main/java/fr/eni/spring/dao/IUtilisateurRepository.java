package fr.eni.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.eni.spring.bean.Utilisateur;

public interface IUtilisateurRepository extends JpaRepository<Utilisateur, Integer> {
 
}
