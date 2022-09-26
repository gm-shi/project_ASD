package com.asd.project.controller;

import com.asd.project.model.User;
import com.asd.project.model.dao.UserAccessLogDao;
import com.asd.project.model.dao.UserDao;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;
import com.asd.project.utils.Validator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    DB db;
    UserDao userDao;
    UserAccessLogDao accessLogDao;

    public UserServlet() throws SQLException {
        super();
        db = new DB();
        userDao = new UserDao(db);
        accessLogDao = new UserAccessLogDao(db);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String query = request.getQueryString().split("=")[1].toLowerCase();
        switch (query) {
            case "register":
                handleRegister(request, response);
                break;
            case "delete":
                handleDeleteAccount(request, response);
                break;
            case "get":
                handleGetUser(request, response);
                break;
            case "deleteuser":
                handleDeleteUserByEmail(request,response);
                break;
            case "edituser":
                handleEditUserInformationButton(request,response);
                break;
                case "edit":
                handleUpdateUserInfo(request,response);
                break;
            default:
                System.out.println("no action");
                return;
        }
    }

    private void handleUpdateUserInfo(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        try {
            if (userDao.update(name, password, address, phone, email)){
                System.out.println(email);
                System.out.println(phone);
                response.sendRedirect("usermanagement.jsp");
            }else {
                Helper.alert(response.getWriter(),"update failed");
            }
        } catch (SQLException | IOException throwables) {
            throwables.printStackTrace();
            Helper.alert(response.getWriter(),"update failed");
        }
    }

    private void handleEditUserInformationButton(HttpServletRequest request, HttpServletResponse response) {
        User user;
        String id = request.getParameter("userId");
        try{
            user = userDao.getUserById(Integer.parseInt(id));
            request.setAttribute("result", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("editUserInfo.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void handleDeleteUserByEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("userId");
        try{
            userDao.delete(Integer.parseInt(id));

        } catch (SQLException e) {
            Helper.alert(response.getWriter(), "Fail to delete");
        }
        request.removeAttribute("result");
        response.sendRedirect("usermanagement.jsp");

    }

    private void handleGetUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user;
        try{
            user = userDao.getUserByEmail(email);
            request.setAttribute("result", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("usermanagement.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void handleDeleteAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        try {
            userDao.delete(user.getId());
            request.getSession().removeAttribute("user");
            request.getSession().invalidate();
            response.sendRedirect("home.jsp");
        } catch (SQLException throwable) {
            throwable.printStackTrace();
            Helper.alert(response.getWriter(), "Delete failed");
        }
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int userId;
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String role = "Customer";
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
            accessLogDao.insert(userId,"register");
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                Helper.alert(res.getWriter(), "Email already exist");
            } else {
                e.printStackTrace();
                Helper.alert(res.getWriter(), "Fail to Sign up");
            }
            return;
        }
        if (req.getSession().getAttribute("user") != null) {
            User user = (User) req.getSession().getAttribute("user");
            if (user.getRole().equalsIgnoreCase("Admin"))
                res.sendRedirect("home.jsp");
        }else{
            res.sendRedirect("welcome.jsp");
        }
    }
}

