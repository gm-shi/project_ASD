package com.asd.project.controller;

import com.asd.project.model.User;
import com.asd.project.model.dao.UserDao;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;
import com.asd.project.utils.Validator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {


    DB db;
    UserDao userdao;
    public LoginServlet() throws SQLException {
        db = new DB();
        userdao = new UserDao(db);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if(Validator.checkEmpty(email, password)){
            Helper.alert(res.getWriter(), "Please enter your email or password");
            return;
        }
        if (Validator.validateEmail(email)) {
            Helper.alert(res.getWriter(), "Wrong Email format");
            return;
        }
        if (Validator.validatePassword(password)) {
            Helper.alert(res.getWriter(), "Wrong Password format");
            return;
        }
        handleUserLogin(email, password, req, res);
    }

    private void handleUserLogin(String email, String password, HttpServletRequest req, HttpServletResponse res) throws IOException {
        User user;
        try {
           user = userdao.getUserByEmail(email);
           if(user == null){
               Helper.alert(res.getWriter(), "Email does not exist");
               return;
           }
           if (!user.getPassword().equals(password)){
               Helper.alert(res.getWriter(), "Wrong Password");
               return;
           }
           req.getSession().setAttribute("user", user);
           res.sendRedirect("home.jsp");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
