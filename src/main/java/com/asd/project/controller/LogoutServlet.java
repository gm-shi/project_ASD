package com.asd.project.controller;

import com.asd.project.model.User;
import com.asd.project.model.dao.UserAccessLogDao;
import com.asd.project.utils.DB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {

    DB db;
    UserAccessLogDao accessDao;


    public LogoutServlet() throws SQLException {
        super();
        db = new DB();
        accessDao = new UserAccessLogDao(db);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null)
            try {
                User user = (User) request.getSession().getAttribute("user");
                accessDao.insert(user.getId(), "logout");


            } catch (SQLException throwable) {
                throwable.printStackTrace();
            }
        request.getSession().removeAttribute("user");
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }


}
