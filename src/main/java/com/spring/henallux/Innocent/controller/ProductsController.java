package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.ArticleDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.model.Article;
import com.spring.henallux.Innocent.model.Category;
import com.spring.henallux.Innocent.model.OrderLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping(value="/products")
public class ProductsController {

    private CategoryDataAccess categoryDataAccess;
    private ArticleDataAccess articleDataAccess;

    @Autowired
    public ProductsController(CategoryDataAccess categoryDataAccess, ArticleDataAccess articleDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.articleDataAccess = articleDataAccess;
    }

    @RequestMapping (value = "/{category}", method = RequestMethod.GET)
    public String showProducts(@PathVariable("category") String categoryId, Model model) {
        ArrayList<Category> categories = categoryDataAccess.getAllCategories();
        String categoryName = categories.stream().filter(c -> c.getId().equals(categoryId)).findFirst().orElse(null).getName();
        HashMap<String, Article> articles = articleDataAccess.getArticlesByCategory(categoryId);

        model.addAttribute("title", categoryName + " | Innocent");
        model.addAttribute("categories", categories);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("articles", articles);
        model.addAttribute("orderLine", new OrderLine());

        return "integrated:products";
    }

}
