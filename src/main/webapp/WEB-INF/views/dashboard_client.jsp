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
        <title>DivSec |Client Dashboard</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/colourpack.css" />

        <!--END GLOBAL STYLES -->

        <!-- PAGE LEVEL STYLES -->
        <link rel="stylesheet" href="<c:url value="/resources/css/layout2.css" />" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
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
            <jsp:include page="include/include_menu_client.jsp" />
            <!--END MENU SECTION -->

            <!--PAGE CONTENT -->
            <div id="content">

                <div class="inner" style="min-height: 700px;">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="text-info">My Account</h3>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-4 pull-right" >
                                <div class="row">
                                    Your Id:   <span class="text-info"> <strong> ${stfPiId}</strong></span>
                                </div>
                                <div class="row">
                                    Name:   <span class="text-info"> <strong> ${stfName}</strong></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr />

                    <!-- CALENDER +  WIDGETS  SECTION   -->
                    <jsp:include page="include/include_user_setting.jsp" />

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    Not Completed
                                </div>

                                <div class="panel-body">

                                    <div class="table-responsive">
                                        <table class="table table-striped  table-hover table-condensed" id="dtTableNewAndOpened">
                                            <thead>
                                                <tr>
                                                    <th style="width: 10%">Rq Id</th>
                                                    <th style="width: 10%">Status</th>
                                                    <th>StatusName</th>
                                                    <th>SbjId</th>
                                                    <th >Subject</th>
                                                    <th style="width: 60%">Subject Name</th>
                                                    <th style="width: 15%">Date Accepted</th>
                                                    <th>Pb Id</th>
                                                    <th>Pb Name</th>
                                                    <th>Div Id</th>
                                                    <th>Div Name</th>
                                                    <th>Note</th>
                                                    <th>Stf Id</th>
                                                    <th>Stf Name</th>
                                                    <th>Fee</th>
                                                    <th>Duration</th>
                                                    <th>Void</th>
                                                </tr>
                                            </thead>
                                        </table>
                                        </
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
                <hr />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                Approval
                            </div>

                            <div class="panel-body">
                                <div class="table-responsive">
                                    <div class="table-responsive">
                                        <table class="table table-striped  table-hover table-condensed" id="dtTableApprove">
                                            <thead>
                                               <tr>
                                                   <th style="width: 10%">Rq Id</th>
                                                    <th style="width: 10%">Status</th>
                                                    <th>StatusName</th>
                                                    <th>SbjId</th>
                                                    <th >Subject</th>
                                                    <th style="width: 60%">Subject Name</th>
                                                    <th style="width: 15%">Date Accepted</th>
                                                    <th>Pb Id</th>
                                                    <th>Pb Name</th>
                                                    <th>Div Id</th>
                                                    <th>Div Name</th>
                                                    <th>Note</th>
                                                    <th>Stf Id</th>
                                                    <th>Stf Name</th>
                                                    <th>Fee</th>
                                                    <th>Duration</th>
                                                    <th>Void</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                Completed
                            </div>

                            <div class="panel-body">
                                <div class="table-responsive">
                                    <div class="table-responsive">
                                        <table class="table table-striped  table-hover table-condensed" id="dtTableCompleted">
                                            <thead>
                                               <tr>
                                                    <th style="width: 10%">Rq Id</th>
                                                    <th style="width: 10%">Status</th>
                                                    <th>StatusName</th>
                                                    <th>SbjId</th>
                                                    <th >Subject</th>
                                                    <th style="width: 60%">Subject Name</th>
                                                    <th style="width: 15%">Date Accepted</th>
                                                    <th>Pb Id</th>
                                                    <th>Pb Name</th>
                                                    <th>Div Id</th>
                                                    <th>Div Name</th>
                                                    <th>Note</th>
                                                    <th>Stf Id</th>
                                                    <th>Stf Name</th>
                                                    <th>Fee</th>
                                                    <th>Duration</th>
                                                    <th>Void</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Closed
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped  table-hover table-condensed" id="dtTableClosed">
                                        <thead>
                                            <tr>
                                                    <th style="width: 10%">Rq Id</th>
                                                    <th style="width: 10%">Status</th>
                                                    <th>StatusName</th>
                                                    <th>SbjId</th>
                                                    <th >Subject</th>
                                                    <th style="width: 60%">Subject Name</th>
                                                    <th style="width: 15%">Date Accepted</th>
                                                    <th>Pb Id</th>
                                                    <th>Pb Name</th>
                                                    <th>Div Id</th>
                                                    <th>Div Name</th>
                                                    <th>Note</th>
                                                    <th>Stf Id</th>
                                                    <th>Stf Name</th>
                                                    <th>Fee</th>
                                                    <th>Duration</th>
                                                    <th>Void</th>
                                                </tr>
                                        </thead>
                                    </table>
                                </div></div></div>
                    </div>
                </div>

                <hr />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                Rejected
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped  table-hover table-condensed" id="dtTableRejected">
                                        <thead>
                                           <tr>
                                                    <th style="width: 10%">Rq Id</th>
                                                    <th style="width: 10%">Status</th>
                                                    <th>StatusName</th>
                                                    <th>SbjId</th>
                                                    <th >Subject</th>
                                                    <th style="width: 60%">Subject Name</th>
                                                    <th style="width: 15%">Date Accepted</th>
                                                    <th>Pb Id</th>
                                                    <th>Pb Name</th>
                                                    <th>Div Id</th>
                                                    <th>Div Name</th>
                                                    <th>Note</th>
                                                    <th>Stf Id</th>
                                                    <th>Stf Name</th>
                                                    <th>Fee</th>
                                                    <th>Duration</th>
                                                    <th>Void</th>
                                                </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
    <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>

    <script src="<c:url value="/resources/plugins/datepicker/js/bootstrap-datepicker.js"/>"></script>
    <script src="<c:url value="/resources/js/divsec_login.js" />"></script>
    <script src="<c:url value="/resources/js/divsec_dashboard_Client.js" />"></script>


    <script type="text/javascript">

        var contextPath = "${pageContext.request.contextPath}";
        var userName = "${userName}";
        var role = "${role}";
        var stfId = "${stfId}";
        var stfName = "${stfName}";
        var divId = "${stfDivId}";
        var divName = "${stfDivName}";
        var stfPiId = "${stfPiId}"; // public id 

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
