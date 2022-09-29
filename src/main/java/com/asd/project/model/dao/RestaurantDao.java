package com.asd.project.model.dao;

import com.asd.project.model.Restaurant;
import com.asd.project.model.User;
import com.asd.project.utils.DB;

import java.sql.*;
import java.util.ArrayList;

public class RestaurantDao {

    private final DB db;

    public RestaurantDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public Restaurant getRestaurant() throws SQLException {
        Restaurant restaurant = new Restaurant();
        String query = "SELECT * FROM Restaurant LIMIT 1";
        PreparedStatement ps = conn().prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            restaurant.setId(rs.getInt(1));
            restaurant.setName(rs.getString(2));
            restaurant.setType(rs.getString(3));
            restaurant.setPhone(rs.getInt(4));
            restaurant.setLocation(rs.getString(5));

            return restaurant;
        }
        return null;
    }

}