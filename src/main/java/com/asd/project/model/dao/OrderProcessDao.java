package com.asd.project.model.dao;

import com.asd.project.model.Order;
import com.asd.project.model.OrderProcess;
import com.asd.project.utils.DB;
import java.sql.*;
import java.util.ArrayList;

public class OrderProcessDao {
    private final DB db;

    public OrderProcessDao(DB db) {
        this.db = db;
    }

    private Connection conn() throws SQLException{
        return db.connection();
    }

    public ArrayList<OrderProcess> PreviewAllCustomer(int userid) throws SQLException{
        ArrayList<OrderProcess> Preview = new ArrayList<>();
        String SQL = "SELECT * FROM `Order` Where UserID = ?";
        PreparedStatement PS = conn().prepareStatement(SQL);
        PS.setInt(1,userid);
        ResultSet resultSet = PS.executeQuery();
        while(resultSet.next()){
            Preview.add(new OrderProcess((resultSet.getInt("orderID")),
                    resultSet.getString("orderinfo"),
                    resultSet.getInt("userid"),
                    resultSet.getTimestamp("time"),
                    resultSet.getString("status")));
        }
        return Preview;
    }

    public ArrayList<OrderProcess> PreviewAllStaff() throws SQLException{
        ArrayList<OrderProcess> PreviewStaff = new ArrayList<>();
        String SQLStaff = "SELECT * FROM `Order`";
        PreparedStatement PS = conn().prepareStatement(SQLStaff);
        ResultSet resultSet = PS.executeQuery();
        while(resultSet.next()){
            PreviewStaff.add(new OrderProcess((resultSet.getInt("orderID")),
                    resultSet.getString("orderinfo"),
                    resultSet.getInt("userid"),
                    resultSet.getTimestamp("time"),
                    resultSet.getString("status")));
        }
        return PreviewStaff;
    }

    public String SearchOrderCustomer(int id, int target) throws SQLException{
        String SQLST = "SELECT * FROM `Order` Where UserID = ? and OrderID = ?";
        PreparedStatement SearchCUPS = conn().prepareStatement(SQLST);
        SearchCUPS.setInt(1,id);
        SearchCUPS.setInt(2,target);
        ResultSet resultSet = SearchCUPS.executeQuery();
        int sizeofrs = 0;
        String str = "";
        while(resultSet.next()){
            sizeofrs++;
            str = str + "The Order ID" +resultSet.getInt("orderID")+" has item(s) "+resultSet.getString("orderinfo") +"Which is owned by the client with UserID of "+resultSet.getInt("userid")+" and last opreated time is "+resultSet.getTimestamp("time")+" and the order current status is "+resultSet.getString("status")+".";
        }
        if(sizeofrs == 0){
            return "Error";
        }
        else{
            System.out.println(sizeofrs);
            return str;
        }
    }

    public String SearchOrderStaff(int id, int target) throws SQLException{
        String SQLST = "SELECT * FROM `Order` Where UserID = ? and OrderID = ?";
        PreparedStatement SearchCUPS = conn().prepareStatement(SQLST);
        SearchCUPS.setInt(1,id);
        SearchCUPS.setInt(2,target);
        ResultSet resultSet = SearchCUPS.executeQuery();
        int sizeofrs = 0;
        String str = "";
        while(resultSet.next()){
            sizeofrs++;
            str = str + "The Order ID" +resultSet.getInt("orderID")+" has item(s) "+resultSet.getString("orderinfo") +"Which is owned by the client with UserID of "+resultSet.getInt("userid")+" and last opreated time is "+resultSet.getTimestamp("time")+" and the order current status is "+resultSet.getString("status")+".";
        }
        if(sizeofrs == 0){
            return "Error";
        }
        else{
            System.out.println(sizeofrs);
            return str;
        }
    }

    public void Cancelorder(double orderidfinal, int id) throws SQLException{
        String SQLCancel = "UPDATE `Order` SET Status = ? WHERE OrderID = ? and UserID = ?";
        String SSS = "Cancel";
        PreparedStatement PSCan = conn().prepareStatement(SQLCancel);
        PSCan.setString(1,SSS);
        PSCan.setDouble(2,orderidfinal);
        PSCan.setInt(3,id);
        PSCan.executeUpdate();
    }
}
