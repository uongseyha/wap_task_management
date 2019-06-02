
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Posts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="../css/userdesign.css" rel='stylesheet' type='text/css' />
    <link href="../css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="../css/font-awesome.css" rel="stylesheet">
    <script src="../js/userjs.js"></script>
    <!-- jQuery -->

    <!-- //jQuery -->

    <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- lined-icons -->
    <link rel="stylesheet" href="../css/icon-font.min.css" type='text/css' />

    </head>
<body>
<div>
<table>
    <caption>Users</caption>
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
            <td>${u.name}</td>`
            <td>${u.address}</td>
            <td>${u.email}</td>
            <td>
                <a href="AllUserServlet?action=update&id=${u.id}" class="btn btn-warning">Update</a>
                <a href="AllUserServlet?action=delete&id=${u.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</div>
</body>
</html>
