package com.nisrinekane.lamguagesjavacrud.repositories;

import com.nisrinekane.lamguagesjavacrud.models.Languages;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LanguagesRepository extends CrudRepository<Languages, Long> {
    // this method retrieves all the languages from the database
    List<Languages> findAll();
    // this method finds languages with creators containing the search string
    List<Languages> findByCreatorContaining(String search);
    // this method counts how many names contain a certain string
    Long countByNameContaining(String search);
    // this method deletes a language that starts with a specific title
    Long deleteByNameStartingWith(String search);

}