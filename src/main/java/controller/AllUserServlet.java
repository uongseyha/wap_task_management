package controller;

import dao.UserDataAccess;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AllUserServlet", urlPatterns = "/AllUserServlet")
public class AllUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action=request.getParameter("action");
        RequestDispatcher rd = null;


        if(action.equals("new")){
            User user=returnUser(request);

            UserDataAccess db = new UserDataAccess();
            db.addNew(user);

        }else if(action.equals("update")){
            User user = returnUser(request);
            String id=request.getParameter("id").replace(">","");
            user.setId(Integer.parseInt(id));
            UserDataAccess db = new UserDataAccess();
            db.update(user);
        }



        request.setAttribute("allUsers", UserDataAccess.getAllUsers());
        rd = request.getRequestDispatcher("/User.jsp");
        rd.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        UserDataAccess db = new UserDataAccess();

        String action=request.getParameter("action");
        if (action!=null){
            if (action.equals("new")){

                User user=new User();
                request.setAttribute("userValue", user);
                request.setAttribute("action", "new");
               rd = request.getRequestDispatcher("/UserEntry.jsp");


            }

            else if(action.equals("update")){
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("userValue", UserDataAccess.getUserById(id));
                request.setAttribute("action", "update");
               rd = request.getRequestDispatcher("/UserEntry.jsp");
            }

            else if(action.equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                UserDataAccess.delete(id);
                request.setAttribute("allUsers", UserDataAccess.getAllUsers());
                rd = request.getRequestDispatcher("/User.jsp");
            }

            else if(action.equals("view")){
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("userValue", UserDataAccess.getUserById(id));
                rd=request.getRequestDispatcher("/UserProfile.jsp");
            }
        }
        else{
            request.setAttribute("allUsers", UserDataAccess.getAllUsers());
            rd = request.getRequestDispatcher("/User.jsp");
        }

        rd.forward(request, response);
    }

    protected User returnUser(HttpServletRequest request){

        User user=new User();
        user.setId(0);
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setAddress(request.getParameter("address"));
        user.setLatitude(Float.parseFloat(request.getParameter("lat")+"f"));
        user.setLongitude(Float.parseFloat(request.getParameter("long")+"f"));
        user.setPassword(request.getParameter("password"));
        user.setRole(request.getParameter("role"));


        return user;

    }
}
