package com.asd.project.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    protected final String URL = System.getenv("DB_URL");
    protected  String db = System.getenv("DB_NAME");
    protected  String dbUser = System.getenv("DB_USER");
    protected  String dbPassword = System.getenv("DB_PASSWORD");
    protected String dbDriver = "com.mysql.cj.jdbc.Driver";
    protected Connection conn;

    public DB() throws SQLException {
        System.out.println(URL);
        System.out.println(db);
        System.out.println(dbUser);
        System.out.println(dbPassword);

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
