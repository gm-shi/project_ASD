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

    <title>Restaurant</title>
</head>
<body>
<div class="body">

    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;"
                         src="img/shop.png" alt="logo">
                    <strong style="margin-left:5px">Restaurant Online Ordering System</strong>
                </a>
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
                    </ul>![](C:/Users/11493/AppData/Local/Temp/download.jpg)
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


        <main role="main">
            <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">

                <h1>Restaurant101</h1>
                <p>Located in Bridge mengpo, guichai District, yanwang City, difu Province </p>
                <p>Contact us: 11223344 </p>
            </section>
        </main>




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