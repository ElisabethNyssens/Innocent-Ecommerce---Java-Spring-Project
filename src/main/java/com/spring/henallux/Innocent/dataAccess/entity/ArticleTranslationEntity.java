package com.spring.henallux.Innocent.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="article_translations")
public class ArticleTranslationEntity {
    @Id
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="article_id")
    private String articleId;

    @Column(name="language_id")
    private String languageCode;

    public ArticleTranslationEntity() {}

    public ArticleTranslationEntity(Integer id, String name, String articleId, String languageCode) {
        setId(id);
        setName(name);
        setArticleId(articleId);
        setLanguageCode(languageCode);
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getArticleId() {
        return articleId;
    }

    public String getLanguageCode() {
        return languageCode;
    }
}
