package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.UserDataAccess;
import com.spring.henallux.Innocent.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login") // = LOGIN_REQUEST
public class LoginController {

    private CategoryDataAccess categoryDataAccess;
    private UserDataAccess userDataAccess;

    @Autowired
    public LoginController(CategoryDataAccess categoryDataAccess, UserDataAccess userDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.userDataAccess = userDataAccess;
    }

    @RequestMapping (method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        model.addAttribute("title", "Login | Innocent");
        model.addAttribute("user", new User());

        return "integrated:login";
    }

}
