package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/about")
public class AboutController {

    private CategoryDataAccess categoryDataAccess;

    @Autowired
    public AboutController(CategoryDataAccess categoryDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
    }


    @RequestMapping (method = RequestMethod.GET)
    public String about(Model model) {
        model.addAttribute("title", "About | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        return "integrated:about";
    }

}

