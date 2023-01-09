package com.spring.henallux.Innocent.dataAccess.entity;

import javax.persistence.*;
import java.util.GregorianCalendar;

@Entity
@Table(name="orders")
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="date")
    private GregorianCalendar date;

    @Column(name="is_paid")
    private Boolean isPaid;

    @JoinColumn(name = "user", referencedColumnName = "username")
    @ManyToOne
    private UserEntity userEntity;

    public OrderEntity() {}

    public OrderEntity(Integer id, GregorianCalendar date, Boolean isPaid, UserEntity userEntity) {
        setId(id);
        setDate(date);
        setPaid(isPaid);
        setUserEntity(userEntity);
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDate(GregorianCalendar date) {
        this.date = date;
    }

    public void setPaid(Boolean paid) {
        isPaid = paid;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public Integer getId() {
        return id;
    }

    public GregorianCalendar getDate() {
        return date;
    }

    public Boolean getPaid() {
        return isPaid;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }
}
