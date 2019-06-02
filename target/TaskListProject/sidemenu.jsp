<%@ page import="model.UserGlobal" %><%--
  Created by IntelliJ IDEA.
  User: romulo
  Date: 4/23/19
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<!--/sidebar-menu-->

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="sidebar-menu">
    <header class="logo1">
        <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
    </header>
    <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
    <div class="menu">
        <ul id="menu" >
            <li><a href="account.jsp"><i class="fa fa-file-text-o"></i> <span>Account</span><div class="clearfix"></div></a></li>



            <li id="menu-academico"><a href="#"><i class="fa fa-check-square-o nav_icon" aria-hidden="true"></i> <span>Task</span><span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                <ul id="menu-academico-sub" >
                    <li id="menu-academico-avaliacoes" ><a href="task?action=new">New Task</a></li>
                    <li id="menu-academico-avaliacoes" ><a href="task">Task List</a></li>
                </ul>
            </li>
                <%
             if(!UserGlobal.userRole.equalsIgnoreCase("developer")){
%>
            <li id="menu-academico"><a href="#"><i class="fa fa-list-ul nav_icon" aria-hidden="true"></i> <span>Team</span><span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                <ul id="menu-academico-sub" >
                    <li id="menu-academico-avaliacoes" ><a href="team?action=new">New Team</a></li>
                    <li id="menu-academico-avaliacoes" ><a href="team">Team List</a></li>
                </ul>
            </li>
                <%
                }
            %>


            <%
             if(!UserGlobal.userRole.equalsIgnoreCase("developer")&&UserGlobal.userRole.equalsIgnoreCase("admin")){
%>
            <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul nav_icon" aria-hidden="true"></i> <span>Users</span><span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                <ul id="menu-academico-sub" >
                    <li id="menu-academico-avaliacoes" ><a href="AllUserServlet?action=new">New User</a></li>
                    <li id="menu-academico-avaliacoes" ><a href="AllUserServlet">User List</a></li>
                </ul>
            </li>
            <%
                }
            %>

            <li style="height: 50px"></li>
            <li><a href="Login.jsp"><i class="fa fa-file-text-o"></i> <span>Logout</span><div class="clearfix"></div></a></li>





<%--            <li id="menu-academico" ><a href="inbox.html"><i class="fa fa-envelope nav_icon"></i><span>Inbox</span><div class="clearfix"></div></a></li>--%>
<%--            <li><a href="gallery.html"><i class="fa fa-picture-o" aria-hidden="true"></i><span>Gallery</span><div class="clearfix"></div></a></li>--%>
<%--            <li id="menu-academico" ><a href="charts.html"><i class="fa fa-bar-chart"></i><span>Charts</span><div class="clearfix"></div></a></li>--%>
<%--            <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Short Codes</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
<%--                <ul id="menu-academico-sub" >--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="icons.html">Icons</a></li>--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="typography.html">Typography</a></li>--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="faq.html">Faq</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--            <li id="menu-academico" ><a href="errorpage.html"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span>Error Page</span><div class="clearfix"></div></a></li>--%>
<%--            <li id="menu-academico" ><a href="#"><i class="fa fa-cogs" aria-hidden="true"></i><span> UI Components</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
<%--                <ul id="menu-academico-sub" >--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="button.html">Buttons</a></li>--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="grid.html">Grids</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--            <li><a href="tabels.html"><i class="fa fa-table"></i>  <span>Tables</span><div class="clearfix"></div></a></li>--%>
<%--            <li><a href="maps.html"><i class="fa fa-map-marker" aria-hidden="true"></i>  <span>Maps</span><div class="clearfix"></div></a></li>--%>
<%--            <li id="menu-academico" ><a href="#"><i class="fa fa-file-text-o"></i>  <span>Pages</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
<%--                <ul id="menu-academico-sub" >--%>
<%--                    <li id="menu-academico-boletim" ><a href="calendar.html">Calendar</a></li>--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="signin.html">Sign In</a></li>--%>
<%--                    <li id="menu-academico-avaliacoes" ><a href="signup.html">Sign Up</a></li>--%>


<%--                </ul>--%>
<%--            </li>--%>
<%--            <li><a href="#"><i class="fa fa-check-square-o nav_icon"></i><span>Forms</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
<%--                <ul>--%>
<%--                    <li><a href="input.html"> Input</a></li>--%>
<%--                    <li><a href="validation.html">Validation</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--        </ul>--%>
    </div>
</div>
<div class="clearfix"></div>
</div>
<script>
    var toggle = true;

    $(".sidebar-icon").click(function() {
        if (toggle)
        {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position":"absolute"});
        }
        else
        {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function() {
                $("#menu span").css({"position":"relative"});
            }, 400);
        }

        toggle = !toggle;
    });
</script>