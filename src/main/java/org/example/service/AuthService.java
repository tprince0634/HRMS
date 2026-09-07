package org.example.service;
import org.example.model.User;

public interface AuthService {
    User authenticate(String email, String password);
}
