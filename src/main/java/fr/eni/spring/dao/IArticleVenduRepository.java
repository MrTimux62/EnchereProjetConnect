package fr.eni.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.eni.spring.bean.ArticleVendu;

public interface IArticleVenduRepository extends JpaRepository<ArticleVendu, Integer> {

}
