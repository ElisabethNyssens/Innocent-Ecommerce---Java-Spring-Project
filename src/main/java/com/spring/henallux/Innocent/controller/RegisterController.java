package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.UserDataAccess;
import com.spring.henallux.Innocent.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
@RequestMapping(value="/register")
public class RegisterController {
    private CategoryDataAccess categoryDataAccess;
    private UserDataAccess userDataAccess;

    @Autowired
    public RegisterController(CategoryDataAccess categoryDataAccess, UserDataAccess userDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.userDataAccess = userDataAccess;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("title", "Register | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        model.addAttribute("newUser", new User());

        return "integrated:register";
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String getRegisterFormData (Model model, @Valid @ModelAttribute(value = "newUser") User userForm,
                               BindingResult errors) {
        boolean validInputs = true;

        if (userDataAccess.existsByUsername(userForm.getUsername())) {
            errors.rejectValue("username", "username.alreadyUsed");
            validInputs = false;
        }
        if (userDataAccess.existsByEmail(userForm.getEmail())) {
            errors.rejectValue("email", "email.alreadyUsed");
            validInputs = false;
        }
        if (!userForm.getPassword().equals(userForm.getConfirmedPassword())) {
            errors.rejectValue("password", "password.notMatching");
            validInputs = false;
        }

        if(!errors.hasErrors() && validInputs) {
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            userForm.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));

            userForm.setAccountNonLocked(true);
            userForm.setAccountNonExpired(true);
            userForm.setEnabled(true);
            userForm.setCredentialsNonExpired(true);
            userForm.setAuthorities("ROLE_USER");

            try {
                userDataAccess.saveUser(userForm);
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                Authentication newAuthentication = new UsernamePasswordAuthenticationToken(userForm,authentication.getCredentials(),authentication.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(newAuthentication);
                return "redirect:/";
            } catch (Exception e) {
                model.addAttribute("error", "error");
                return "integrated:register";
            }
        } else {
          /*  System.out.println(errors);*/
            return "integrated:register";
        }
    }
}
