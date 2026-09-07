package org.example.interfaces;

import org.example.model.User;

public interface UserDao {
    User login(String email, String password);
}
