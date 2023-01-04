package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value="/")
@SessionAttributes({(Constants.CART), (Constants.NB_CART_ITEMS)})
public class WelcomeController {
    private CategoryDataAccess categoryDataAccess;

    @Autowired
    public WelcomeController(CategoryDataAccess categoryDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
    }

    @RequestMapping (method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("title", "Home | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        return "integrated:welcome";
    }

}
