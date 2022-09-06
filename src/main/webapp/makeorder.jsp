<%--
  Created by IntelliJ IDEA.
  User: John Wang
  Date: 9/6/2022
  Time: 10:04 PM
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Make Order</title>
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

    <div class="list-group" style="    display: flex;
    flex-direction: column;
    align-items: center;
    margin-left: 20%;
    margin-right: 20%;
    padding-bottom: 50px;
    text-align: center;
}">
        <h1>Cart</h1>
        <table>
            <tr>
                <td>Item Name</td>
                <td>Price</td>
                <td>Action</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><button>+</button><button>Delete</button></td>
            </tr>
            <tr>
                <td></td>
                <td>Here is going to be a table that showing as shopping carts</td>
                <td><button>+</button><button>Delete</button></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><button>+</button><button>Delete</button></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><button>+</button><button>Delete</button></td>
            </tr>
        </table>
        <br>
        <button>Check Out</button>
    </div>
    <style>
        td{
            height: 20px;
            border: 1px solid black;
        }
    </style>

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
