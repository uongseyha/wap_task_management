package dao;

import db.DBUtils;
import model.Task;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class TaskDataAccess {
    public void save(Task task){
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("insert into task values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, task.getTitle());
            ps.setString(2, task.getDueDate());
            ps.setString(3, task.getPriority());
            ps.setString(4, task.getCategory());
            ps.setInt(5, task.getUserId());
            ps.setString(6, task.getTeamName());
            ps.setString(7, task.getFinishDate());
            ps.setInt(8, task.getRateById());
            ps.setString(9, task.getRate());
            ps.setString(10, task.getRateDate());
//            ps.setString(11, task.getUserName());
//            ps.setString(12, task.getTeamName());
//            ps.setString(13, task.getRateByName());
            ps.executeUpdate();

        }catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Task> getAll(){
        List<Task> ls = new LinkedList<>();

        try {
            ResultSet rs = DBUtils.getPreparedStatement("select a.*,b.name from task as a left join users as b on a.user_id=b.id").executeQuery();
            while(rs.next()){
                Task n = new Task();
                n.setId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDueDate(rs.getString(3));
                n.setPriority(rs.getString(4));
                n.setCategory(rs.getString(5));
                n.setUserId(rs.getInt(6));
                n.setTeamName(rs.getString(7));
                n.setFinishDate(rs.getString(8));
                n.setRateById(rs.getInt(9));
                n.setRate(rs.getString(10));
                n.setRateDate(rs.getString(11));
                n.setUserName(rs.getString(12));
//                n.setRateByName(rs.getString(13));
                ls.add(n);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }


        return ls;
    }

    public static List<Task> getAllTaskByUserId(int userId){
        List<Task> ls = new LinkedList<>();

        String criteria=" where developer_id=" + userId +" and finish_date=''";

        try {
            ResultSet rs = DBUtils.getPreparedStatement("select * from view_getAllUserTeam " + criteria).executeQuery();
            while(rs.next()){
                Task n = new Task();
                n.setId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDueDate(rs.getString(3));
                n.setPriority(rs.getString(4));
                n.setCategory(rs.getString(5));
                n.setUserId(rs.getInt(6));
                n.setTeamName(rs.getString(7));
                n.setFinishDate(rs.getString(8));
                n.setRateById(rs.getInt(9));
                n.setRate(rs.getString(10));
                n.setRateDate(rs.getString(11));
                n.setUserName(rs.getString(12));
                //n.setUserId(rs.getInt(13));
                ls.add(n);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }


        return ls;
    }

    public static Task getTaskById(int id){
        List<Task> ls = new LinkedList<>();
        String sql = "select a.*,b.name from task as a left join users as b on a.user_id=b.id where a.id = " + id ;
        try {
            ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
            while(rs.next()){
                Task n = new Task();
                n.setId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDueDate(rs.getString(3));
                n.setPriority(rs.getString(4));
                n.setCategory(rs.getString(5));
                n.setUserId(rs.getInt(6));
                n.setTeamName(rs.getString(7));
                n.setFinishDate(rs.getString(8));
                n.setRateById(rs.getInt(9));
                n.setRate(rs.getString(10));
                n.setRateDate(rs.getString(11));
                n.setUserName(rs.getString(12));
//                n.setRateByName(rs.getString(13));
                ls.add(n);

                ls.add(n);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }


        return ls.get(0);
    }

    public void update(Task task){
        try {
            String sql = "update task SET title = ?"
                    + ",due_date = ?"
                    + ",priority = ?"
                    + ",category = ?"
                    + ",user_Id = ?"
                    + ",team_name = ?"
                    + ",finish_date = ?"
                    + ",rate_by_id = ?"
                    + ",rate = ?"
                    + ",rate_date = ?"
                    + " where id = ?";
            PreparedStatement ps= DBUtils.getPreparedStatement(sql);
            ps.setString(1, task.getTitle());
            ps.setString(2, task.getDueDate());
            ps.setString(3, task.getPriority());
            ps.setString(4, task.getCategory());
            ps.setInt(5, task.getUserId());
            ps.setString(6, task.getTeamName());
            ps.setString(7, task.getFinishDate());
            ps.setInt(8, task.getRateById());
            ps.setString(9, task.getRate());
            ps.setString(10, task.getRateDate());
            ps.setInt(11, task.getId());
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id){
        try {
            String sql = "delete task where id = ?";
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateFinishDate(int id){
        try {
            String sql = "update task SET finish_date = CONVERT(char(10), GetDate(),126)" + " where id = ?";
            PreparedStatement ps= DBUtils.getPreparedStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TaskDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
