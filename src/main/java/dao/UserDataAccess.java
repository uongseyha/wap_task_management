package dao;

import db.DBUtils;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDataAccess {

    public void addNew(User user){
        String sql="insert into users values(?,?,?,?,?,?,?)";
        psUpdate(sql,user);
    }

    public  static List<User> getAllUsers(){
        List<User> list=new LinkedList<>();

        try {
            ResultSet rs=DBUtils.getPreparedStatement("select * from users").executeQuery();
            while (rs.next()){

                User user=returnUser(rs);


                list.add(user);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public static User getUserById(int id){
        String sql = "select * from users where id = " + id + " order by id desc";
        return getUserByQuery(sql);
    }

    public static User getUserByEmail(String email){
        String sql = "select * from users where email = '" + email + "' order by id desc";
        System.out.println(sql);
        return getUserByQuery(sql);
    }

    private static User getUserByQuery(String sql){
        List<User> list=new LinkedList<>();
        try {
            ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
            while(rs.next()){
                User user=returnUser(rs);
                list.add(user);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list.get(0);
    }

    public static void delete(int id){
        try {
            String sql = "delete users where id = ?";
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void update(User user){
        String sql = "update users SET name = ? , email = ? , password = ? , address = ? ,  user_role = ?" + " where id = ?";
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getRole());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
        }
        catch (Exception e){

        }
    }

    public static void psUpdate(String sql,User user){
        try {
            PreparedStatement ps= DBUtils.getPreparedStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getAddress());
            ps.setFloat(5,user.getLatitude());
            ps.setFloat(6,user.getLongitude());
            ps.setString(7,user.getRole());
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static User returnUser(ResultSet rs){
        User user=new User();

        try {
            user.setId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setEmail(rs.getString(3));
            user.setAddress(rs.getString(5));
            user.setLatitude(rs.getFloat(6));
            user.setLongitude(rs.getFloat(7));
            user.setPassword(rs.getString(4));
            user.setRole(rs.getString(8));
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return user;
    }


}
