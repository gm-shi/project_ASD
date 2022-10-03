package com.asd.project.model.dao;

import com.asd.project.utils.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDao {
    private final DB db;
    private OrderDao(DB db){
        this.db = db;
    }

    private Connection conn() throws SQLException{
        return db.connection();
    }

    private void viewcart(int userid) throws SQLException{
        String SQLQuery = "SELECT * FROM Cart WHERE userid = ?";
        PreparedStatement ps = conn().prepareStatement(SQLQuery);
        ps.setInt(1, userid);
        ResultSet resultSet = ps.executeQuery();

    }

    private void add(int userid,String dishname, int updatedishes) throws SQLException{
        String SQLAdd = "";
    }
    private void deletedish(int userid,String dishname) throws SQLException{
        String SQLAdd = "";
    }
}
