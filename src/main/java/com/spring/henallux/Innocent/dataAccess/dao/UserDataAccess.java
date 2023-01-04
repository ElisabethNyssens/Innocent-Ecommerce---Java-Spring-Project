package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.model.User;

public interface UserDataAccess {
    User findByUsername(String username);
    Boolean existsByUsername(String username);
    Boolean existsByEmail(String email);

    User saveUser(User user);
}
