package com.asd.project.controller;

import com.asd.project.model.Dish;
import com.asd.project.model.dao.DishDao;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/dishmanagement")
public class DishManagement extends HttpServlet {
    DB db;
    DishDao dishDao;
    public DishManagement() throws SQLException{
        super();
        db = new DB();
        dishDao = new DishDao(db);
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

        String item_name = req.getParameter("name");
        String item_description = req.getParameter("description");
        double item_price = Double.valueOf(req.getParameter("price"));
        int category_id = Integer.valueOf(req.getParameter("category"));
        System.out.println(category_id);

        try{
            int id = dishDao.create(item_name, item_description, item_price,category_id);
            if (id == 0) {
                Helper.alert(res.getWriter(), "Unsuccessful, please try again.");
            }
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



    }

    private boolean isEmpty(String str){
        if(str.isEmpty() || str == null){
            return false;
        }
        return true;
    }
}
