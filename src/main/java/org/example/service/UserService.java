package org.example.service;

import org.example.dao.UserDAOImpl;
import org.example.interfaces.UserDao;
import org.example.model.User;

import java.util.List;

public class UserService {

    private final UserDao userDao;

    public UserService() {
        this.userDao = new UserDAOImpl();
    }


    // =========================================================
    // LOGIN
    // =========================================================

    public User login(String email, String password) {

        if (email == null || email.isBlank()) {
            throw new IllegalArgumentException(
                    "Email cannot be empty"
            );
        }

        if (password == null || password.isBlank()) {
            throw new IllegalArgumentException(
                    "Password cannot be empty"
            );
        }

        return userDao.login(email, password);
    }


    // =========================================================
    // GET ALL USERS
    // =========================================================

    public List<User> getAllUsers() {

        return userDao.getAllUsers();
    }
}