package com.asd.project.model;

import java.util.ArrayList;

public class Menu {
    private Integer item_id;
    private String item_name;
    private String item_description;
    private Double item_price;

    public Menu(Integer item_id, String item_name, String item_description, Double item_price){
        this.item_id = item_id;
        this.item_name = item_name;
        this.item_description = item_description;
        this.item_price = item_price;
    }

    public Menu(){

    }

    public Integer getItemId(){
        return item_id;
    }
    public void setItemId(Integer item_id){
        this.item_id = item_id;
    }
    public String getItemName(){
        return item_name;
    }
    public void setItemName(String item_name){
        this.item_name = item_name;
    }
    public String getItemDescription(){
        return item_description;
    }
    public void setItemDescription(String item_description){
        this.item_description = item_description;
    }
    public Double getItemPrice(){
        return item_price;
    }
    public void setItemPrice(Double item_price){
        this.item_price = item_price;
    }
    @Override
    public String toString(){
        return "Menu [id = "+ item_id + ", name = " + item_name + ", description = " + item_description + ", price = " + item_price + "]";
    }

    public ArrayList<Menu> search(Object o) {
    }
}
