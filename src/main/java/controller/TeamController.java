package controller;

import dao.TeamDataAccess;
import model.Team;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Team",urlPatterns = "/team")
public class TeamController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        RequestDispatcher rd = null;
        TeamDataAccess db = new TeamDataAccess();

        String action=request.getParameter("action");
        if (action!=null){
            if (action.equals("new")){
                Team task = new Team();
                request.setAttribute("team", task);
                request.setAttribute("action", "new");
                request.setAttribute("allUsers", TeamDataAccess.getAllUsers());
                rd = request.getRequestDispatcher("/teamForm.jsp");
            }
            else if(action.equals("update")){
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("team", TeamDataAccess.getTeamById(id));
                request.setAttribute("userName", request.getParameter("userName"));
                request.setAttribute("action", "update");
                rd = request.getRequestDispatcher("/teamForm.jsp");
            }
            else if(action.equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                db.delete(id);
                request.setAttribute("allTeams", TeamDataAccess.getAll());
                rd = request.getRequestDispatcher("/teamList.jsp");
            }
        }
        else{
            request.setAttribute("allTeams", TeamDataAccess.getAll());
            rd = request.getRequestDispatcher("/teamList.jsp");
        }

        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getParameter("action");
        RequestDispatcher rd = null;

        Team team = new Team();
        team.setTeamName(request.getParameter("teamName"));
        TeamDataAccess db = new TeamDataAccess();
        if(action.equals("new")){
            if (!(request.getParameter("developer").equals("")
                    || request.getParameter("developer")==null)){
                String[] dev=request.getParameterValues("developer");
                for(String d: dev){
                    team.setUserId(Integer.parseInt(d));
                    db.save(team);
                }
            }

        }
        else if(action.equals("update")){
            team.setId(Integer.parseInt(request.getParameter("id")));
            db.update(team);
        }

        request.setAttribute("allTeams", TeamDataAccess.getAll());
        rd = request.getRequestDispatcher("/teamList.jsp");
        rd.forward(request, response);
    }
}
