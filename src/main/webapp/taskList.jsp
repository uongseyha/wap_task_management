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
    <link href="css/task.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <!-- //jQuery -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <!-- //lined-icons -->
    <link rel="stylesheet" type="text/css" href="css/table-style.css" />
    <link rel="stylesheet" type="text/css" href="css/basictable.css" />
    <script type="text/javascript" src="js/jquery.basictable.min.js"></script>
    <%-- start: jquery datatable--%>
    <link href="media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />
    <link href="media/dataTables/demo_table.css" rel="stylesheet" type="text/css" />
    <link href="media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" />
    <link href="media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
    <link href="media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <script src="scripts/jquery.dataTables.min.js" type="text/javascript"></script>
    <%-- end:  jquery datatable--%>
    <script src="<c:url value="js/taskListManager.js"/>"></script>
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
                <div class="grid-form1">
                    <h2 id="forms-example" class="">Tasks</h2>
                    <table class="table table-striped" id="tableData">
                        <thead>
                        <tr>
                            <th>Title</th>
                            <th>Due Date</th>
                            <th>Priority</th>
                            <th>Category</th>
                            <th>User</th>
                            <th>Team</th>
                            <th>Finish Date</th>
                            <th>Rate</th>
                            <th>Overdue</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${allTasks}" var="t">
                            <tr class="task-row">
                                <td>${t.title}</td>
                                <td class="duedate">${t.dueDate}</td>
                                <td>${t.priority}</td>
                                <td>${t.category}</td>
                                <td>${t.userName}</td>
                                <td>${t.teamName}</td>
                                <td>${t.finishDate}</td>
                                <td>${t.rate}</td>
                                <td class="overdue"></td>
                                <td>
                                    <a href="task?action=updateFinishDate&id=${t.id}" class="btn btn-success">
                                        <span class="glyphicon glyphicon-ok"></span> Done
                                    </a>
                                    <a href="task?action=update&id=${t.id}&teamName=${t.teamName}&userId=${t.userId}" class="btn btn-warning">Edit</a>
                                    <a href="task?action=delete&id=${t.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!---->
            </div>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#tableData").dataTable({
                        "sPaginationType": "full_numbers",
                        "bJQueryUI": true
                    });
                });
            </script>
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
<script>
    $(document).ready(function() {
        tasksController.init($('#taskPage'));
    });
</script>

</body>
</html>