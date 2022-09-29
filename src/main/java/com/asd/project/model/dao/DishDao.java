package com.asd.project.model.dao;

import com.asd.project.utils.DB;

import java.sql.*;


public class DishDao {

    private final DB db;

    public DishDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public int create(String name, String description, double price, int category_id) throws SQLException {
        String query = "INSERT INTO Dish(name, description, price, category_id) VALUES (?,?,?,?)";
        PreparedStatement ps = conn().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, description);
        ps.setDouble(3, price);
        ps.setInt(4, category_id);
        ps.executeUpdate();
        ResultSet results = ps.getGeneratedKeys();
        if (results.next())
            return results.getInt(1);
        return 0;
    }
}
