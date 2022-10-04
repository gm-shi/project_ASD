package com.asd.project.model;

import java.util.Date;

public class Order {
    private String DishName;
    private double DishPrice;
    private int Quantity;
    private int Dishid;

    public Order(String dishName, double dishPrice, int quantity, int dishid) {
        DishName = dishName;
        DishPrice = dishPrice;
        Quantity = quantity;
        Dishid = dishid;
    }

    public String getDishName() {
        return DishName;
    }

    public void setDishName(String dishName) {
        DishName = dishName;
    }

    public double getDishPrice() {
        return DishPrice;
    }

    public void setDishPrice(double dishPrice) {
        DishPrice = dishPrice;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public int getDishid() {
        return Dishid;
    }

    public void setDishid(int dishid) {
        Dishid = dishid;
    }
}
