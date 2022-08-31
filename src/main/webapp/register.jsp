<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>
<body>
<div class="body">

    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;" src="${pageContext.request.contextPath}/img/shop.png" alt="logo">

                    <strong style="margin-left:5px">Online Ordering System</strong>
                </a>
            </div>
        </div>
    </header>

    <main role="main">
        <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
            <h1 class="display-4">Register</h1>
        </section>
        <div  style="display: flex; flex-direction: column; align-items: center;">
            <div  style="width: 30%">
        <form  method="post" action="user-servlet?action=register">
            <div class="form-group">
                <label for="inputUserName">User Name</label>
                <input type="text" name="username" class="form-control" id="inputUserName" required>
            </div>
            <div class="form-group" >
                <label for="inputEmail4">Email</label>
                <input type="email" name="email" class="form-control" id="inputEmail4" required>
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" name="password" class="form-control" id="inputPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" onblur="confirm()"  name="confirmPassword" class="form-control" id="confirmPassword" required>
           <p id="warning" style="color: red; margin-top: 5px; display: none">Password does not match!</p>
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" name="address" class="form-control" id="inputAddress" placeholder="1234 com.asd.project_asd.utils.DBtester St">
            </div>
            <div class="form-group">
                <label for="inputUserPhone">Phone Number</label>
                <input type="text" name="phone" class="form-control" pattern="[04]{2}[0-9]{8}" value="04"  id="inputUserPhone" title=" Phone number with 04 and remaing 8 digit with 0-9" required>
            </div>
            <div style="margin-bottom: 20px;     text-align: center;">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">
                    Agree to terms and conditions
                </label>
            </div>
            <div  style=" text-align: center;" >
                <button style="margin: 20px" type="submit" id="submitButton" class="btn btn-primary">Sign up</button>
                <a href="index.jsp" class="btn btn-danger">Cancel</a>
            </div>

        </form>

</div>
        </div>

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

    function confirm() {
        const passwd = document.getElementById("inputPassword");
        const _passwd = document.getElementById("confirmPassword");
        const button = document.getElementById("submitButton");
        const warning = document.getElementById('warning');
        if (_passwd.value === passwd.value){
            button.disabled = false;
            warning.style.display = "none";
        } else {
            button.disabled = true;
            warning.style.display = "unset";

        }
    }



</script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>