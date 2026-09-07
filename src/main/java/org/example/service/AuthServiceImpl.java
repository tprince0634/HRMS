package org.example.service;

import org.example.model.User;
import org.example.dao.UserDAOImpl;

public class AuthServiceImpl implements AuthService {
        private final UserDAOImpl userDAO;

        public AuthServiceImpl() {
            userDAO = new UserDAOImpl();
        }

        @Override
        public User authenticate(String email, String password) {
            if (email == null || email.trim().isEmpty()) {
                return null;
            }
            if (password == null || password.trim().isEmpty()) {
                return null;
            }
            return userDAO.login(email, password);
        }

    }
