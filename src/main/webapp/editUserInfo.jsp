<%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 27/09/2022
  Time: 2:48 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.asd.project.model.User" %>
<%@ page import="com.asd.project.model.UserAccessLog" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.asd.project.utils.DB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Search User Access Log</title>
</head>
<body>
<div class="body">
    <%
        String name;
        User user;
        if (session.getAttribute("user") == null) {
            response.sendRedirect("home.jsp");
        }
        user = (User) session.getAttribute("user");
        if (user.getRole().equalsIgnoreCase("Customer")) {
            response.sendRedirect("home.jsp");
        }
        name = user.getName();
        User result = (User) request.getAttribute("result");

    %>
    <header>
        <%--    navigation bar--%>
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
                    <li class="nav-item">
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
                            <a class="dropdown-item" href="#">My Order</a>
                            <a class="dropdown-item" href="editinfo.jsp">Profile</a>
                            <a class="dropdown-item" href="accesslog.jsp">Access Log</a>
                            <% if (user.getRole().equalsIgnoreCase("Customer")) {%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="#">Delete Account</a>
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
        <%--    navigation bar end--%>
    </header>

    <section class="jumbotron text-center">
        <strong><h1 class="display-4">Edit User Information</h1></strong>
    </section>
    <div style="display: flex; flex-direction: column; align-items: center;">
        <div style="width: 30%">
            <form method="post" action="userServlet?action=edit">
                <div class="form-group">
                    <label for="inputUserName">User Name</label>
                    <input type="text" name="name" class="form-control" id="inputUserName" value="<%=result.getName()%>" required>
                </div>
                <div class="form-group">
                    <label for="inputEmail4">Email</label>
                    <input type="text" name="email" class="form-control" id="inputEmail4" value="<%=result.getEmail()%>" readonly required>
                </div>
                <div class="form-group">
                    <label for="inputPassword">Password</label>
                    <input type="text"  name="password" class="form-control"
                           id="inputPassword" value="<%=result.getPassword()%>" required>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input type="text" name="address"  value="<%=result.getAddress()%>" class="form-control" id="inputAddress"
                           placeholder="1234 Miller St">
                </div>
                <div class="form-group">
                    <label for="inputUserPhone">Phone Number</label>
                    <input type="text" name="phone" class="form-control" value="<%=result.getPhoneNumber()%>"
                           id="inputUserPhone"  required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <input type="role" name="role" class="form-control" id="role" value="<%=result.getRole()%>" disabled required>
                </div>

                <div style=" text-align: center;">
                    <button style="margin: 20px" type="submit" id="submitButton" class="btn btn-primary">Save
                    </button>
                    <a href="home.jsp" class="btn btn-danger">Cancel</a>
                </div>

            </form>

        </div>
    </div>


    <footer style="margin-top: 80px" class="text-muted">
        <div class="container">
            <p class="float-right">
                <a href="#">Back to top</a>
            </p>
            <p>Online Ordering System &copy;</p>
        </div>
    </footer>
</div>



<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

</body>
</html>


