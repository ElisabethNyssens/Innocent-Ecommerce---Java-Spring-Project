package com.spring.henallux.Innocent.service;

import com.spring.henallux.Innocent.dataAccess.dao.UserDataAccess;
import com.spring.henallux.Innocent.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
    private UserDataAccess userDAO;

    @Autowired
    public UserDetailsServiceImplementation(UserDataAccess userDAO) {
        this.userDAO = userDAO;
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByUsername(username);
        if (user != null) {
            return user;
        }
        throw new UsernameNotFoundException("User not found");
    }
}
