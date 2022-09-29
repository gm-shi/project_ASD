package com.asd.project.controller;

import com.asd.project.model.Menu;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/dishmanagement")
public class DishManagement extends HttpServlet {
    DB db;
    Menu menu;
    String view = "dishes.jsp";
    public DishManagement() throws SQLException{
        super();
        db = new DB();
        menu = new DishManagement(db);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String[] queries = req.getQueryString().split("=");
        String query = queries[1].toLowerCase();

        switch (query){
            case"add":
                add(req, res);
                break;
            case"delete":
                delete(req, res);
                break;
            case"search":
                search(req, res);
                break;
            default:
        }
    }
    private void add(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
       //id name description price
        Integer item_id = Integer.valueOf(req.getParameter("item_id"));
        String item_name = req.getParameter("item_name");
        String item_description = req.getParameter("item_description");
        Double item_price = Double.valueOf(req.getParameter("item_price"));
        Menu menu = new Menu(Integer.valueOf(item_id), item_name, item_description, Double.valueOf(item_price));
        System.out.println(menu);
        try{
            menu.add(menu);
            res.sendRedirect("dishes.jsp");
        }
        catch(SQLException e){
            e.printStackTrace();
            Helper.alert(res.getWriter(), "Unsuccessful, please try again.");
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{

    }

    private void search(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String dish = req.getParameter("dishes");


    }

    private void displayList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        try{
            ArrayList<Menu> list = menu.search(null);
            System.out.println(list);
            req.setAttribute("list", list);
            req.getRequestDispatcher(view).forward(req, res);
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    private boolean isEmpty(String str){
        if(str.isEmpty() || str == null){
            return false;
        }
        return true;
    }
}
