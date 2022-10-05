package com.nisrinekane.lamguagesjavacrud.services;


import com.nisrinekane.lamguagesjavacrud.models.Languages;
import com.nisrinekane.lamguagesjavacrud.repositories.LanguagesRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LanguagesService {
    // adding the languages repository as a dependency
    private final LanguagesRepository languagesRepository;

    public LanguagesService(LanguagesRepository languagesRepository) {

        this.languagesRepository = languagesRepository;
    }
    // returns all the expense
    public List<Languages> allLanguages() {
        return languagesRepository.findAll();
    }
    // creates a language
    public Languages createLanguage(Languages e) {

        return languagesRepository.save(e);
    }
    // deletes an expense
    public Languages deleteLanguages(long id) {
        languagesRepository.deleteById(id);
        return null;
    }

    // retrieves an expense
    public Languages findLanguages(Long id) {
        //optional: could exist or not
        Optional<Languages> optionalLanguages = languagesRepository.findById(id);
        //old version:
//        if(optionalLanguages.isPresent()) {
//            return optionalLanguages.get();
//        } else {
//            return null;
//        }
        //new version:
        return optionalLanguages.orElse(null);
    }

    public Languages updateLanguages(Long id, String name, String creator, String version) {
        Languages languages = findLanguages(id);
        languages.setName(name);
        languages.setCreator(creator);
        languages.setVersion(version);
        return languagesRepository.save(languages);
    }
}
