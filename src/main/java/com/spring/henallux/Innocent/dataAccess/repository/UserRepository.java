package com.spring.henallux.Innocent.dataAccess.repository;

import com.spring.henallux.Innocent.dataAccess.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity,String> {
    UserEntity findByUsername(String username);
    Boolean existsUserEntityByEmail(String email);
}
