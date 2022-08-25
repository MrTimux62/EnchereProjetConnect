package fr.eni.spring.bean;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Enchere {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private LocalDate dateEnchere;
	private float montant_enchere;
	
	@ManyToOne
	private ArticleVendu concerne;
	
	public Enchere() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getDateEnchere() {
		return dateEnchere;
	}
	public void setDateEnchere(LocalDate dateEnchere) {
		this.dateEnchere = dateEnchere;
	}
	public float getMontant_enchere() {
		return montant_enchere;
	}
	public void setMontant_enchere(float montant_enchere) {
		this.montant_enchere = montant_enchere;
	}
	public ArticleVendu getConcerne() {
		return concerne;
	}
	public void setConcerne(ArticleVendu concerne) {
		this.concerne = concerne;
	}
}
