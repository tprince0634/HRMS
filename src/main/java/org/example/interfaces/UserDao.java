package org.example.interfaces;

import org.example.model.User;

import java.util.List;

public interface UserDao {
    User login(String email, String password);

    List<User> getAllUsers();
}
