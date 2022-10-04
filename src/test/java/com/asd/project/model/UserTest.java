package com.asd.project.model;

import com.asd.project.model.dao.UserDao;
import com.asd.project.utils.DB;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class UserTest {
    DB db;
    private User tester;
    private UserDao userDao;
    private int id;
    private String name;
    private String email;
    private String address;
    private String phone;
    private String role;
    private String password;

    public UserTest() throws SQLException {
        db = new DB();
        userDao = new UserDao(db);
        this.name = "Tester";
        this.email = "testing@testing.com";
        this.address = "testing testing";
        this.phone = "0499999999";
        this.role = "Customer";
        this.password = "test123";
    }

    @BeforeAll
    public void setup() throws SQLException {
        this.id = userDao.create(name, email, address, phone, role, password);
        assertTrue(this.id != 0);
    }

    @AfterAll
    public void cleanup() throws SQLException {
        userDao.delete(id);
        tester = userDao.getUserByEmail(email);
        assertNull(tester);
    }

    @Test
    public void readUserTest() throws SQLException {
        tester = userDao.getUserByEmail(email);
        assertNotNull(tester);
        assertEquals(tester.getId(), this.id);
        assertEquals(tester.getName(), this.name);
        assertEquals(tester.getPassword(), this.password);
        assertEquals(tester.getRole(), this.role);
        assertEquals(tester.getAddress(), this.address);
        assertEquals(tester.getPhoneNumber(), this.phone);
    }
    @Test
    public void getUserByIdTest() throws SQLException {
        tester = userDao.getUserById(id);
        assertNotNull(tester);
        assertEquals(tester.getId(), this.id);
        assertEquals(tester.getName(), this.name);
        assertEquals(tester.getPassword(), this.password);
        assertEquals(tester.getRole(), this.role);
        assertEquals(tester.getAddress(), this.address);
        assertEquals(tester.getPhoneNumber(), this.phone);
    }

    public void updateUserTest() throws SQLException {
        userDao.update("tester2", "pass", "test","05555555","testing@testing.com");
        tester = userDao.getUserByEmail("testing@testing.com");
        assertEquals(tester.getName(), "tester2");
    }
}