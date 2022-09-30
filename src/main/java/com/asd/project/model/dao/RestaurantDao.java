package com.asd.project.model.dao;

import com.asd.project.model.Restaurant;
import com.asd.project.model.User;
import com.asd.project.utils.DB;

import java.sql.*;

public class RestaurantDao {

    private final DB db;

    public RestaurantDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public Restaurant getRestaurant() throws SQLException { //view to re 1.0
        Restaurant restaurant = new Restaurant();
        String query = "SELECT * FROM Restaurant LIMIT 1";
        PreparedStatement ps = conn().prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            restaurant.setId(rs.getInt(1));
            restaurant.setName(rs.getString(2));
            restaurant.setType(rs.getString(3));
            restaurant.setPhone(rs.getString(4));
            restaurant.setLocation(rs.getString(5));

            return restaurant;
        }
        return null;
    }
    public boolean updaterest(String name, String phone, String location, String type) throws  SQLException {
        try {
            String query = "UPDATE Restaurant SET name = ?, phone = ?, location = ?, type = ? ";
            PreparedStatement ps = conn().prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, location);
            ps.setString(4, type);
            ps.execute();
            return true;
        }catch (Exception e) {
            return false;
        }
    }


    public Restaurant getRestaurantById(int id) throws SQLException {
        Restaurant restaurant = new Restaurant();
        String query = "SELECT * FROM Restaurant WHERE id = ?";
        PreparedStatement ps = conn().prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            restaurant.setId(rs.getInt(1));
            restaurant.setName(rs.getString(2));
            restaurant.setPhone(rs.getString(3));
            restaurant.setLocation(rs.getString(4));
            restaurant.setType(rs.getString(5));
            return restaurant;
        }
        return null;

    }




}