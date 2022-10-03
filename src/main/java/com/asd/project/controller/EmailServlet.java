package com.asd.project.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

import com.asd.project.utils.EmailService;
import com.asd.project.utils.Helper;

@WebServlet("/EmailService")
public class EmailServlet extends HttpServlet {
    private EmailService em =new EmailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getQueryString().split("=")[1].toLowerCase();
        switch (query) {
            case "sendemail":
                SendEmail(request, response);
                break;
        }
    }


    private void SendEmail(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String type = req.getParameter("type");



    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
