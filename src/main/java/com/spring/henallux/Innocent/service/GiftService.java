package com.spring.henallux.Innocent.service;

import org.springframework.stereotype.Service;

@Service
public class GiftService {

    public GiftService() {}

    public String chooseGift(String hobby, int age) {
        if (age < 5)
            return "puzzle about " + hobby;
        else if (age < 10)
            return "DVD about " + hobby;
        else
            return "book about " + hobby;

    }
}
