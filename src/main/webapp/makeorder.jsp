<%@ page import="com.asd.project.model.User" %>
<%@ page import="com.asd.project.model.Dish" %>
<%@ page import="com.asd.project.model.dao.OrderDao" %>
<%@ page import="com.asd.project.controller.OrderServlet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.asd.project.model.Order" %>
<%@ page import="com.asd.project.utils.DB" %>
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
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Make Order</title>
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
        <%--    navigation bar start--%>
        <%
            String name = "Guest";
            User user = null;
            if (session.getAttribute("user") != null) {
                user = (User) session.getAttribute("user");
                name = user.getName();
            }
        %>
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
                            <a class="dropdown-item" href="myorder.jsp">My Order</a>
                            <a class="dropdown-item text-danger" href="delete.jsp">Delete Account</a>
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
        if (user == null) {
    %>
        <div class="LoginPlease" style="text-align: center">
            <h2>Please Login!</h2>
            <p>If you are not logged in, guest users cannot use the shopping cart feature. If you do not have an account, please sign up.</p>
            <a class="btn btn-primary" href="index.jsp">Login</a>
            <a class="btn btn-primary" href="register.jsp">Sign Up</a>
        </div>
    <%} else{%>
        <%if (user != null){ %>
            <div class="Shopping-Cart-Div" style="text-align: center">
                <h1>Cart</h1>
                <%
                    int userid = user.getId();
                    String username = user.getName();
                    ArrayList<Order> orderdisplay;
                    if (request.getAttribute("DisplayAL") == null) {
                        DB db = new DB();
                        OrderDao OrderArraylist = new OrderDao(db);
                        orderdisplay = OrderArraylist.viewcart(user.getId());
                    } else {
                        orderdisplay = (ArrayList<Order>) request.getAttribute("DisplayAL");
                    }
                %>
                <div class="MyCart" style="text-align: center;width: 800px;margin: 0 auto;">
                    <p style="text-align: center;font-size: 20px;">Hi <%=username%> Here is your cart.</p>
                    <table style="border: solid black 1px;">
                        <tr>
                            <td width="200px" style="border: solid 1px black;text-align: center">Dish Name</td>
                            <td width="200px" style="border: solid 1px black;text-align: center">Price</td>
                            <td width="200px" style="border: solid 1px black;text-align: center">Quantity</td>
                            <td width="200px" style="border: solid 1px black;text-align: center">Action</td>
                        </tr>
                        <%
                            double totalprice = 0;
                            if(orderdisplay.size() > 0){
                            for(Order display : orderdisplay){
                                totalprice = totalprice + display.getDishPrice() * display.getQuantity();
                        %>
                        <tr>
                            <td style="border: solid 1px black;text-align: center"><%=display.getDishName()%></td>
                            <td style="border: solid 1px black;text-align: center"><%=display.getDishPrice()%> $</td>
                            <td style="border: solid 1px black;text-align: center"><%=display.getQuantity()%></td>
                            <td style="border: solid 1px black">
                                <form action="OrderServlet?action=Add&dishid=<%=display.getDishid()%>&userid=<%=user.getId()%>" method="post">
                                    <button type="submit" style="width: 150px">ADD(+)</button>
                                </form>
                                <form action="OrderServlet?action=Minus&dishid=<%=display.getDishid()%>&userid=<%=user.getId()%>" method="post">
                                    <button type="submit" style="width: 150px">Minus(-)</button>
                                </form>
                                <form action="OrderServlet?action=Delete&dishid=<%=display.getDishid()%>&userid=<%=user.getId()%>" method="post">
                                    <button type="submit" style="width: 150px">Delete(X)</button>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                            <h2 style="text-align: center;">The Total Price of the Cart is: <%=totalprice%> $</h2>
                            <form action="OrderServlet?action=Submit&totalprice=<%=totalprice%>&userid=<%=userid%>" method="post"><button type="submit" style="text-align: center;height: 50px;width: 200px;color: indianred;margin-bottom: 10px;">Order Now</button></form>
                            <br>
                            <%}else{%>
                            <tr><td></td><td>Nothing in Cart</td></tr>
                        <%}%>
                    </table>

                </div>
            </div>
        <%}%>
    <%}%>
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
