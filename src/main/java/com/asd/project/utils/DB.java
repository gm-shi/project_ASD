package com.asd.project.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    protected final String URL = "jdbc:mysql://database-asd-project.cjsubjzglg6d.ap-southeast-2.rds.amazonaws.com:3306/";
    protected  String db = "ASD_DB";
    protected  String dbUser = "admin";
    protected  String dbPassword = "123456789";
    protected String dbDriver = "com.mysql.cj.jdbc.Driver";
    protected Connection conn;

    public DB() throws SQLException {
        try {
            Class.forName(this.dbDriver).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.conn = DriverManager.getConnection(URL + db + "?serverTimezone=Australia/Sydney", dbUser, dbPassword);

    }

    public Connection connection() throws SQLException {
        if (!this.conn.isClosed()) {
            return this.conn;
        }
        this.conn = DriverManager.getConnection(URL + db + "?serverTimezone=Australia/Sydney", dbUser, dbPassword);
        return this.conn;
    }

    public void dispose() throws SQLException {
        this.conn.close();
    }
}
