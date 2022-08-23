package fr.eni.spring.bean;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Enchere {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private LocalDate dateEnchere;
	private float montant_enchere;
	private List<ArticleVendu> concerne;
	
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
	public List<ArticleVendu> getConcerne() {
		return concerne;
	}
	public void setConcerne(List<ArticleVendu> concerne) {
		this.concerne = concerne;
	}
}
