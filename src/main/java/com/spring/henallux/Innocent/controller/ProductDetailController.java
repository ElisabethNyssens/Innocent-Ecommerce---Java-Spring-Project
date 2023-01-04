package com.spring.henallux.Innocent.controller;

import com.spring.henallux.Innocent.dataAccess.dao.ArticleDataAccess;
import com.spring.henallux.Innocent.dataAccess.dao.CategoryDataAccess;
import com.spring.henallux.Innocent.model.Article;
import com.spring.henallux.Innocent.model.Category;
import com.spring.henallux.Innocent.model.OrderLine;
import com.spring.henallux.Innocent.service.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value="/detail")
@SessionAttributes({(Constants.CART), (Constants.NB_CART_ITEMS)})
public class ProductDetailController {
    private CategoryDataAccess categoryDataAccess;
    private ArticleDataAccess articleDataAccess;

    @Autowired
    public ProductDetailController(CategoryDataAccess categoryDataAccess, ArticleDataAccess articleDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
        this.articleDataAccess = articleDataAccess;
    }


    @RequestMapping (value = "/{article}", method = RequestMethod.GET)
    public String showDetail(@PathVariable("article") String articleId, Model model) {
        model.addAttribute("title", "Product detail | Innocent");
        model.addAttribute("categories", categoryDataAccess.getAllCategories());
        String articleName = articleDataAccess.getArticleNameById(articleId);
        Article article = articleDataAccess.getArticleById(articleId);
        Category category = categoryDataAccess.getCategoryByName(article.getCategory().getName());

    /*    model.addAttribute("title", "Welcome page");*/
        model.addAttribute("articleName", articleName);
        model.addAttribute("article", article);
        model.addAttribute("category", category);
        model.addAttribute("orderLine", new OrderLine());

        return "integrated:productDetail";
    }
}
