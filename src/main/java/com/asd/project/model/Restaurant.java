package com.asd.project.model;

import java.io.Serializable;




public class Restaurant implements Serializable {
    private int id;
    private String name;
    private int phone;
    private String location;
    private String type;


    public Restaurant() {
    }

    public Restaurant(int id, String name, int phone, String location, String type) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.location = location;
        //testing
        this.type = type;
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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}