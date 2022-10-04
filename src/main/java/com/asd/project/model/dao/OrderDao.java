package com.asd.project.model.dao;

import com.asd.project.model.Order;
import com.asd.project.utils.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDao {
    private final DB db;
    public OrderDao(DB db){
        this.db = db;
    }

    private Connection conn() throws SQLException{
        return db.connection();
    }

    public ArrayList<Order> viewcart(int userid) throws SQLException{
        ArrayList<Order> OrderArraylist = new ArrayList<>();
        String SQLQuery = "SELECT name,price,quantity,dish_id FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id WHERE user_id =?";
        PreparedStatement ps = conn().prepareStatement(SQLQuery);
        ps.setInt(1, userid);
        ResultSet resultSet = ps.executeQuery();
        while(resultSet.next()){
            OrderArraylist.add(new Order((resultSet.getString("name")),
                    resultSet.getDouble("price"),
                    resultSet.getInt("quantity"),
                    resultSet.getInt("dish_id")));
        }
        return OrderArraylist;
    }

    public void addquantity(int userid,int dishid) throws SQLException{
        String SQLMinCheck = "SELECT quantity FROM Cart FULL OUTER JOIN DISH on Cart.dish_id = Dish.id Where user_id = ? and name = ?";
        PreparedStatement ps = conn().prepareStatement(SQLMinCheck);
        ps.setInt(1, userid);
        ps.setInt(2,dishid);
        ResultSet resultSet = ps.executeQuery();
        int Quantity = resultSet.getInt("quantity");
        int QuanAdd1 = Quantity + 1;
        String SQLAdd = "UPDATE quantity = ? Cart FULL OUTER JOIN Dish ON Cart.dish_id = Dish.id SET Cart.dish_id = Dish.id WHERE user_id = ? and dishid = ?";
        PreparedStatement psmin = conn().prepareStatement(SQLAdd);
        psmin.setInt(1,QuanAdd1);
        psmin.setInt(2,userid);
        psmin.setInt(3,dishid);
        psmin.executeQuery();
    }

    public void minusquantity(int userid,int dishid) throws SQLException{
        String SQLMinCheck = "SELECT quantity FROM Cart FULL OUTER JOIN DISH on Cart.dish_id = Dish.id Where user_id = ? and name = ?";
        PreparedStatement ps = conn().prepareStatement(SQLMinCheck);
        ps.setInt(1, userid);
        ps.setInt(2, dishid);
        ResultSet resultSet = ps.executeQuery();
        int Quantity = resultSet.getInt("quantity");
        if(Quantity == 1){
            deletedish(userid, dishid);
        }
        else{
            int QuanMin1 = Quantity - 1;
            String SQLMin1 = "UPDATE quantity = ? Cart FULL OUTER JOIN Dish ON Cart.dish_id = Dish.id SET Cart.dish_id = Dish.id WHERE user_id = ? and dishname = ?";
            PreparedStatement psmin = conn().prepareStatement(SQLMin1);
            psmin.setInt(1,QuanMin1);
            psmin.setInt(2,userid);
            psmin.setInt(3,dishid);
            psmin.executeQuery();
        }
    }

    public void deletedish(int userid,int dishid) throws SQLException{
        String SQLDelete = "DELETE Cart FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id WHERE user_id = ? and dish_id = ?";
        PreparedStatement ps = conn().prepareStatement(SQLDelete);
        ps.setInt(1,userid);
        ps.setInt(2,dishid);
        ps.executeUpdate();
    }
}
