<%@ page import="com.asd.project.model.User" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.asd.project.model.dao.CategoryDao" %>
<%@ page import="com.asd.project.utils.DB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.asd.project.model.Category" %>
<%@ page import="com.asd.project.model.Dish" %>
<%@ page import="com.asd.project.model.dao.CartDao" %><%--
  Created by IntelliJ IDEA.
  User: Littlenewww
  Date: 2022/9/6
  Time: 21:19
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>
<div class="body">

    <header>
        <%--    navigation bar start--%>
        <%
            String name = "Guest";
            DB db = new DB();
            CategoryDao cateDao = new CategoryDao(db);
            CartDao cartDao = new CartDao(db);
            User user = null;
            ArrayList<Integer> selectedDishes = null;
            if (session.getAttribute("user") != null) {
                user = (User) session.getAttribute("user");
                if (request.getAttribute("selectedDishes") != null) {
                    selectedDishes = (ArrayList<Integer>) request.getAttribute("selectedDishes");
                } else {
                    selectedDishes = cartDao.getDishIds(user.getId());
                }
                name = user.getName();
            }
            ArrayList<Category> categories = cateDao.getAllCategories();
        %>
        <%!
            public int getUserId(User user) {
                if (user != null) {
                    return user.getId();
                }
                return 0;
            }

            public boolean isDishSelected(int dishId, ArrayList<Integer> ids) {
                for (int id : ids) {
                    if (id == dishId)
                        return true;
                }
                return false;
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
    <section class="jumbotron text-center">
        <strong><h1 class="display-4">Menu</h1></strong>
    </section>

    <div style="    display: flex;
    flex-direction: column;
    align-items: center; ">
        <div class="accordion" style="    width: 60%;" id="accordion">
            <%
                for (Category category : categories) {
            %>
            <div class="card">
                <div class="card-header" id="heading_<%=category.getId()%>">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
                                data-target="#category_<%=category.getId()%>" aria-expanded="true"
                                aria-controls="category_<%=category.getId()%>">
                            <%=category.getName()%>
                        </button>
                    </h2>
                </div>

                <div id="category_<%=category.getId()%>" class="collapse"
                     aria-labelledby="heading_<%=category.getId()%>"
                     data-parent="#accordion">
                    <div class="card-body" style="padding: 0px">
                        <ul class="list-group" style=" list-style-type: none;">
                            <% ArrayList<Dish> dishes = cateDao.getDishes(category.getId());
                                for (Dish dish : dishes) {
                            %>
                            <li>
                                <div class="card">
                                    <div class="card-body">
                                        <div style="display: flex; flex-direction: row   ; justify-content: space-between;">
                                            <div style="display: flex; flex-direction: column">
                                                <h5 class="card-title"><%=dish.getName()%>
                                                </h5>
                                                <p class="card-text"><%=dish.getDescription()%>
                                                </p>
                                            </div>
                                            <div>
                                                <h5 class="card-title">Price: $<%=dish.getPrice()%>
                                                </h5>
                                                <button onclick="handleAddToCart(<%=getUserId(user)%>, <%=dish.getId()%>)"
                                                        <%
                                                            if (selectedDishes != null && isDishSelected(dish.getId(), selectedDishes)) {%>
                                                        disabled<%

                                                    }
                                                %> class="btn btn-primary">Add to
                                                    Cart
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>

                <%}%>
            </div>
        </div>
    </div>
</div>
</div>
<form id="hiddenForm" method="post" action="dishSelectManagement?=add">
    <input type="hidden" name="userId" id="userId" value=""/>
    <input type="hidden" name="dishId" id="dishId" value=""/>
</form>
<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>Online Ordering System &copy;</p>
    </div>
</footer>


<script>
    const handleAddToCart = (userId, dishId) => {
        const form = document.getElementById("hiddenForm");
        document.getElementById("userId").value = userId;
        document.getElementById("dishId").value = dishId;
        form.submit();
        return form;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

</body>
</html>
