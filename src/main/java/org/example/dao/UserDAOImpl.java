package org.example.dao;

import org.example.interfaces.UserDao;
import org.example.model.User;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class UserDAOImpl  implements UserDao {
    public User login(String email, String password) {

        User user = null;
        String sql = "{CALL sp_login_user(?, ?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("UserId"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
                user.setRoleId(rs.getInt("RoleId"));
                user.setRoleName(rs.getString("RoleName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
