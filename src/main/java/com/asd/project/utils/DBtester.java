package com.asd.project.utils;

import com.asd.project.model.dao.UserDao;
import com.asd.project.utils.DB;

import java.sql.SQLException;

public class DBtester {


    public static void main(String[] args) throws SQLException {
        DB db = new DB();
        UserDao userDao = new UserDao(db);
        try {
           int userId = userDao.create("testing", "tes1111t1111ing2@213"
                    , "address", "123123", "Customer", "123123");
            System.out.println(userId);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
