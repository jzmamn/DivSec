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
        <title>DivSec |DS Dashboard</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/colourpack.css" />



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
                            <h3 class="text-info">Divisional Secretary Home Page</h3>
                        </div>
                    </div>

                    <hr />

                    <!-- CALENDER +  WIDGETS  SECTION   -->
                    <jsp:include page="include/include_user_setting.jsp" />
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="col-lg-4">
                                <div style="width: 220px;" class="panel panel-primary" id="date1"></div>
                            </div>
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div style="text-align: center;">
                                            <a class="quick-btn" href="${pageContext.request.contextPath}/batch-approval"> <i class="icon-check icon-2x"></i> <span>For
                                                    Approval</span> <span id="spnIdApproval" class="label label-danger"></span>
                                            </a>
                                            <a class="quick-btn" href="${pageContext.request.contextPath}/reqprocess"> <i class="icon-cog icon-2x"></i> <span>Process</span>
                                                <!--                                                <span id="spnIdNew" class="label label-info"></span>-->
                                            </a> <a class="quick-btn" href="${pageContext.request.contextPath}/rptrequest"> <i class="icon-bar-chart icon-2x"></i> <span>ProcessReport</span>
                                                <!--                                                <span id="spnIdOpened" class="label label-warning"></span>-->
                                            </a>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                                <a href="${pageContext.request.contextPath}/admin-to-hod/1" class="btn btn-warning btn-xs btn-block">Admin</a>
                                                <div id="morris-donut-admin" style="width: 120px; height: 120px;"></div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                                <a href="${pageContext.request.contextPath}/admin-to-hod/2" class="btn btn-success btn-xs btn-block">Planning</a>
                                                <div id="morris-donut-palaning" style="width: 120px; height: 120px;"></div>
                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                                <a href="${pageContext.request.contextPath}/admin-to-hod/3" class="btn btn-danger btn-xs btn-block">Registrar</a>
                                                <div id="morris-donut-registrar" style="width: 120px; height: 120px;"></div>
                                            </div>


                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                                <a href="${pageContext.request.contextPath}/admin-to-hod/5" class="btn btn-info btn-xs btn-block">Accounts</a>
                                                <div id="morris-donut-accounts" style="width: 120px; height: 120px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <hr />

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                <a href="${pageContext.request.contextPath}/admin-to-hod/8" class="btn btn-primary btn-xs btn-block">Samurdhi</a>
                                <div id="morris-donut-samurdhi" style="width: 120px; height: 120px;"></div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                <a href="${pageContext.request.contextPath}/admin-to-hod/7" class="btn btn-warning btn-xs btn-block"> Disaster Mgt</a>
                                <div id="morris-donut-disaster" style="width: 120px; height: 120px;"></div>
                            </div>


                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                <a href="${pageContext.request.contextPath}/admin-to-hod/6" class="btn btn-info btn-xs btn-block"> Social Welfare</a>
                                <div id="morris-donut-social" style="width: 120px; height: 120px;"></div>
                            </div>

                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 panel panel-warning" style="width: 130px;">
                                <a href="${pageContext.request.contextPath}/admin-to-hod/9" class="btn btn-danger btn-xs btn-block"> Land</a>
                                <div id="morris-donut-land" style="width: 120px; height: 120px;"></div>
                            </div>


                        </div>
                    </div>

                    <hr/>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div class="panel  panel-warning">
                                    <div class="panel-heading">
                                        <big> Request Reminder </big> -  <a href="rptrequestremider">Go to Reminder Report</a>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <div style="height: 170px; overflow: scroll;">
                                                <table id="tblReminder" class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead class="alert alert-success">
                                                        <tr>
                                                            <th style="width: 10%">ReqId</th>
                                                            <th>Sbj Id</th>
                                                            <th>Sbject</th>
                                                            <th>Div Id</th>
                                                            <th>Division</th>
                                                            <th>Pub Id</th>
                                                            <th>Public</th>
                                                            <th>Status</th>
                                                            <th>Status Name</th>
                                                            <th>Ent Date</th>
                                                            <th>Today</th>
                                                            <th>Duration(days)</th>
                                                            <th>Days Remaining</th>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel panel-danger">
                                    <div class="panel-heading">
                                        <big> Request Overdue </big> - <a href="rptrequestoverdue">Go to Overdue Report</a>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <div style="height: 170px; overflow: scroll;">
                                                <table id="tblOverdue" class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead class="alert alert-success">
                                                        <tr>
                                                            <th style="width: 10%">ReqId</th>
                                                            <th>Sbj Id</th>
                                                            <th>Sbject</th>
                                                            <th>Div Id</th>
                                                            <th>Division</th>
                                                            <th>Pub Id</th>
                                                            <th>Public</th>
                                                            <th>Status</th>
                                                            <th>Status Name</th>
                                                            <th>Ent Date</th>
                                                            <th>Today</th>
                                                            <th>Duration(days)</th>
                                                            <th>Days Overdue</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--START AGING BY MONTH BLOCK SECTION -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div class="panel  panel-info">
                                    <div class="panel-heading">
                                        <big> Request Summary </big> - <em class="text-muted">(by Month)</em> <span class="pull-right"><small> <input
                                                    id="dpYear" class="form-control datepicker dpYear" style="width: 60px; height: 20px;">
                                            </small></span>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <div style="height: 170px; overflow: scroll;">
                                                <table id="tblSummaryByMonth" class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead class="alert alert-success">
                                                        <tr>
                                                            <th>Month</th>
                                                            <th>UnAttended</th>
                                                            <th>Opened</th>
                                                            <th>Completed</th>
                                                            <th>Closed</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <big> Request Summary </big> - <em class="text-muted">(by Year)</em>
                                        <!--  <span class="pull-right"><small> <input
                                                        id="dpYear1" class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
                                        </small></span> -->

                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <div style="height: 170px; overflow: scroll;">
                                                <table id="tblByAnnual" class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead class="alert alert-success">
                                                        <tr>
                                                            <th>Year</th>
                                                            <th>UnAttended</th>
                                                            <th>Opened</th>
                                                            <th>Completed</th>
                                                            <th>Closed</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr />
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div class="panel  panel-info">
                                    <div class="panel-heading">
                                        <big> Request Summary </big> - <em class="text-muted">(By Division)</em>
                                        <!-- <span class="pull-right"><small> <input
                                                        id="dpYear3" class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
                                        </small></span> -->
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <div style="height: 170px; overflow: scroll;">
                                                <table id="tblDivisionSummary" class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead class="alert alert-success">
                                                        <tr>
                                                            <th>Division</th>
                                                            <th>UnAttended</th>
                                                            <th>Opened</th>
                                                            <th>Completed</th>
                                                            <th>Closed</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="panel  panel-info">
                                    <div class="panel-heading">
                                        <big>Last Modified </big> - <em class="text-muted">(last 25)</em>
                                        <!-- <span class="pull-right"><small> <input
                                                        id="dpYear2" class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
                                        </small></span> -->
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <div style="height: 170px; overflow: scroll;">
                                                <table id="tblLastModified"  class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead class="alert alert-success">
                                                        <tr>
                                                            <th>Req Id</th>
                                                            <th>Entered Date</th>
                                                            <th>Modified Date</th>
                                                            <th>Staff</th>
                                                        </tr> 
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END START AGING BY MONTH BLOCK SECTION -->
                    <hr />

                    <!--START AGING BY LAST 6 MONTH BLOCK SECTION -->
                    <div class="row">
                        <div class="col-lg-12 col-sm-12">
                            <div class="panel panel-default panel-success">
                                <div class="panel-heading">
                                    <big>Analysis</big> - <em>by Year</em> <span class="pull-right"><small> <input id="dpYearBar"
                                        </small></span>
                                </div>
                                <div class="panel-body">
                                    <div id="barChartContent" class="table-responsive">
                                        <div id="morris-bar-chart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- END AGING BY LAST 6 MONTH BLOCK SECTION -->
                    <hr />

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
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>



        <script type="text/javascript">
            var contextPath = "${pageContext.request.contextPath}"
            var userName = "${userName}";
            var role = "${role}"
            var stfId = "${stfId}"
            var divId = "${stfDivId}"
            var divName = "${stfDivName}"

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
