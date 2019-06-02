package controller;

import dao.TaskDataAccess;
import dao.TeamDataAccess;
import model.Task;
import model.UserGlobal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Task",urlPatterns = "/task")
public class TaskController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        RequestDispatcher rd = null;
        TaskDataAccess db = new TaskDataAccess();

        String action=request.getParameter("action");
        if (action!=null){
            if (action.equals("new")){
                Task task = new Task();
                request.setAttribute("task", task);
                request.setAttribute("action", "new");
                request.setAttribute("teamFilter", TeamDataAccess.getDistrictTeam());
                request.setAttribute("allUsers", TeamDataAccess.getAllUsers());
                rd = request.getRequestDispatcher("/taskForm.jsp");
            }else if(action.equals("update")){
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("task", TaskDataAccess.getTaskById(id));
                request.setAttribute("teamFilter", TeamDataAccess.getDistrictTeam());
                request.setAttribute("allUsers", TeamDataAccess.getAllUsers());
                request.setAttribute("selectedTeam", request.getParameter("teamName"));
                request.setAttribute("selectedUser", request.getParameter("userId"));
                request.setAttribute("action", "update");
                rd = request.getRequestDispatcher("/taskForm.jsp");
            }else if(action.equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                db.delete(id);
                request.setAttribute("allTasks", getAllTaskByUsers());
                rd = request.getRequestDispatcher("/taskList.jsp");
            }else if(action.equals("updateFinishDate")){
                int id = Integer.parseInt(request.getParameter("id"));
                db.updateFinishDate(id);
                request.setAttribute("allTasks", getAllTaskByUsers());
                rd = request.getRequestDispatcher("/taskList.jsp");
            }
        }
        else{
            request.setAttribute("allTasks", getAllTaskByUsers());
            rd = request.getRequestDispatcher("/taskList.jsp");
        }

        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getParameter("action");
        RequestDispatcher rd = null;

        Task task = new Task();
        task.setTitle(request.getParameter("title"));
        task.setDueDate(request.getParameter("dueDate"));
        task.setPriority(request.getParameter("priority"));
        task.setCategory(request.getParameter("category"));

        //System.out.println("userId:" + request.getParameter("userId"));
        if (request.getParameter("userId").equals("") || request.getParameter("userId")==null){
            System.out.println("userId: 0");
            task.setUserId(-1);
        }else{
            System.out.println("userId: " + request.getParameter("userId"));
            task.setUserId(Integer.parseInt(request.getParameter("userId")));
        }

        //task.setUserId(2);
        task.setTeamName(request.getParameter("teamName"));
        task.setFinishDate(request.getParameter("finishDate"));
        task.setRate(request.getParameter("rate"));
        task.setRateById(UserGlobal.userId);
        task.setRateDate(request.getParameter("rateDate"));
//        task.setUserName(request.getParameter("userId"));
//        task.setRateByName(request.getParameter("2"));
        TaskDataAccess db = new TaskDataAccess();

        if(action.equals("new")){

            db.save(task);
        }else if(action.equals("update")){

            task.setId(Integer.parseInt(request.getParameter("id")));

            db.update(task);
        }

        request.setAttribute("allTasks", getAllTaskByUsers());
        rd = request.getRequestDispatcher("/taskList.jsp");
        rd.forward(request, response);
    }

    public List<Task> getAllTaskByUsers(){
        if (UserGlobal.userRole.equals("DEVELOPER")){
            System.out.println("log as developer..." + UserGlobal.userId + "," + UserGlobal.userName);
            return TaskDataAccess.getAllTaskByUserId(UserGlobal.userId);
        }

        System.out.println("log as manager / admin...");
        return TaskDataAccess.getAll();
    }
}
