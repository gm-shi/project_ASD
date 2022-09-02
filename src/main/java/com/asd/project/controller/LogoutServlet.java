package com.asd.project.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {

    public LogoutServlet() throws SQLException {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") != null)
            request.getSession().removeAttribute("user");
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }


}
