<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>My Account</title>
</head>
<body>
<div class="body">

    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
                    <strong style="margin-left:5px">Restaurant Online Ordering System</strong>
                </a>
            </div>
        </div>
    </header>


    <h1>Information edit</h1>
    <div class="card-body">
        <form>
            <h6>User information</h6>
            <div class="pl-lg-4">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="form-control-label" for="email">Email address</label>
                            <input type="email" name="email" id="email" class="form-control form-control-alternative" value="${account.email}" readonly>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group focused">
                            <label class="form-control-label" for="password">Password</label>
                            <input type="password" name="password" id="password" class="form-control form-control-alternative" value="${account.password}" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group focused">
                            <label class="form-control-label" for="fname">First name</label>
                            <input type="text" name="fname" id="fname" class="form-control form-control-alternative" value="${account.fname}" readonly>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group focused">
                            <label class="form-control-label" for="lname">Last name</label>
                            <input type="text" name="lname" id="lname" class="form-control form-control-alternative" value="${account.lname}" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group focused">
                            <label class="form-control-label" for="gender">Gender</label>
                            <input type="text" name="gender" id="gender" class="form-control form-control-alternative" value="${account.gender}" readonly>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group focused">
                            <label class="form-control-label" for="dob">Date of Birth</label>
                            <input type="date" name="dob" id="dob" class="form-control form-control-alternative" value="${account.dob}" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <!-- Address -->
            <h6>Contact information</h6>
            <div class="pl-lg-4">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group focused">
                            <label class="form-control-label" for="address_streetNo">Street No.</label>
                            <input type="number" name="address_streetNo" id="address_streetNo" class="form-control form-control-alternative" value="${account.addressStreetNo}" readonly>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group focused">
                            <label class="form-control-label" for="address_streetName">Street Name</label>
                            <input type="text" name="address_streetName" id="address_streetName" class="form-control form-control-alternative" value="${account.addressStreetName}" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group focused">
                            <label class="form-control-label" for="address_city">City</label>
                            <input type="text" name="address_city" id="addressCity" class="form-control form-control-alternative" value="${account.addressCity}" readonly>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group focused">
                            <label class="form-control-label" for="input-country">Country</label>
                            <input type="text" name="address_country" id="address_country" class="form-control form-control-alternative" placeholder="Country" value="${account.addressCountry}" readonly>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="form-control-label" for="input-country">Postal code</label>
                            <input type="number" name="address_zipcode" id="address_zipcode" class="form-control form-control-alternative" value="${account.addressZipcode}" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-4">
        </form>
        <div class="card-body">
            <h5 class="card-title">Home page</h5>
            <p class="card-text">Back to Home page</p>
            <%--                        <a href="#" class="btn btn-primary">Search</a>--%>
            <button class="btn btn-primary" onclick="window.location='home.jsp'">Click Here!</button>
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