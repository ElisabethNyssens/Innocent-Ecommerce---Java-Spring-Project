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
@RequestMapping(value="/account")
@SessionAttributes({(Constants.CART), (Constants.NB_CART_ITEMS)})
public class AccountController {
    private CategoryDataAccess categoryDataAccess;

    @Autowired
    public AccountController(CategoryDataAccess categoryDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
    }


    @RequestMapping (method = RequestMethod.GET)
    public String account(final Model model) {
        model.addAttribute("title", "Account | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        return "integrated:account";
    }
}
