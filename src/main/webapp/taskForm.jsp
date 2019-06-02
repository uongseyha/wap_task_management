<%@ page import="model.UserGlobal" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Task List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="<c:url value="css/style.css"/>" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery-2.1.4.min.js"></script>
<%--    <script src="js/jquery-3.3.1.min.js"></script>--%>
    <script src="<c:url value="js/taskManager.js"/>"></script>

    <!-- //jQuery -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />

</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="task">Home</a><i class="fa fa-angle-right"></i>Task</li>
            </ol>
            <!--grid-->
            <div class="grid-form">
                <div class="grid-form1" id="newTask">
                    <h2 id="forms-example" class="">New Task</h2>
                    <div class="error" style="color: red"></div>
                    <form action="task" method="post" id="taskForm">
                        <div class="form-group">
                            <label>Description:</label>
                            <input type="text" name="title" id="title" value="${task.title}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Due Date:</label>
                            <input type="date" name="dueDate" id="dueDate" value="${task.dueDate}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Priority:</label>
                            <label class="radio-inline">
                                <label><input type="radio" name="priority" value="LOW" <c:if test="${task.priority=='LOW'}">checked</c:if>>Low</label>
                            </label>
                            <label class="radio-inline">
                                <label><input type="radio" name="priority" value="NORMAL" <c:if test="${task.priority=='NORMAL'}">checked</c:if>>Normal</label>
                            </label>
                            <label class="radio-inline">
                                <label><input type="radio" name="priority" value="HIGH" <c:if test="${task.priority=='HIGH'}">checked</c:if>>High</label>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Category:</label>
                            <label class="radio-inline">
                                <label><input type="radio" name="category" value="PERSONAL" <c:if test="${task.category=='PERSONAL'}">checked</c:if>>Personal</label>
                            </label>
                            <label class="radio-inline">
                                <label><input type="radio" name="category" value="TEAM" <c:if test="${task.category=='TEAM'}">checked</c:if>>Team</label>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>Developer:</label>
                            <select name="userId" id="developer">
                                <option value="">Select User</option>
                                <c:forEach var="user" items="${allUsers}">
                                    <option value="${user.id}" ${user.id == selectedUser ? 'selected="selected"' : ''}>${user.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label id="teamLabel">Team:</label>
                            <select name="teamName" id="team">
                                <option value="">Select Team</option>
                                <c:forEach var="dev" items="${teamFilter}">
                                    <option value="${dev.teamName}" ${dev.teamName == selectedTeam ? 'selected="selected"' : ''}>${dev.teamName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Finish Date:</label>
                            <input type="date" name="finishDate" id="finishDate" value="${task.finishDate}" class="form-control"/>
                        </div>
                        <% if (!UserGlobal.userRole.equals("DEVELOPER")){%>

                        <div class="form-group">
                            <label>Rate:</label>
                            <label class="radio-inline">
                                <label><input type="radio" name="rate" value="EXCELLENT" <c:if test="${task.rate=='EXCELLENT'}">checked</c:if>>Excellent</label>
                            </label>
                            <label class="radio-inline">
                                <label><input type="radio" name="rate" value="GOOD" <c:if test="${task.rate=='GOOD'}">checked</c:if>>Good</label>
                            </label>
                            <label class="radio-inline">
                                <label><input type="radio" name="rate" value="BAD" <c:if test="${task.rate=='BAD'}">checked</c:if>>Bad</label>
                            </label>
                        </div>
                        <%}%>


                        <div class="form-group">
                            <input type="hidden" value="${action}" name="action">
                            <input type="hidden" value="${task.id}" name="id">
                            <button type="submit" class="btn-primary btn" id="saveTask" >Save</button>
                            <button class="btn-default btn" id="clearTask" >Clear</button>
                        </div>

                    </form>

                </div>
                <!---->
            </div>
            <!--//grid-->

            <!-- script-for sticky-nav -->
            <script>
                $(document).ready(function() {
                    var navoffeset=$(".header-main").offset().top;
                    $(window).scroll(function(){
                        var scrollpos=$(window).scrollTop();
                        if(scrollpos >=navoffeset){
                            $(".header-main").addClass("fixed");
                        }else{
                            $(".header-main").removeClass("fixed");
                        }
                    });

                });
            </script>
            <!-- /script-for sticky-nav -->
            <!--inner block start here-->
            <div class="inner-block">

            </div>
            <!--inner block end here-->
            <!--copy rights start here-->
            <div class="copyrights">

            </div>
            <!--COPY rights end here-->
        </div>
    </div>
    <!--//content-inner-->
    <!--/sidebar-menu-->
    <c:import url="sidemenu.jsp" />
<!--js -->
<%--<script src="js/jquery.nicescroll.js"></script>--%>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->
<script>
    $(document).ready(function() {
        tasksController.init($('#taskPage'));
    });
</script>

</body>
</html>