package com.asd.project_asd.controller;

import com.asd.project_asd.model.User;
import com.asd.project_asd.model.dao.UserDao;
import com.asd.project_asd.utils.DB;
import com.asd.project_asd.utils.Helper;
import com.asd.project_asd.utils.Validator;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user-servlet")
public class UserServlet extends HttpServlet {
    DB db;
    UserDao userDao;

    public UserServlet() throws SQLException {
        super();
        db = new DB();
        userDao = new UserDao(db);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String query = request.getQueryString().split("=")[1].toLowerCase();
        switch (query) {
            case "register":
                handleRegister(request, response);
                break;
            default:
                return;
        }
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int userId;
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String role = null;
        if (req.getParameter("role") != null)
            role = req.getParameter("role");
        if (Validator.checkEmpty(email, password) || Validator.checkEmpty(name)) {
            Helper.alert(res.getWriter(), "Please enter email or password");
            return;
        }
        if (Validator.validateEmail(email)) {
            Helper.alert(res.getWriter(), "Wrong Email format");
            return;
        }
        if (Validator.validatePassword(password)) {
            Helper.alert(res.getWriter(), "Password must be greater than 4 characters");
            return;
        }

        try {
            userId = userDao.create(name, email, address, phone, role, password);
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                Helper.alert(res.getWriter(), "Email already exist");
            } else {
                e.printStackTrace();
                Helper.alert(res.getWriter(), "Fail to Sign up");
            }
            return;
        }
//        User user = new User(userId, name, email, password, phone, address, role);
        //add user access log
        if (req.getSession().getAttribute("user") != null)
            res.sendRedirect("home.jsp");

        res.sendRedirect("welcome.jsp");

    }
}

