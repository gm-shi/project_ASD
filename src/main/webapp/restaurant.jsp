<%@ page import="com.asd.project.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.asd.project.utils.DB" %>
<%@ page import="com.asd.project.model.Restaurant" %>



<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Restaurant</title>
</head>
<body>
<div class="body">
    <%
        String name = "Guest";
        User user = null;
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            name = user.getName();
        }

        Restaurant restaurant;
        restaurant = (Restaurant) session.getAttribute("restaurant");
        Restaurant result = (Restaurant) request.getAttribute("result");

    %>

    <header>
        <%--    navigation bar start--%>
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
                            <a class="dropdown-item" href="#">My Order</a>
                            <a class="dropdown-item" href="editinfo.jsp">Profile</a>
                            <a class="dropdown-item" href="accesslog.jsp">Access Log</a>
                            <% if (user.getRole().equalsIgnoreCase("Customer")) {%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="delete.jsp">Delete Account</a>
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


        <%--    picture and as link--%>
    <main role="main">n
        <section class="jumbotron text-center">
            <div class="container">
                <div id="demo" class="carousel slide" data-ride="carousel">

                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://media.istockphoto.com/photos/stir-fry-noodles-with-vegetables-and-beef-in-black-bowl-slate-top-picture-id1265502236?k=20&m=1265502236&s=612x612&w=0&h=6tAimUt291HSqeL0h0qN1_I9FJ3-HueDZMb8GV7ZPLE=">
                        </div>
                        <div class="carousel-item">
                            <img  src="https://media.istockphoto.com/photos/fried-dumplings-gyoza-with-soy-sauce-and-chopsticks-top-view-picture-id1286079738?k=20&m=1286079738&s=612x612&w=0&h=HQFZXNWA6i89OlKnllEfqFcc85Lm-hFjCWrd6nwDwuA=">
                        </div>
                        <div class="carousel-item">
                            <img src="https://media.istockphoto.com/photos/chinese-food-blank-background-picture-id545286388?k=20&m=545286388&s=612x612&w=0&h=1zAWEuV5W6SoYtErOkWasELFcAWMKgQEBUsNOoH5znc=">
                        </div>
                    </div>

                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>
            </div>
        </section>

            <%-- main --%>
        <main role="main">
            <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">

                <h1 class="card-title"><%=result.getName()%></h1>
                <p>Located in <%=result.getLocation()%> </p>
                <p>Contact us: <%=result.getPhone()%> </p>
                <p>We are very good at cooking <%=result.getType()%> food! </p>
            </section>
        </main>


        <%--    map--%>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
            <title>Insert title here</title>
            <script
                    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
            <script>
                var map;
                function initialize() {
                    var mapOptions = {
                        zoom: 8,
                        center: new google.maps.LatLng(-34.397, 150.644)
                    };
                    map = new google.maps.Map(document.getElementById('map-canvas'),
                        mapOptions);
                }

                google.maps.event.addDomListener(window, 'load', initialize);
            </script>
        </head>
        <body>
        <div id="map-canvas" style="height:300px; width:500px"></div>
        </body>
        </html>



        <%--    footer--%>
    </main>
    <footer class="text-muted">
        <div class="container">
            <p class="float-right">
                <a href="#">Back to top</a>
            </p>
            <p>Restaurant Online Ordering System &copy;</p>
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