package fr.eni.spring.bean;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Person {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String prenom;

	private String nom;

	private LocalDate ddn;

	@OneToOne(cascade = { CascadeType.PERSIST })
	private Address address;

	public Person() {
	}

	@Override
	public String toString() {
		return "Person [prenom=" + this.prenom + ", nom=" + this.nom + ", ddn=" + this.ddn + ", address=" + this.address
				+ "]";
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public LocalDate getDdn() {
		return this.ddn;
	}

	public void setDdn(LocalDate ddn) {
		this.ddn = ddn;
	}

	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
