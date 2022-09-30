package com.asd.project.model;

import java.io.Serializable;


public class Dish implements Serializable {
    private int id;
    private String name;
    private String description;
    private double price;
    private int category_id;

    public Dish() {
    }

    public Dish(int id, String name, String description, double price, int category_id) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category_id = category_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}
