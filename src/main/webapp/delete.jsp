<%@ page import="com.asd.project.model.User" %><%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 20/09/2022
  Time: 11:14 am
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
                    <a class="dropdown-item" href="editinfo.jsp">Personal Information</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logoutServlet">Log out</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </header>


    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">

        <div class="card bg-light mb-auto" style="max-width: 35rem;">
            <div class="card-header"><h3>Confirm to <strong>DELETE</strong></h3></div>
            <div class="card-body">
                <h5 class="card-title">IMPORTANT!</h5>
                <p class="card-text">This action cannot be undone. This will permanently delete the User
                    <strong><%=user.getName()%>
                    </strong></p>
            </div>
            <label for="verifyEmail">Please type your email: <strong><%=user.getEmail()%>
            </strong> to confirm.</label>
            <input type="text" id="verifyEmail" class="form-control" oninput="verifyEmail()">
            <button type="button" id="deleteButton" disabled onclick="handleDelete()" class="btn btn-danger">Delete my
                account
            </button>
        </div>
        <div style="text-align: right; margin-top: 50px">
            <a href="home.jsp" type="button" class="btn btn-primary">Back to Home</a>
        </div>
    </section>


    <footer class="text-muted">
        <div class="container">
            <p class="float-right">
                <a href="#">Back to top</a>
            </p>
            <p>Online Ordering System &copy;</p>
        </div>
    </footer>
</div>
<script>
    const input = document.getElementById("verifyEmail");
    const deleteButton = document.getElementById("deleteButton");

    const verifyEmail = () => {
        input.value === "<%=user.getEmail()%>" ? deleteButton.disabled = false : deleteButton.disabled = true;
        console.log("<%=session.getAttribute("user")%>");
    }
    const handleDelete = () => {
        const form = document.createElement("form");
        form.method = "post";
        form.style.display = "none";
        form.action = "userServlet?action=delete";
        $(document.body).append(form);
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