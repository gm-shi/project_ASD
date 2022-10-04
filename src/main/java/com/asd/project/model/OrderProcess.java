package com.asd.project.model;

import java.sql.Timestamp;

public class OrderProcess {
    private int OrderID;
    private String OrderInfo;
    private int UserID;
    private Timestamp Time;
    private String Status;

    public OrderProcess(int orderID, String orderInfo, int userID, Timestamp time, String status) {
        OrderID = orderID;
        OrderInfo = orderInfo;
        UserID = userID;
        Time = time;
        Status = status;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int orderID) {
        OrderID = orderID;
    }

    public String getOrderInfo() {
        return OrderInfo;
    }

    public void setOrderInfo(String orderInfo) {
        OrderInfo = orderInfo;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public Timestamp getTime() {
        return Time;
    }

    public void setTime(Timestamp time) {
        Time = time;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }
}
