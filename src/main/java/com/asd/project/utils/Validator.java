package com.asd.project.utils;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Validator implements Serializable {


    private static String emailPattern = "/^\\S+@\\S+\\.\\S+$/";
    private static String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";
    private static String passwordPattern = "{4,}$";

    public static boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches();

    }


    public static boolean checkEmpty(String email, String password) {

        return email.isEmpty() || password.isEmpty();

    }

    public static boolean checkEmpty(String content) {
        return content.isEmpty();
    }


    public static boolean validateEmail(String email) {

        return validate(emailPattern, email);

    }


    public static boolean validateName(String name) {

        return validate(namePattern, name);

    }


    public static boolean validatePassword(String password) {

        return password.length() < 4;

    }
}