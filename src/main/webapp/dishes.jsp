<%--
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

  <title>Hello, world!</title>
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


  <h1>Dishes management</h1>

  <main role="main">
    <section class="jumbotron text-center" style="display: flex; flex-direction: column; align-items: center;">
      <strong><h1 class="display-4">Dishes</h1></strong>
    </section>
    <div style="display: flex; flex-direction: column; align-items: center;">
      <div style="width: 30%">
        <form method="post" action="userServlet?action=register">
          <div class="form-group">
            <label for="inputUserName">Dishes name</label>
            <input type="text" name="name" class="form-control" id="inputUserName" required>
          </div>
          <div class="form-group">
            <label for="inputEmail4">Dishes description</label>
            <input type="email" name="email" class="form-control" id="inputEmail4" required>
          </div>
          <div class="form-group">
            <label for="inputPassword">Dishes price</label>
            <input type="password" onblur="confirm()" name="password" class="form-control"
                   id="inputPassword" required>

          </div>
          <div style=" text-align: center;">
            <button style="margin: 20px" type="submit" id="addButton" class="btn btn-primary">Add
            </button>
            <button style="margin: 20px" type="submit" id="removeButton" class="btn btn-primary">Remove
            </button>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>
