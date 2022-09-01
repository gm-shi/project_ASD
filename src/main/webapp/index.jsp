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

    <title>Online Ordering System</title>
</head>
<body>
<div class="body">
    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;"
                         src="${pageContext.request.contextPath}/img/shop.png" alt="logo">
                    <strong style="margin-left:5px">Online Ordering System</strong>
                </a>
            </div>
        </div>
    </header>

    <main role="main">
        <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
            <h1 >Online Ordering System</h1>
            <div style="width: 40%; height: 1px; background-color: lightslategrey; margin: 10px"></div>
            <p class="lead" style="color: slategrey">ASD Demo Web Application.</p>
            <div class="card" style="width: 600px; height:400px; margin: 20px; }">
                <div class="card-body" style="display: flex;flex-direction: column; justify-content: space-between">
                    <form method="post" action="loginServlet">
                        <div class="form-group" style="margin-top: 40px">
                            <label for="exampleInputEmail1" style="text-align: left; display: flex;">Email
                                address</label>
                            <input type="email" class="form-control" name="email" id="exampleInputEmail1"
                                   aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label style="text-align: left; display: flex;" for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password">
                            <input type="checkbox" onclick="showPassword()"> Show Password
                        </div>

                        <button type="submit" class="btn btn-success btn-block">Login</button>
                    </form>
                    <button class="btn btn-primary" onclick="window.location='register.jsp'">Register</button>
                    <button class="btn btn-link" onclick="window.location='home.jsp'">Continue as guest</button>
                </div>
            </div>
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


<script>
    function showPassword() {
        const x = document.getElementById("password");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";

        }
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