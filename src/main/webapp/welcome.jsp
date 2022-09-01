<%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 1/09/2022
  Time: 1:39 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="refresh" content="3;url=index.jsp">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Welcome!</title>
</head>
<body>
<div class="body">

    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
                    <strong style="margin-left:5px">Online Ordering System</strong>
                </a>
            </div>
        </div>
    </header>


    <main role="main">
        <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">

            <h1>Welcome</h1>
            <p>Your have successfully registered</p>
            <p>Will automatically redirect to login page in 3 sec</p>
            <%--        Add timer later--%>
            <%--        content goes here--%>
            <a href="index.jsp"  class="btn btn-success">Login</a>
        </section>
    </main>





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
