<%--
  Created by IntelliJ IDEA.
  User: solam
  Date: 4/22/2019
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Enter User</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/userdesign.css" rel='stylesheet' type='text/css' />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">

    <!-- jQuery -->

    <!-- //jQuery -->

    <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/user.js"></script>

</head>
<body>




    <form id="userForm" action="AllUserServlet" method="post" class="form-style-9">
        <div class="error" style="color: red;"></div>
        <ul>
            <li>
                <input type="text" id="name"  name="name" value="${userValue.name}" class="field-style field-full align-none" placeholder="Name" />
            </li>
            <li>
                <input type="email" id="email"  name="email" value="${userValue.email}" class="field-style field-full align-none" placeholder="E-mail" />
            </li>
            <li>
                <input type="password" id="password" name="password" class="field-style field-full align-none" placeholder="Password" />
            </li>
            <li>
                <input type="password" id="repassword" name="repassword" class="field-style field-full align-none" placeholder="Re-enter Password" />
            </li>
            <li>
                <input type="text" name="address" id="address" value="${userValue.address}" class="field-style field-full align-none" placeholder="Address" />
            </li>
            <li>
                <input type="text" id="long" name="long" class="field-style field-split align-left" required placeholder="Longitude" />
                <input type="text" id="lat" name="lat" class="field-style field-split align-right" required placeholder="Latitude" />
            </li>
            <li>
                <select name="role" id="roleSelect">
                    <option value="" selected="selected">Select Role</option>
                    <option value="ADMIN">Admin</option>
                    <option value="MANAGER">Project Manager</option>
                    <option value="DEVELOPER">Developer</option>
                </select>
            </li>

            <li>
                <input type="hidden"  value="${action}" name="action">
                <input type="hidden" value="${userValue.id}>" name="id">
            </li>

            <li>
                <input type="submit" value="Save User" id="saveUser" />
            </li>
        </ul>
    </form>

    <c:import url="sidemenu.jsp" />

</body>
<script>
    $(function () {
        $('.roleSelect select').val(${userValue.role});
    })
</script>
</html>
