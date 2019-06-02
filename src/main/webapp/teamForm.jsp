<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<%--    <script src="<c:url value="js/taskManager.js"/>"></script>--%>

    <!-- //jQuery -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <script src="<c:url value="js/teamList.js"/>"></script>
</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="task">Home</a><i class="fa fa-angle-right"></i>Team</li>
            </ol>
            <!--grid-->
            <div class="grid-form">
                <div class="grid-form1" id="newTask">
                    <h2 id="forms-example" class="">New Team</h2>
                    <div id="error" style="color: red"></div>
                    <form action="team" method="post" id="teamForm">
                        <div class="form-group">
                            <label for="teamName">Team Name:</label>
                            <input type="text" name="teamName" id="teamName" value="${team.teamName}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Developer: <h1>${userName}</h1></label><br>
                            <c:forEach var="user" items="${allUsers}">
                                <label>
                                    <input type="checkbox" name="developer" value="${user.id}"> ${user.name}
                                </label><br>
                            </c:forEach>
                        </div>

                        <div class="form-group">
                            <input type="hidden" value="${action}" name="action">
                            <input type="hidden" value="${team.id}" name="id">
                            <button type="submit" id="saveTeam" class="btn btn-primary">Save</button>
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
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <!-- /Bootstrap Core JavaScript -->

</body>
</html>
