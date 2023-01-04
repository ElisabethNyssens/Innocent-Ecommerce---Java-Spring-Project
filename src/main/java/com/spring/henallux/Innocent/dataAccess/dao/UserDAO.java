package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.entity.UserEntity;
import com.spring.henallux.Innocent.dataAccess.repository.UserRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import com.spring.henallux.Innocent.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserDAO implements UserDataAccess {
    private UserRepository userRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public UserDAO(UserRepository userRepository, ProviderConverter providerConverter) {
        this.userRepository = userRepository;
        this.providerConverter = providerConverter;
    }

    public User findByUsername(String username) {
        User user = providerConverter.userEntityToUserModel(userRepository.findByUsername(username));
        return user;
    }

    public Boolean existsByUsername(String username) {
        return userRepository.existsById(username);
    }

    public Boolean existsByEmail(String email) {
        return userRepository.existsUserEntityByEmail(email);
    }

    public User saveUser(User user) {
        UserEntity userEntity = providerConverter.userModelToUserEntity(user);
        userEntity = userRepository.save(userEntity);
        return providerConverter.userEntityToUserModel(userEntity);
    }
}
