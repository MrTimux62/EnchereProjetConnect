package fr.eni.spring.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.eni.spring.bean.Retrait;

public interface IRetraitRepository extends JpaRepository<Retrait, Integer> {

}
