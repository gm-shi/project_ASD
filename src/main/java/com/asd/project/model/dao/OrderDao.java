package com.asd.project.model.dao;

import com.asd.project.model.Order;
import com.asd.project.utils.DB;
import com.mysql.cj.util.StringUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Objects;

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

    public void addquantity(int userid,double dishid) throws SQLException{
        String SQLCheck = "SELECT quantity FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id Where user_id = ? and dish_id = ?";
        PreparedStatement ps = conn().prepareStatement(SQLCheck);
        ps.setInt(1, userid);
        ps.setDouble(2, dishid);
        ResultSet resultSet = ps.executeQuery();
        int temp = 0;
        while(resultSet.next()){
            temp = resultSet.getInt(1);
        }
        int QuanAdd1 = temp + 1;
        String SQLAdd = "UPDATE Cart INNER JOIN Dish on Cart.dish_id = Dish.id set quantity = ? WHERE user_id = ? AND dish_id = ? ";
        PreparedStatement psmin = conn().prepareStatement(SQLAdd);
        psmin.setInt(1,QuanAdd1);
        psmin.setInt(2,userid);
        psmin.setDouble(3,dishid);
        psmin.executeUpdate();
    }

    public void minusquantity(int userid,double dishid) throws SQLException{
        String SQLCheck = "SELECT quantity FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id Where user_id = ? and dish_id = ?";
        PreparedStatement ps = conn().prepareStatement(SQLCheck);
        ps.setInt(1, userid);
        ps.setDouble(2,dishid);
        ResultSet resultSet = ps.executeQuery();
        int temp = 0;
        while(resultSet.next()){
            temp = Integer.parseInt(resultSet.getString(1));
        }
        if(temp == 1){
            deletedish(userid, dishid);
        }
        else{
            int QuanMin1 = temp - 1;
            String SQLMin = "UPDATE Cart INNER JOIN Dish on Cart.dish_id = Dish.id set quantity = ? WHERE user_id = ? AND dish_id = ? ";
            PreparedStatement psmin = conn().prepareStatement(SQLMin);
            psmin.setInt(1,QuanMin1);
            psmin.setInt(2,userid);
            psmin.setDouble(3,dishid);
            psmin.executeUpdate();
        }
    }


    public void deletedish(int userid,double dishid) throws SQLException{
        String SQLDelete = "DELETE Cart FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id WHERE user_id = ? and dish_id = ?";
        PreparedStatement ps = conn().prepareStatement(SQLDelete);
        ps.setInt(1,userid);
        ps.setDouble(2,dishid);
        ps.executeUpdate();
    }

    public void submitorder(int userid) throws SQLException{
        String SQLQuery = "SELECT name,price,quantity,dish_id FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id WHERE user_id =?";
        PreparedStatement ps = conn().prepareStatement(SQLQuery);
        ps.setInt(1, userid);
        ResultSet resultSet = ps.executeQuery();
        String str = "";
        while(resultSet.next()){
            str = str + "[";
            str = str + resultSet.getString("name");
            str = str + "|";
            str = str + resultSet.getDouble("price");
            str = str + "|";
            str = str + resultSet.getInt("quantity");
            str = str + "]";
        }
        String ST = "NotPayed";
        String SQLDelete = "INSERT INTO `Order`(OrderInfo,UserID,Status) VALUES (?,?,?)";
        PreparedStatement pssub = conn().prepareStatement(SQLDelete);
        pssub.setString(1,str);
        pssub.setInt(2,userid);
        pssub.setString(3,ST);
        System.out.println(pssub);
        pssub.executeUpdate();
        String SQLDeleteCart = "DELETE Cart FROM Cart INNER JOIN Dish on Cart.dish_id = Dish.id WHERE user_id = ? ";
        PreparedStatement psdel = conn().prepareStatement(SQLDeleteCart);
        psdel.setInt(1,userid);
        psdel.executeUpdate();
    }

    public void searchorder(int userid)  throws SQLException{

    }

    public void cancelorder(int userid) throws SQLException{

    }
}
