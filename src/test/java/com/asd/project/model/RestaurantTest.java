package com.asd.project.model;

import com.asd.project.model.dao.RestaurantDao;
import com.asd.project.utils.DB;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class RestaurantTest {
    DB db;
    private Restaurant tester;
    private RestaurantDao restaurantDao;
    private int id;
    private String name;
    private String phone;
    private String location;
    private String type;

    public RestaurantTest() throws SQLException {
        db = new DB();
        restaurantDao = new RestaurantDao(db);
        this.name = "Tester";
        this.phone = "0499999999";
        this.location = "myhome";
        this.type = "test12123";
    }

    @AfterAll
    public void cleanup() throws SQLException {
        restaurantDao.getRestaurantById(id);
        tester = restaurantDao.getRestaurantById(id);
        assertNull(tester);
    }


    @Test
    void getRestaurant() {
    }

    @Test
    void getRestaurantById() {
    }

    @Test
    void updaterest() {
    }
}