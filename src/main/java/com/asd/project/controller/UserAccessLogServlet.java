package com.asd.project.controller;

import com.asd.project.model.User;
import com.asd.project.model.UserAccessLog;
import com.asd.project.model.dao.UserAccessLogDao;
import com.asd.project.model.dao.UserDao;
import com.asd.project.utils.DB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/userAccessLogServlet")
public class UserAccessLogServlet extends HttpServlet {
    DB db;
    UserAccessLogDao accessLogDao;
    UserDao userDao;

    public UserAccessLogServlet() throws SQLException {
        super();
        db = new DB();
        userDao = new UserDao(db);
        accessLogDao = new UserAccessLogDao(db);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String[] queries = req.getQueryString().split("=");
        String query = queries[1].toLowerCase();
        switch (query) {
            case "search":
                handleSearch(req, res);
                break;
            case "all":
                handleAll(req, res);
            case "email":
                handleSearchByEmail(req, res);
                break;
        }
    }

    private void handleSearchByEmail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String date = req.getParameter("date");
            String email = req.getParameter("email");
            ArrayList<UserAccessLog> userAccessLogs = null;
            userAccessLogs = accessLogDao.getUserAccessLogByEmailAndDate(email, date);
            req.setAttribute("userAccessLogs", userAccessLogs);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("searchAccessLog.jsp");
            requestDispatcher.forward(req, res);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void handleSearch(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        User user = (User) req.getSession().getAttribute("user");
        String date = req.getParameter("date");
        ArrayList<UserAccessLog> userAccessLogs = null;
        try {
            userAccessLogs = accessLogDao.getUserAccessLogByDate(user.getId(), date);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("userAccessLogs", userAccessLogs);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("accesslog.jsp");
        requestDispatcher.forward(req, res);
    }

    private void handleAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        ArrayList<UserAccessLog> userAccessLogs = null;
        try {
            userAccessLogs = accessLogDao.getUserAccessLog(user.getId());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("userAccessLogs", userAccessLogs);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("accesslog.jsp");
        requestDispatcher.forward(req, res);
    }

}
