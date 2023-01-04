package com.spring.henallux.Innocent.model;

import java.util.GregorianCalendar;

public class Order {
    private Integer id;
    private GregorianCalendar date;
    private Boolean isPaid;
    private User user;

    public Order (GregorianCalendar date, Boolean isPaid, User user) {
        setDate(date);
        setPaid(isPaid);
        setUser(user);
    }

    public Order() {}

    public Integer getId() {
        return id;
    }

    public GregorianCalendar getDate() {
        return date;
    }

    public Boolean getPaid() {
        return isPaid;
    }

    public User getUser() {
        return user;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDate(GregorianCalendar date) {
        this.date = date;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setPaid(Boolean paid) {
        isPaid = paid;
    }
}
