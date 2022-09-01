package com.asd.project.model.dao;

import com.asd.project.model.User;
import com.asd.project.utils.DB;

import java.sql.*;

public class UserDao {
    private final DB db;

    public UserDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public int create(String name, String email, String address, String phone, String role, String password) throws SQLException {
        String sqlQuery = "INSERT INTO User (name, email," +
                " address, phone_number, role, password) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, address);
        ps.setString(4, phone);
        ps.setString(5, role);
        ps.setString(6, password);
        ps.executeUpdate();
        ResultSet results = ps.getGeneratedKeys();
        if (results.next())
            return results.getInt(1);
        return 0;
    }

    public int create(User user) throws SQLException {
        String sqlQuery = "INSERT INTO User (name, email," +
                " address, phone_number, role, password) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getAddress());
        ps.setString(4, user.getPhoneNumber());
        ps.setString(5, user.getRole());
        ps.setString(6, user.getPassword());
        ps.executeUpdate();
        ResultSet results = ps.getGeneratedKeys();
        if (results.next())
            return results.getInt(1);
        return 0;
    }

    public User getUserByEmail(String email) throws SQLException {
        User user = new User();
        String query = "SELECT * FROM User WHERE email = ?";
        PreparedStatement ps = conn().prepareStatement(query);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user.setId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setEmail(rs.getString(3));
            user.setAddress(rs.getString(4));
            user.setPhoneNumber(rs.getString(5));
            user.setRole(rs.getString(6));
            user.setPassword(rs.getString(7));
            return user;
        }
        return null;

    }
}
