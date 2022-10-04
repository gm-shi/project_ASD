# project_ASD
ASD project


This web application - restaurant online ordering system, implements MVC design pattern:
  - Model: src/main/java/com/asd/project/model
  - Controller: src/main/java/com/asd/project/controller
  - View: /src/webapp/*.jsp
  - Utils: src/main/java/com/asd/project/utils
  - Image resources: /src/webapp/img
  - JunitTest: src/test/*
  
Responsibility:

  - Gongming Shi (13713654):
    - Model: User, UserAccessLog, UserAccessLogDao, UserDao
    - Controller: LoginServlet, LogoutServlet, UserAccessLogServlet, UserServlet
    - View: index.jsp delete.jsp, accesslog.jsp, editUserInfo.jsp, home.jsp, register.jsp, searchAccessLog.jsp, usermanagement.jsp, welcome.jsp
    - Utils: DB, Helper, Validator
    - JunitTest: UserTest
  - Jianyin Xu (13641283):
    - Model: CartDao, CategoryDao, DishDao, Category, Dish
    - Controller: DishManagement, DishSelectManagement
    - View: category.jsp, dishes.jsp, menu.jsp
    - Utils: DB, Helper, Validator
    - JunitTest: DishManagementTest
  - LUN OU (14065890):
    - Model: Restaurant, RestaurantDao
    - Controller: EmailServlet, RestaurantServlet
    - View: editRestaurant.jsp email.jsp, Restaurant.jsp, sendEmail.jsp
    - Utils: EmailUtil, EmailService
    - JunitTest: RestaurantTest
  - Changyu Wang (13715507)
    - Model : Order, OrderProcess, OrderDao, OrderProcessDao
    - Controller : OrderManagement, OrderServlet
    - View : makeorder.jsp, myorder.jsp, payment.jsp(Modified buttons) home.jsp(Modified buttons)
    - JunitTest : OrderTest
  - Ao Qu (13323415):
    - Model: Payment, PaymentDao
    - Controller: AddPaymentServlet
    - View: addPayment.jsp, confirmPayment.jsp, personInfo.jsp
    - Utils: DB, Helper, Validator
