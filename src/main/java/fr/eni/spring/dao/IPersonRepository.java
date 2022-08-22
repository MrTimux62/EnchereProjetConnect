package fr.eni.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.eni.spring.bean.Person;

public interface IPersonRepository extends JpaRepository<Person, Integer> {
 
}
