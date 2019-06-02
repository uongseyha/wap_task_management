<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>User Profile</title>
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
    <!-- //jQuery -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="task">Home</a><i class="fa fa-angle-right"></i>User Profile</li>
            </ol>
            <!--grid-->
            <div class="grid-form">
                <div class="grid-form1" id="newTask">
                    <h2 id="forms-example" class="">User Profile</h2>
                    <div class="panel-body">
                        <div class="box box-info">
                            <div class="box-body">
                                <div class="col-sm-6">
                                    <div id="map" style="width: 350px; height: 350px;"  align="center">
                                        <!-- /input-group -->
                                    </div>
                                    <div class="col-sm-6">
                                        <h4 style="color:#00b1b1;"></h4></span>
                                        <span><p aria-></p></span>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr style="margin:5px 0 5px 0;">
                                    <div class="col-sm-5 col-xs-6 tital " >First Name:</div><div class="col-sm-7 col-xs-6 " >${userValue.name}</div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " >Email :</div><div class="col-sm-7" > ${userValue.email}</div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " >Address:</div><div class="col-sm-7"> ${userValue.address}</div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " >Post</div><div class="col-sm-7">${userValue.role}</div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                        </div>
                    </div>
                </div>
                <!---->
            </div>
            <!--//grid-->
            <script>
                $(function() {
                    $('#profile-image1').on('click', function() {
                        $('#profile-image-upload').click();
                    });



                })

                function initMyMap() {
                    var lat;
                    var lng;
                    lat = ${userValue.latitude};
                    lng = ${userValue.longitude};
                    var coordinates = {lat, lng};

                    const map = new google.maps.Map(document.getElementById('map'), {
                        center: coordinates,
                        zoom: 10
                    });
                    var marker = new google.maps.Marker({
                        position: coordinates,
                        map: map
                    });
                }
            </script>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEJ0hjdksUuz-1MubA9Qei5pYLdnBcG0k&callback=initMyMap" async defer></script>

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