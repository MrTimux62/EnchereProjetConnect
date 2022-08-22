package fr.eni.spring.dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Program {

	public static void main(String[] args) {

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("EncherePU");
		emf.createEntityManager().close();
		emf.close();

	}

}
