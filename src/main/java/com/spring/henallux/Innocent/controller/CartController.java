package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.ArticleDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.model.Article;
import com.spring.henallux.Innocent.model.CartBadge;
import com.spring.henallux.Innocent.model.OrderLine;
import com.spring.henallux.Innocent.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;

@Controller
@RequestMapping(value="/cart")
@SessionAttributes({(Constants.CART), (Constants.NB_CART_ITEMS)})
public class CartController {
    private CategoryDataAccess categoryDataAccess;
    private ArticleDataAccess articleDataAccess;

    @Autowired
    public CartController(CategoryDataAccess categoryDataAccess,ArticleDataAccess articleDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.articleDataAccess = articleDataAccess;
    }

    // cart = nom attribut créé et init par la méthode
    @ModelAttribute(Constants.CART)
    public HashMap<String, OrderLine> cart() {
        return new HashMap<>();
    }

    @ModelAttribute(Constants.NB_CART_ITEMS)
    public CartBadge nbCartItems() {
        return new CartBadge();
    }

    @RequestMapping (method = RequestMethod.GET)
    public String about(Model model, @ModelAttribute(value = Constants.CART) HashMap<String, OrderLine> cart) {
        model.addAttribute("title", "Shopping cart | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        model.addAttribute("orderLine", new OrderLine());

        if (!model.containsAttribute(Constants.CART)) {
            model.addAttribute(Constants.CART,new HashMap<String, OrderLine>());
        }
        double subtotal = cart.values().stream().map(item -> item.getNbArticles() * item.getArticle().getUnitPrice()).reduce(0., Double::sum);
        model.addAttribute("subtotal", String.format("%.2f", subtotal));
        model.addAttribute("totalCost", String.format("%.2f", subtotal + 3));

        return "integrated:cart";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/add/{id}")
    public String addToCart(@ModelAttribute(value = Constants.CART) HashMap<String, OrderLine> cart,
                            @ModelAttribute(value = Constants.NB_CART_ITEMS) CartBadge nbCartItems,
                            @PathVariable(value = "id") String id,
                            @Valid @ModelAttribute(value = "orderLine") OrderLine orderLine,
                            final BindingResult errors
    ) {
        if (!errors.hasErrors()) {
            if (cart.containsKey(id)) {
                cart.get(id).setNbArticles(cart.get(id).getNbArticles() + orderLine.getNbArticles());
            } else {
                String articleName = articleDataAccess.getArticleNameById(id);
                Article article = articleDataAccess.getArticleById(id);
                orderLine.setArticle(article);
                orderLine.setArticleName(articleName);
                cart.put(id, orderLine);
            }
            int totCartItems = cart.values().stream().map(item -> item.getNbArticles()).reduce(0, (prevItem, tot) -> tot + prevItem);
            nbCartItems.setValue(totCartItems);
        }
        return "redirect:/cart";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/remove/{id}")
    public String removeFromCart(@ModelAttribute(value = Constants.CART) HashMap<String, OrderLine> cart,
                            @ModelAttribute(value = Constants.NB_CART_ITEMS) CartBadge nbCartItems,
                            @PathVariable(value = "id") String id
    ) {
        if (cart.get(id).getNbArticles() == 1)
            cart.remove(id);
        else
            cart.get(id).setNbArticles(cart.get(id).getNbArticles() - 1);

        nbCartItems.setValue(nbCartItems.getValue() - 1);

        return "redirect:/cart";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/removeall/{id}")
    public String removeAllFromCart(@ModelAttribute(value = Constants.CART) HashMap<String, OrderLine> cart,
                                 @ModelAttribute(value = Constants.NB_CART_ITEMS) CartBadge nbCartItems,
                                 @PathVariable(value = "id") String id
    ) {
        nbCartItems.setValue(nbCartItems.getValue() -  cart.get(id).getNbArticles());
        cart.remove(id);

        return "redirect:/cart";
    }

}
