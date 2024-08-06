package UserDTO_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.MYSQLUtil; // ORACLEUtil을 사용하는 것으로 가정

public class UserDAO {
    private static final String CHECK_USER = "SELECT * FROM HG_user_table WHERE id = ? AND pw = ?";
    private static final String CREATE_USER = "INSERT INTO HG_user_table (id, pw, name, role, email) VALUES (?, ?, ?, 'user', ?)";
    private static final String CHECK_USER_EXISTS = "SELECT COUNT(*) FROM HG_user_table WHERE id = ?";
    private static final String GET_USER_BY_ID = "SELECT * FROM HG_user_table WHERE id = ?";
    private static final String UPDATE_USER = "UPDATE HG_user_table SET pw = ?, name = ?, email = ? WHERE id = ?";

    public UserDTO checkUser(String id, String password) {
        UserDTO user = null;
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(CHECK_USER)) {

            stmt.setString(1, id);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new UserDTO(
                            rs.getString("id"),
                            rs.getString("pw"),
                            rs.getString("name"),
                            rs.getString("role"),
                            rs.getString("email")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean createUser(UserDTO user) {
        if (user.getId().equalsIgnoreCase("admin")) {
            return false;
        }

        boolean isUserCreated = false;

        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(CREATE_USER)) {

            stmt.setString(1, user.getId());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getEmail());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isUserCreated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUserCreated;
    }

    public boolean isUserExists(String id) {
        boolean exists = false;
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(CHECK_USER_EXISTS)) {

            stmt.setString(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    public UserDTO getUserById(String id) {
        UserDTO user = null;
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(GET_USER_BY_ID)) {

            stmt.setString(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new UserDTO(
                            rs.getString("id"),
                            rs.getString("pw"),
                            rs.getString("name"),
                            rs.getString("role"),
                            rs.getString("email")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(UserDTO user) {
        boolean isUpdated = false;
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_USER)) {

            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getId());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
}
