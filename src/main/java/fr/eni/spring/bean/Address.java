package fr.eni.spring.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String codePostal;

	private String nomVille;

	public Address() {
	}

	public String getCodePostal() {
		return this.codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getNomVille() {
		return this.nomVille;
	}

	public void setNomVille(String nomVille) {
		this.nomVille = nomVille;
	}

	//@Override
	public String toString() {
		return "Address [codePostal=" + this.codePostal + ", nomVille=" + this.nomVille + "]";
	}

}
