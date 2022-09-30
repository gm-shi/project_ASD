package com.asd.project.model.dao;

import com.asd.project.model.Dish;
import com.asd.project.model.UserAccessLog;
import com.asd.project.utils.DB;

import java.sql.*;
import java.util.ArrayList;

public class CartDao {
        private final DB db;
        public CartDao(DB db) {
            this.db = db;
        }
        private Connection conn() throws SQLException {
            return db.connection();
        }

        public void add(int userId, int dishId) throws SQLException {
            String query = "INSERT INTO Cart(user_id, dish_id) VALUES (?,?)";
            PreparedStatement ps = conn().prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, dishId);
            ps.executeUpdate();
        }


    public ArrayList<Integer> getDishIds(int userId) throws SQLException {
        ArrayList<Integer> ids = new ArrayList<>();
        String query = "SELECT dish_id FROM Cart WHERE user_id = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            ids.add(resultSet.getInt("dish_id"));
        }
        return ids;
    }
}


