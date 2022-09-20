package com.asd.project.model.dao;

import com.asd.project.model.UserAccessLog;
import com.asd.project.utils.DB;

import java.sql.*;
import java.util.ArrayList;


public class UserAccessLogDao {
    private final DB db;

    public UserAccessLogDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }

    public int insert(int userId, String accessType)
            throws SQLException {
        String sqlQuery = "INSERT INTO User_access_log" +
                " (id, access_type)" +
                "VALUES (?, ?);";
        PreparedStatement statement = conn().prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, String.valueOf(userId));
        statement.setString(2, accessType);
        statement.executeUpdate();
        ResultSet resultSet = statement.getGeneratedKeys();
        if (resultSet.next()) {
            return resultSet.getInt(1);
        }
        return 0;
    }

    public ArrayList<UserAccessLog> getUserAccessLog(int id) throws SQLException {
        ArrayList<UserAccessLog> userAccessLogs = new ArrayList<>();
        String query = "SELECT * FROM User_access_log WHERE id = ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            userAccessLogs.add(new UserAccessLog((resultSet.getInt("id")),
                    resultSet.getString("access_type"),
                    new Date(resultSet.getTimestamp("time").getTime())));
        }
        return userAccessLogs;
    }

    public ArrayList<UserAccessLog> getUserAccessLogByDate(int id, String date) throws SQLException {
        ArrayList<UserAccessLog> userAccessLogs = new ArrayList<>();
        String query = "SELECT * FROM User_access_log WHERE id = ? AND User_access_log.time LIKE ?";
        PreparedStatement statement = conn().prepareStatement(query);
        statement.setInt(1, id);
        statement.setString(2, date + "%");
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            userAccessLogs.add(new UserAccessLog((resultSet.getInt("id")),
                    resultSet.getString("access_type"),
                    new Date(resultSet.getTimestamp("time").getTime())));
        }
        return userAccessLogs;
    }

}
