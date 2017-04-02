<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DivSec | Division</title>


        <!-- GLOBAL STYLES -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/colourpack.css" />
        <!--END GLOBAL STYLES -->

        <!-- PAGE LEVEL STYLES -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
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
            <jsp:include page="../include/include_header.jsp" />

            <!-- END HEADER SECTION -->

            <!-- MENU SECTION -->
            <jsp:include page="../include/include_menu.jsp" />
            <!--END MENU SECTION -->

            <!--PAGE CONTENT -->
            <div id="content">
                <!-- Inner  -->
                <div class="inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="text-info">Undo/Redo Printed </h3>
                        </div>
                    </div>
                    <hr />

                    <!-- Bread Crumb -->
                    <div class="row">
                        <div class="col-lg-12">
                            <ol class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/getDashboard">Home</a></li>
                                <li class="active">Setup</li>
                                <li class="active">Division</li>

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

                                <form:form id="frmUndoPrint" action="undoprinted/mark_as_printed" method="POST">
                                    <div class="panel-heading">
                                        <button  id="btnIdMarkAsNotPrinted" name="btnMarkAsNotPrinted" class="btn btn-primary btn-sm">
                                            <i class="icon-undo icon-white"></i> Mark as Not Printed
                                        </button>

                                        <button  id="btnIdMarkAsPrinted" name="btnMarkAsPrinted" class="btn btn-primary btn-sm" value="1">
                                            <i class="icon-check icon-white"></i> Mark as Printed
                                        </button>

                                        <div class="col-lg-2 pull-right">
                                            <button id="btnIdPrintThis" type="button" class="  btn  btn-block btn-primary hidden-print btn-sm" onclick="location.href = 'print_approval';">
                                                <span class="icon-print"></span> Goto Batch Print
                                            </button>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover table-condensed" id="dtDivision">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 3%"></th>
                                                        <th>Request Id</th>
                                                        <th>Subject</th>
                                                        <th>Status</th>
                                                        <th style="width: 18%">Date Printed</th>
                                                        <th>printed</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </form:form>
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
        <jsp:include page="../include/include_footer.jsp" />
        <!--END FOOTER -->


        <!-- GLOBAL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/plugins/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>


        <!-- END GLOBAL SCRIPTS -->

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/divsec_undoprinted.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>

        <script>
                                var undo = "${undo}";

        </script>
        <!-- END PAGE LEVEL SCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
