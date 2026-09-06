package org.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
private static final String URL = "jdbc:mysql://localhost:3306/Pulse360_FinalDb?useSSL=false&allowPublicKeyRetrieval=true";
private static final String USERNAME = "root";
private static final String PASSWORD = "123456789";

// Static initializer block runs ONCE when the class is loaded into memory
static {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        System.err.println("MySQL Driver class not found!");
        e.printStackTrace();
        throw new RuntimeException("Failed to load MySQL Driver", e);
    }
}

// Method to get the active DB connection
public static Connection getConnection() throws SQLException {
    return DriverManager.getConnection(URL, USERNAME, PASSWORD);
}
}

