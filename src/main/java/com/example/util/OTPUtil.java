package com.example.util;

import java.util.Random;

public class OTPUtil {
    public static String generateOTP() {
        Random rand = new Random();
        return String.valueOf(100000 + rand.nextInt(900000));
    }
}
