package com.asd.project.model;

import java.util.Date;

public class Order {
    private int OrderID;
    private int Quantity;
    private String DishName;
    private Date OrderDate;

    public Order(int orderID, int quantity, String dishName, Date orderDate) {
        OrderID = orderID;
        Quantity = quantity;
        DishName = dishName;
        OrderDate = orderDate;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int orderID) {
        OrderID = orderID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public String getDishName() {
        return DishName;
    }

    public void setDishName(String dishName) {
        DishName = dishName;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date orderDate) {
        OrderDate = orderDate;
    }
}
