package com.spring.henallux.Innocent.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class UserEntity {

    @Id
    @Column(name="username")
    private String username;

    @Column(name="firstname")
    private String firstname;

    @Column(name="lastname")
    private String lastname;

    @Column(name="password")
    private String password;

    @Column(name="email")
    private String email;

    @Column(name="phone_number")
    private String phoneNumber;

    @Column(name="address")
    private String address;

    @Column(name="authorities")
    private String authorities;

    @Column(name="non_expired")
    private Boolean nonExpired;

    @Column(name="non_locked")
    private Boolean nonLocked;

    @Column(name="credentials_non_expired")
    private Boolean credentialsNonExpired;

    @Column(name="enabled")
    private Boolean enabled;

    public UserEntity() {}

    public void setUsername(String username) {
        this.username = username;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public void setCredentialsNonExpired(Boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }
    public void setAuthorities(String authorities) {
        this.authorities = authorities;
    }
    public void setAccountNonExpired(Boolean nonExpired) {
        this.nonExpired = nonExpired;
    }
    public void setAccountNonLocked(Boolean nonLocked) {
        this.nonLocked = nonLocked;
    }
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getUsername() {
        return username;
    }
    public String getFirstname() {
        return firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public String getPassword() {
        return password;
    }
    public String getEmail() {
        return email;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public String getAddress() {
        return address;
    }
    public Boolean getCredentialsNonExpired() {
        return credentialsNonExpired;
    }
    public String getAuthorities() {
        return authorities;
    }
    public Boolean getAccountNonExpired() {
        return nonExpired;
    }
    public Boolean getAccountNonLocked() {
        return nonLocked;
    }
    public Boolean getEnabled() {
        return enabled;
    }
}
