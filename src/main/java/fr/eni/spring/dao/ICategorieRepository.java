package fr.eni.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.eni.spring.bean.Categorie;

public interface ICategorieRepository extends JpaRepository<Categorie, Integer> {

}
