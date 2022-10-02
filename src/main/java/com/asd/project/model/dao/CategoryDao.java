package com.asd.project.model.dao;

import com.asd.project.model.Category;
import com.asd.project.model.Dish;
import com.asd.project.model.UserAccessLog;
import com.asd.project.utils.DB;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;


public class CategoryDao {

    private final DB db;

    public CategoryDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public int create(String name, String description) throws SQLException {
        String query = "INSERT INTO Category(name, description) VALUES (?,?)";
        PreparedStatement ps = conn().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, description);
        ps.executeUpdate();
        ResultSet results = ps.getGeneratedKeys();
        if (results.next())
            return results.getInt(1);
        return 0;
    }

    public ArrayList<Category> getAllCategories() throws SQLException {
        ArrayList<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";
        PreparedStatement statement = conn().prepareStatement(query);
        ResultSet result = statement.executeQuery();
        while (result.next()) {
            categories.add(new Category(result.getInt("id"), result.getString("name"), result.getString("description")));
        }
        return categories;

    }

    public ArrayList<Dish> getDishes(int id) throws SQLException {
        ArrayList<Dish> dishes = new ArrayList<>();
        String query = "SELECT * FROM Dish WHERE category_id = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, id);
        ResultSet result = statement.executeQuery();
        while (result.next()) {
            dishes.add(new Dish(result.getInt("id"), result.getString("name"), result.getString("description"), result.getDouble("price"), result.getInt("category_id")));
        }
        return dishes;
    }
}
