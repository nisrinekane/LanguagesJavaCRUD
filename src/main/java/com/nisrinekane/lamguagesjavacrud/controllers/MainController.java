package com.nisrinekane.lamguagesjavacrud.controllers;

import com.nisrinekane.lamguagesjavacrud.models.Languages;
import com.nisrinekane.lamguagesjavacrud.models.Languages;
import com.nisrinekane.lamguagesjavacrud.services.LanguagesService;
import com.nisrinekane.lamguagesjavacrud.services.LanguagesService;
import net.bytebuddy.implementation.bind.MethodDelegationBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
@Controller
public class MainController {
    @Autowired
    LanguagesService languagesService;

    //show one language
    @GetMapping("/languages/{languageId}")
    public String index(Model model, @PathVariable("languageId") Long languageId) {
        Languages languages = languagesService.findLanguages(languageId);
        System.out.println(languages);
        model.addAttribute("languages", languages);
        return "show.jsp";
    }

    //show all languages
    @RequestMapping("/languages")
    public String index(Model model,
                        @ModelAttribute("language") Languages language) {
        List<Languages> languages = languagesService.allLanguages();
        model.addAttribute("languages", languages);
        return "index.jsp";
    }

    //post method to create an language using inversion of control, Binding result for errors
    @PostMapping("/language")
    public String create(@Valid @ModelAttribute("language") Languages language, BindingResult result) {
        if (result.hasErrors()) {
            return "index.jsp";
        }
        languagesService.createLanguage(language);
        return "redirect:/languages/";
    }

    //update language: get the target language/render the form
    @RequestMapping("/languages/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Languages language = languagesService.findLanguages(id);
        model.addAttribute("language", language);
        return "edit.jsp";
    }

    //process the update request
    @PutMapping ("/languages/{id}")
    public String update(@Valid @ModelAttribute("language") Languages language, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            languagesService.updateLanguages(language.getId(), language.getName(), language.getCreator(),language.getVersion());
            return "redirect:/languages";
        }
    }

    //delete an expense
    @DeleteMapping("/languages/{id}")
    public String destroy(@PathVariable("id") Long id) {
        languagesService.deleteLanguages(id);
        return "redirect:/languages";
    }
}




