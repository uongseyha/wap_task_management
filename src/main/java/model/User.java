package model;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String address;
    private float longitude;
    private float latitude;
    private String role;

    /*public User(int id, String name, String email, String password, String address, float longitude, float latitude, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.longitude = longitude;
        this.latitude = latitude;
        this.role = role;
    }*/

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }
  
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public float getLongitude() {
        return longitude;
    }

    public float getLatitude() {
        return latitude;
    }

    public String getRole() {
        return role;
    }

    public String getName() {
        return this.name;
    }

    public void setId(int id) {
        this.id=id;
    }
}
