package com.asd.project_asd.model.dao;
import com.asd.project_asd.model.User;
import com.asd.project_asd.utils.DB;

import java.sql.*;

public class UserDao {
    private final DB db;
    public UserDao(DB db) {this.db = db;}

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public int create(String name, String email, String address, String phone, String role, String password) throws SQLException {
        String sqlQuery = "INSERT INTO User (name, email," +
                " address, phone_number, role, password) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3,address);
        ps.setString(4, phone);
        ps.setString(5, role);
        ps.setString(6, password);
        ps.executeUpdate();
        ResultSet results = ps.getGeneratedKeys();
        if(results.next())
            return results.getInt((1));
        return 0;
    }
}
