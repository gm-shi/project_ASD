<%@ page import="com.asd.project.model.User" %>
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

    <title>Home</title>
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

    %>
    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;"
                         src="img/shop.png" alt="logo">
                    <strong style="margin-left:5px">Restaurant Online Ordering System</strong>
                </a>
            </div>
            <%
                if (user == null) {
            %>
            <a class="btn btn-success" style="margin-right: 10px" href="index.jsp">Log in</a>
            <%} else {%>
            <a class="btn btn-danger" style="margin-right: 10px" href="logoutServlet">Log out</a>
            <%--            add logout servlet--%>
            <%}%>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-expanded="false">
                    <%=name%>
                </button>
                <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">Cart</a>
                    <%
                        if (user != null) {
                    %>
                    <a class="dropdown-item" href="userProfile.jsp">Personal Information</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logoutServlet">Log out</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </header>
    <main role="main">
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
                            <img src="img/1.jpg">
                        </div>
                        <div class="carousel-item">
                            <img  src="img/2.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="img/3.jpg">
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

        <div class="container">
            <div class="row row-cols-1 row-cols-md-3" style="margin: 40px">
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">XXXXXXXXXXXXX</h5>
                            <p class="card-text">XXXXXXXXXXXXXXXX</p>
                            <%--                        <a href="#" class="btn btn-primary">Search</a>--%>
                            <button class="btn btn-primary" onclick="window.location='#'">Button</button>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Email</h5>
                            <p class="card-text">view your order notification</p>
                            <%--                        <a href="#" class="btn btn-primary">Search</a>--%>
                            <a class="btn btn-primary" href="email.jsp">Button</a>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Restaurant</h5>
                            <p class="card-text">view restaurant information</p>
                            <%--                        <a href="#" class="btn btn-primary">Search</a>--%>
                            <a class="btn btn-primary" href="email.jsp">Button</a>
                        </div>
                    </div>
                </div>


                <%
                    if (user != null) {
                %>
                <div class="col mb-4">
                    <div class="card" style="line-height: inherit">
                        <div class="card-body">
                            <h5 class="card-title">Account Manage</h5>
                            <p class="card-text">This allow you to manage your personal information, such as password,
                                phone
                                number and address</p>
                            <a href="#" class="btn btn-primary">Profile</a>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">View Access Log</h5>
                            <p class="card-text">You can view your access record</p>
                            <a href="#" class="btn btn-primary">View</a>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Delete Account</h5>
                            <p class="card-text">You will delete your account from our database</p>
                            <a href="#" class="btn btn-primary">Delete</a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
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