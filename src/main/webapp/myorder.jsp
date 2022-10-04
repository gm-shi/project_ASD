        <%@ page import="com.asd.project.model.User" %>
<%@ page import="com.asd.project.model.Dish" %>
<%@ page import="com.asd.project.model.dao.OrderDao" %>
<%@ page import="com.asd.project.controller.OrderServlet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.asd.project.model.Order" %>
<%@ page import="com.asd.project.utils.DB" %>
<%@ page import="com.asd.project.model.OrderProcess" %>
<%@ page import="com.asd.project.model.dao.OrderProcessDao" %>
<%--
  Created by IntelliJ IDEA.
  User: John Wang
  Date: 9/6/2022
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <%--    navigation bar start--%>
    <%
        String name = "Guest";
        User user = null;
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            name = user.getName();
        }
    %>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Orders!</title>
    <script type="text/css">
        .LoginPlease{
            width:400px;
            height:500px;
            text-align: center;
        }
    </script>
</head>
<body>
<div class="body">

    <header>
        <nav class="navbar navbar-expand-lg navbar-light shadow-sm" style="background-color: steelblue;
    box-shadow: 0px 0px 3px 0px black;">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div style="flex-basis: 10%"></div>
            <div class="collapse navbar-collapse" style="justify-content: space-around;" id="navbarNavDropdown">
                <ul class="navbar-nav"
                    style="font-size: 20px;flex-basis: 90%;display: flex;justify-content: space-evenly; font-weight: 600;">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="menu.jsp">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="makeorder.jsp">My Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="restaurant.jsp">About us</a>
                    </li>
                    <% if (user != null) { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            My Account
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="editinfo.jsp">Profile</a>
                            <a class="dropdown-item" href="accesslog.jsp">Access Log</a>
                            <% if (user.getRole().equalsIgnoreCase("Customer")) {%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="delete.jsp">Delete Account</a>
                            <a class="dropdown-item" href="myorder.jsp">My Order</a>
                            <%}%>
                            <% if (user.getRole().equalsIgnoreCase("admin")) {%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="myorder.jsp">Order Management</a>
                            <%}%>
                            <% if (user.getRole().equalsIgnoreCase("staff")) {%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="myorder.jsp">Order Management</a>
                            <%}%>
                        </div>
                    </li>
                    <%}%>
                </ul>
                <div style="display: flex">
                    <%
                        if (user == null) {
                    %>
                    <a class="btn btn-success" style="margin-right: 10px" href="index.jsp">Login</a>
                    <%} else {%>
                    <a class="btn btn-danger" style="margin-right: 10px" href="logoutServlet">Logout</a>
                    <%--            add logout servlet--%>
                    <%}%>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                                data-toggle="dropdown" aria-expanded="false">
                            <%=name%>
                        </button>
                        <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="makeorder.jsp">Cart</a>
                            <%
                                if (user != null) {
                            %>
                            <a class="dropdown-item" href="editinfo.jsp">Personal Information</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logoutServlet">Log out</a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <%
        ArrayList<OrderProcess> orderdisplayjsp = null;
        ArrayList<OrderProcess> orderdisplayjspstaff = null;
        if (user != null) {%>
    <%if (user.getRole().toLowerCase().equals("customer")) {%>
            <h2 style="text-align: center">Role:<%=user.getRole()%> Name: <%=user.getName()%></h2>
            <%
                if (request.getAttribute("ViewAllCustomer") == null) {
                    DB db = new DB();
                    OrderProcessDao Preview = new OrderProcessDao(db);
                    orderdisplayjsp = Preview.PreviewAllCustomer(user.getId());
                } else {
                    orderdisplayjsp = (ArrayList<OrderProcess>) request.getAttribute("ViewAllCustomer");
                }
            %>
            <div class="ListAll-Customer-Preview" style="width: 600px;margin: 0 auto;">
                <table style="border: 1px solid black">
                    <tr>
                        <td style="text-align: center;width: 200px;border: solid 1px;">Order ID</td>
                        <td style="text-align: center;width: 200px;border: solid 1px;">Status</td>
                        <td style="text-align: center;width: 200px;border: solid 1px;">Time</td>
                    </tr>
                    <%
                        if (orderdisplayjsp.size()>0){
                            for(OrderProcess displayCU : orderdisplayjsp){
                    %>
                    <tr>
                        <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayCU.getOrderID()%></td>
                        <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayCU.getStatus()%></td>
                        <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayCU.getTime()%></td>
                    </tr>
                    <%}%>
                    <%}else{%>
                    <%}%>
                </table>
                <form method="post" action="OrderManagement?action=searchcustomer&orderid=000000&userid=<%=user.getId()%>" style="margin: 0 auto;margin-top: 10px">
                    <input name="orderidform" type="text" style="width: 500px;text-align: center;" placeholder="Please enter 6 digit orderid to search for more details" />
                    <button type="submit" style="width: 90px">Search</button>
                </form>
    <%}%>


    <%if (user.getRole().toLowerCase().equals("staff")) {%>
            <h2 style="text-align: center">Role:<%=user.getRole()%> Name: <%=user.getName()%></h2>
                <%
                    if (request.getAttribute("ViewAllCustomerStaff") == null) {
                        DB db = new DB();
                        OrderProcessDao PreviewStaff = new OrderProcessDao(db);
                        orderdisplayjspstaff = PreviewStaff.PreviewAllStaff();
                    } else {
                        orderdisplayjspstaff = (ArrayList<OrderProcess>) request.getAttribute("ViewAllCustomerStaff");
                    }
                %>
                <div class="ListAll-Staff-Preview" style="width: 1000px;margin: 0 auto;">
                    <table style="border: 1px solid black">
                        <tr>
                            <td style="text-align: center;width: 200px;border: solid 1px;">User ID</td>
                            <td style="text-align: center;width: 200px;border: solid 1px;">Order ID</td>
                            <td style="text-align: center;width: 200px;border: solid 1px;">Status</td>
                            <td style="text-align: center;width: 200px;border: solid 1px;">Time</td>
                            <td style="text-align: center;width: 200px;border: solid 1px;">Action</td>
                        </tr>
                        <%
                            if (orderdisplayjspstaff.size()>0){
                                for(OrderProcess displayST : orderdisplayjspstaff){
                        %>
                        <tr>
                            <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayST.getUserID()%></td>
                            <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayST.getOrderID()%></td>
                            <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayST.getStatus()%></td>
                            <td style="text-align: center;width: 200px;border: solid 1px;"><%=displayST.getTime()%></td>
                            <td style="text-align: center;width: 200px;border: solid 1px;"><form method="post" action="OrderManagement?action=Cancel&orderid=<%=displayST.getOrderID()%>&userid=<%=displayST.getUserID()%>"><button type="submit" >Cancel</button></form></td>
                        </tr>
                        <%}%>
                        <%}else{%>
                        <%}%>
                    </table>
                    <form method="post" action="OrderManagement?action=searchstaff&orderid=000000&userid=000000" style="margin: 0 auto;margin-top: 10px">
                        <h3 style="text-align: center">Please enter both 6 digit order id and user id to search for more details</h3>
                        <input name="orderidformstaff" type="text" style="width: 400px;text-align: center;" placeholder="Please enter both order id here!" />
                        <input name="useridformstaff" type="text" style="width: 400px;text-align: center;" placeholder="Please enter user id here!" />
                        <button type="submit" style="width: 90px">Search</button>
                    </form>

                <%}%>
    <%if (user.getRole().toLowerCase().equals("admin")) {%>
            <h2 style="text-align: center">Role:<%=user.getRole()%> Name: <%=user.getName()%></h2>
            <h1 style="text-align: center">You Don't have permission in this page!</h1>
            <script type="text/css">
                .ListAll-Preview{
                    display: none;
                }
            </script>
        <%}%>
    <%} else {%>
        <div class="LoginPlease" style="text-align: center">
            <h2>Please Login!</h2>
            <p>If you are not logged in, guest users cannot use the this cart feature. If you do not have an account, please sign up.</p>
            <a class="btn btn-primary" href="index.jsp">Login</a>
            <a class="btn btn-primary" href="register.jsp">Sign Up</a>
        </div>
    <%}%>
    </div>


    <footer class="text-muted">
        <div class="container">
            <p class="float-right">
                <a href="#">Back to top</a>
            </p>
            <p>Online Ordering System &copy;</p>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>