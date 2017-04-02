<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="UTF-8" />
        <title>DivSec |Admin Dashboard</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!--[if IE]>
                   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                   <![endif]-->
        <!-- GLOBAL STYLES -->

        <link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/css/main.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/css/theme.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/css/MoneAdmin.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/plugins/Font-Awesome/css/font-awesome.css" />" />

        <!--END GLOBAL STYLES -->

        <!-- PAGE LEVEL STYLES -->
        <link rel="stylesheet" href="<c:url value="/resources/css/layout2.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/plugins/morris/morris-0.4.3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/css/bootstrap-datepicker.css" />" />



        <!-- END PAGE LEVEL  STYLES -->
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
                <![endif]-->
    </head>

    <!-- END HEAD -->

    <!-- BEGIN BODY -->
    <body class="padTop53 ">

        <!-- MAIN WRAPPER -->
        <div id="wrap">


            <!-- HEADER SECTION -->
            <jsp:include page="include/include_header.jsp" />
            <!-- END HEADER SECTION -->

            <!-- MENU SECTION -->
            <jsp:include page="include/include_menu.jsp" />
            <!--END MENU SECTION -->

            <!--PAGE CONTENT -->
            <div id="content">

                <div class="inner" style="min-height: 700px;">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="text-info">System Administrator Dashboard</h3>
                        </div>
                    </div>

                    <hr />

                    <div class="row">
                        <div class="col-lg-12">

                            <div class="col-lg-4">
                                <div style="width: 220px;" class="panel panel-primary" id="date1"></div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div style="text-align: center;">
                                            <a class="quick-btn" href="${pageContext.request.contextPath}/usercreation"> <i class="icon-user icon-2x"></i> <span>User Creation</span> 
                                            </a>
                                            <a class="quick-btn" href="${pageContext.request.contextPath}/createaccount"> <i class="icon-user icon-2x icon-white"></i> <i class="icon-user icon-2x icon-white"></i> <span>ClientCreation</span>
                                                <!--                                                <span id="spnIdNew" class="label label-info"></span>-->
                                            </a> <a class="quick-btn" href="${pageContext.request.contextPath}/division"> <i class="icon-bookmark icon-2x"></i> <span>Division</span>
                                                <!--                                                <span id="spnIdOpened" class="label label-warning"></span>-->
                                            </a>
                                            <a class="quick-btn" href="${pageContext.request.contextPath}/subject"> <i class="icon-book icon-2x"></i> <span>Subject</span>
                                                <!--                                                <span id="spnIdOpened" class="label label-warning"></span>-->
                                            </a>

                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div style="text-align: center;">
                                                <a class="quick-btn" href="${pageContext.request.contextPath}/sbjstages"> <i class="icon-edit-sign icon-2x"></i> <span>Stages</span> 
                                                </a>
                                                <a class="quick-btn" href="${pageContext.request.contextPath}/holiday"> <i class="icon-calendar icon-2x"></i> <span>Holiday</span>
                                                    <!--                                                <span id="spnIdNew" class="label label-info"></span>-->
                                                </a> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <hr />

                    <!-- CALENDER +  WIDGETS  SECTION   -->
                    <jsp:include page="include/include_user_setting.jsp" />



                </div>

            </div>
            <!--END PAGE CONTENT -->

            <!-- RIGHT STRIP  SECTION -->

            <!--            <div id="right">
                            <div class="well well-small">
                                <label> Logged In </label>
                                <ul class="list-unstyled">
                                    <li>Aymen</li>
                                    <li>Users &nbsp; - <span>Accounts</span></li>
                                    <li>Registrations</li>
                                    <li>Aymen</li>
                                    <li>Users &nbsp; - <span>Accounts</span></li>
                                    <li>Registrations</li>
                                    <li>Aymen</li>
                                    <li>Users &nbsp; - <span>Accounts</span></li>
                                    <li>Registrations</li>
                                </ul>
                            </div>
            
                            <div class="well well-small">
                                <span>Total Request</span><span class="pull-right"><small>20%</small></span>
            
                                <div class="progress mini">
                                    <div class="progress-bar progress-bar-info" style="width: 20%"></div>
                                </div>
                                <span>Completed</span><span class="pull-right"><small>40%</small></span>
            
                                <div class="progress mini">
                                    <div class="progress-bar progress-bar-success" style="width: 40%"></div>
                                </div>
                                <span>Pending</span><span class="pull-right"><small>60%</small></span>
            
                                <div class="progress mini">
                                    <div class="progress-bar progress-bar-warning" style="width: 60%"></div>
                                </div>
                                <span>Closed</span><span class="pull-right"><small>80%</small></span>
            
                                <div class="progress mini">
                                    <div class="progress-bar progress-bar-danger" style="width: 80%"></div>
                                </div>
                            </div>
            
                            <div class="well well-small">
                                <button class="btn btn-warning btn-block">Send Instructions</button>
                                <button class="btn btn-primary btn-block">Find public</button>
                                <button class="btn btn-info btn-block">Find Request</button>
                            </div>
            
                        </div>-->
            <!-- END RIGHT STRIP  SECTION -->
        </div>

        <!--END MAIN WRAPPER -->

        <!-- FOOTER -->
        <jsp:include page="include/include_footer.jsp" />
        <!--END FOOTER -->


        <!-- GLOBAL SCRIPTS -->

        <script src="<c:url value="/resources/plugins/jquery-2.1.4.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>

        <!-- END GLOBAL SCRIPTS -->

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="<c:url value="/resources/plugins/morris/raphael-2.1.0.min.js"/>"></script>
        <script src="<c:url value="/resources/plugins/morris/morris.js"/>"></script>
        <script src="<c:url value="/resources/plugins/morris/morris-demo.js"/>"></script>
        <script src="<c:url value="/resources/plugins/datepicker/js/bootstrap-datepicker.js"/>"></script>
        <script src="<c:url value="/resources/plugins/fullcalendar-1.6.2/fullcalendar/fullcalendar.min.js"/>"></script>
        <script src="<c:url value="/resources/js/calendarInit.js"/>"></script>
        <script src="<c:url value="/resources/js/divsec_login.js" />"></script>
        <script src="<c:url value="/resources/js/divsec_dashboard.js" />"></script>


        <script type="text/javascript">
            var contextPath = "${pageContext.request.contextPath}"
            var userName = "${userName}";
            var role = "${role}";
            var stfId = "${stfId}";
            var divId = "${stfDivId}";
            var divName = "${stfDivName}";

            $("#date1").datepicker({
                todayHighlight: true
            });

            $('#dpYear').datepicker({
                format: " yyyy",
                minViewMode: 2,
                autoclose: true
            });

            $('#dpYear1').datepicker({
                format: " yyyy",
                minViewMode: 2,
                autoclose: true
            });

            $('#dpYearBar').datepicker({
                format: "yyyy",
                minViewMode: 2,
                autoclose: true
            });
        </script>

    </body>

    <!-- END BODY -->
</html>
