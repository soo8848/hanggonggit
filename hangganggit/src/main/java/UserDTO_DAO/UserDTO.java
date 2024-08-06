package UserDTO_DAO;

public class UserDTO {
    private String id;
    private String password;
    private String name;
    private String role;
    private String email;

    public UserDTO(String id, String password, String name, String role, String email) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.role = role;
        this.email = email;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
