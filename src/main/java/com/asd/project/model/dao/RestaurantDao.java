package com.asd.project.model.dao;

import com.asd.project.model.Restaurant;
import com.asd.project.utils.DB;
import java.sql.*;
import java.util.ArrayList;

public class RestaurantDao {

    private final DB db;

    public RestaurantDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException {
        return db.connection();
    }


}
