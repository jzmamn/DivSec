<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DivSec | Email Log</title>


        <!-- GLOBAL STYLES -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />
        <!--END GLOBAL STYLES -->

        <!-- PAGE LEVEL STYLES -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/buttons.dataTables.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.css" />



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
            <jsp:include page="../../include/include_header.jsp" />

            <!-- END HEADER SECTION -->

            <!-- MENU SECTION -->
            <jsp:include page="../../include/include_menu.jsp" />
            <!--END MENU SECTION -->

            <!--PAGE CONTENT -->
            <div id="content">
                <!-- Inner  -->
                <div class="inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="text-info">Email Log</h3>
                        </div>
                    </div>
                    <hr />

                    <!-- Bread Crumb -->
                    <div class="row">
                        <div class="col-lg-12">
                            <ol class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/getDashboard">Home</a></li>
                                <li class="active">Report</li>
                                <li class="active">Process</li>
                                <li class="active">Email Log</li>
                            </ol>
                        </div>
                    </div>
                    <!--End Bread Crumb -->

                    <!-- Alert -->
                    <div class="row">
                        <div class="col-lg-12" id="alert"></div>
                    </div>
                    <!--End Alert -->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">

                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover table-condensed" id="dtTable">
                                            <thead>
                                                <tr>
                                                    <th style="width: 5%">Email Id</th>
                                                    <th style="width: 18%">Email Date</th>
                                                    <th style="width: 5%">Request Id</th>
                                                    <th style="width: 10%">Subject Code</th>
                                                    <th>Client Id</th>
                                                    <th style="width: 20%">Client Name</th>
                                                    <th style="width: 5%">Staff Id</th>
                                                    <th  style="width: 10%">Staff</th>
                                                </tr>
                                            </thead>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
                <!--End of Inner  -->
            </div>
            <!--END PAGE CONTENT -->
        </div>


        <!--END MAIN WRAPPER -->

        <!-- FOOTER -->
        <jsp:include page="../../include/include_footer.jsp" />
        <!--END FOOTER -->


        <!-- GLOBAL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/plugins/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>


        <!-- END GLOBAL SCRIPTS -->

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>

        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/buttons.colVis.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/buttons.print.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/buttons.html5.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.buttons.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jszip.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/pdfmake.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/vfs_fonts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/divsec_rpt_email_log.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>


        <!-- END PAGE LEVEL SCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
