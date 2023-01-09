package com.spring.henallux.Innocent.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

public class OrderLine {
    private Article article;
    private String articleName;
    @NotNull
    @PositiveOrZero
    private Integer nbArticles;

    public OrderLine() {
        setNbArticles(1);
    }

    public double getTotalPrice() {
        return nbArticles * article.getUnitPrice();
    }

    public void setNbArticles(Integer nbArticles) {
        if (nbArticles > 0) {
            this.nbArticles = nbArticles;
        }
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public void setArticleName(String articleName) {
        this.articleName = articleName;
    }

    public Integer getNbArticles() {
        return nbArticles;
    }

    public Article getArticle() {
        return article;
    }

    public String getArticleName() {
        return articleName;
    }
}
