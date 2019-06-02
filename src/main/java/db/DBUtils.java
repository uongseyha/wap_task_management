/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Thang
 */
public class DBUtils {
    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException{
        PreparedStatement ps =  null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://sql5041.site4now.net;databaseName=DB_A46D82_wapproject";
        String user = "DB_A46D82_wapproject_admin";
        String pass = "Wappassword123";

        Connection con = DriverManager.getConnection(url, user, pass);
        ps = con.prepareStatement(sql);
        return ps;
    }
    
    //Check connections.
    public static void main(String[] args) throws ClassNotFoundException, SQLException {


//        PreparedStatement ps = DBUtils.getPreparedStatement("insert into temp values(?)");
//        ps.setString(1, "t1");
//        ps.executeUpdate();

    }
}
