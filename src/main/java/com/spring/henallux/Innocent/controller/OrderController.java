package com.spring.henallux.Innocent.controller;


import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.OrderDataAccess;
import com.spring.henallux.Innocent.model.CartBadge;
import com.spring.henallux.Innocent.model.Order;
import com.spring.henallux.Innocent.model.OrderLine;
import com.spring.henallux.Innocent.model.User;
import com.spring.henallux.Innocent.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value="/order")
@SessionAttributes({(Constants.CART), (Constants.NB_CART_ITEMS)})
public class OrderController {
    private CategoryDataAccess categoryDataAccess;
    private OrderDataAccess orderDataAccess;

    @Autowired
    public OrderController(CategoryDataAccess categoryDataAccess, OrderDataAccess orderDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.orderDataAccess = orderDataAccess;
    }

    @RequestMapping (method = RequestMethod.GET)
    public String orderPayment(Model model, @ModelAttribute(value = Constants.CART) HashMap<String, OrderLine> cart, Authentication authentication) {
        model.addAttribute("title", "Order detail | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());

        double subtotal = cart.values().stream().map(item -> item.getNbArticles() * item.getArticle().getUnitPrice()).reduce(0., Double::sum);
        model.addAttribute("subtotal", String.format("%.2f", subtotal));
        model.addAttribute("totalCost", String.format("%.2f", subtotal + 3));
        model.addAttribute("amountToPay",subtotal + 3);
        System.out.println("PRINCIPAL : " + (User) authentication.getPrincipal());
        Order order = new Order(new GregorianCalendar(),false, (User) authentication.getPrincipal());

        List<OrderLine> orderLines = cart.values().stream().toList();
        orderDataAccess.saveOrder(order, orderLines);

        return "integrated:order";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/success")
    public String success(Model model,
                          @ModelAttribute(value = Constants.CART) HashMap<String, OrderLine> cart,
                          @ModelAttribute(value = Constants.NB_CART_ITEMS) CartBadge nbCartItems) {
        model.addAttribute("title", "Thank you for your order | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        cart.clear();
        nbCartItems.setValue(0);

        return "integrated:success";
    }
}
