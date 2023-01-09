package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.OrderDataAccess;
import com.spring.henallux.Innocent.model.Order;
import com.spring.henallux.Innocent.model.User;
import com.spring.henallux.Innocent.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;

@Controller
@RequestMapping(value="/account")
@SessionAttributes({(Constants.CART), (Constants.NB_CART_ITEMS)})
public class AccountController {
    private CategoryDataAccess categoryDataAccess;
    private OrderDataAccess orderDataAccess;

    @Autowired
    public AccountController(CategoryDataAccess categoryDataAccess, OrderDataAccess orderDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.orderDataAccess = orderDataAccess;
    }

    @RequestMapping (method = RequestMethod.GET)
    public String account(Model model, Authentication authentication) {
        model.addAttribute("title", "Account | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());

        User currentUser = (User) authentication.getPrincipal();
        ArrayList<Order> orders = orderDataAccess.getAllOrdersFromUser(currentUser.getUsername());

        orders.forEach((order -> {
            double total = orderDataAccess.getTotalAmountOrder(order.getId());
            order.setTotalAmount(total);
        }));
        model.addAttribute("orders",orders);

        return "integrated:account";
    }
}
