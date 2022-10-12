//package com.asd.project.model;
//
//import com.asd.project.model.dao.OrderDao;
//import com.asd.project.utils.DB;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.TestInstance;
//
//
//import java.sql.SQLException;
//
//@TestInstance(TestInstance.Lifecycle.PER_CLASS)
//public class OrderTest{
//    DB db;
//    OrderDao orderDao = new OrderDao(new DB());
//    public OrderTest() throws SQLException {
//
//    }
//
//    @Test
//    public void addquantitytest() throws SQLException {
//        orderDao.addquantity(92,1);
//    }
//
//    @Test
//    public void deletedish() throws SQLException {
//        orderDao.deletedish(92,1);
//    }
//
//    @Test
//    public void viewcarttest() throws SQLException{
//        orderDao.viewcart(92);
//    }
//
//    @Test
//    public void minsquantitytest() throws SQLException{
//        orderDao.minusquantity(92,1);
//    }
//
//    @Test void submittest() throws SQLException{
//        orderDao.submitorder(92);
//    }
//
//
//}
