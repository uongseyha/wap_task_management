<%@ page import="model.UserGlobal" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Pooled Admin Panel Category Flat Bootstrap Responsive Web Template | Buttons :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/userdesign.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <script src="js/user.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <!-- jQuery -->

    <!-- //jQuery -->

    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <!-- //lined-icons -->

    <%-- start: jquery datatable--%>
    <link href="media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />
    <link href="media/dataTables/demo_table.css" rel="stylesheet" type="text/css" />
    <link href="media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" />
    <link href="media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
    <link href="media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <script src="scripts/jquery.dataTables.min.js" type="text/javascript"></script>


</head>

<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">


            <!--heder end here-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="task">Home</a><i class="fa fa-angle-right"></i>User</li>
            </ol>


<%--                &lt;%&ndash;<button id="addUserButton" onclick="location.href='AllUserServlet?action=new';">&#43 Add User</button>--%>
<%--                <button id="viewUserButton" onclick="location.href='AllUserServlet';" > View User List</button>&ndash;%&gt;--%>

<!-- Form here-->



            <!-- form div ends here-->


            <!-- table starts here-->
            <div class="grid-form">
                <div class="grid-form1">
            <h2 id="forms-example" class="">Users</h2>

            <%--<table id="myTable">--%>
            <table class="table table-striped" id="tableData">

                    <thead>
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">name</th>
                        <th scope="col">Address</th>
                        <th scope="col">email</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${allUsers}" var="u">
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.name}</td>
                            <td>${u.address}</td>
                            <td>${u.email}</td>
                            <td>
                                <a href="AllUserServlet?action=update&id=${u.id}" class="btn btn-warning">Edit</a>
                                <a href="AllUserServlet?action=delete&id=${u.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                                <a href="AllUserServlet?action=view&id=${u.id}" class="btn btn-warning">View</a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                </div>
            </div>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#tableData").dataTable({
                        "sPaginationType": "full_numbers",
                        "bJQueryUI": true
                    });
                });
            </script>


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