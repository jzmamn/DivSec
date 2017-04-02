<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DivSec | Holiday</title>


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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/css/bootstrap-datepicker.css" />
        <link href="${pageContext.request.contextPath}/resources/plugins/fullcalendar-2.8.0/fullcalendar.css" rel="stylesheet" type="text/css"/>
       

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
                            <h3 class="text-info">Holiday</h3>
                        </div>
                    </div>
                    <hr />

                    <!-- Bread Crumb -->
                    <div class="row">
                        <div class="col-lg-12">
                            <ol class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/getDashboard">Home</a></li>
                                <li class="active">Setup</li>
                                <li class="active">Holiday</li>

                            </ol>
                        </div>
                    </div>
                    <!--End Bread Crumb -->

                    <!-- Alert -->
                    <div class="row">
                        <div class="col-lg-12" id="alert"></div>
                    </div>
                    <!--End Alert -->

                    <!--                    <div class="row">
                                            <div class="col-lg-12">
                                                <div class="panel panel-default">
                    
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-bordered table-condensed table-hover" id="dtHoliday">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%;">Holiday Id</th>
                                                                        <th style="width: 10%;">Date</th>
                                                                        <th>Holiday</th>
                                                                        <th style="width: 10%;" >Active</th>
                                                                    </tr>
                                                                </thead>
                    
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->


                    <div class="row">
                        <div class="col-lg-8">

                            <div id='calendar'></div>


                        </div>
                    </div>

                    <!--Save and Update Modal -->
                    <div class="col-lg-12">
                        <div class="modal fade" id="modalHolidaySave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
                            <div class="modal-dialog">
                                <form:form role="form" id="frmIdHoliday" method="post" modelAttribute="maHoliday" data-toggle="validator">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="H4">Holiday</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group ">
                                                <label for="txtIdHolId" class="control-label">Holiday Id</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"></span>
                                                    <form:input path="holId" type="text" id="txtIdHolId" name="txtHolId" class="form-control" placeholder="Holiday Id"
                                                                readonly="true" />
                                                </div>
                                            </div>

                                            <div class="form-group ">
                                                <label for="txtIdDivId" class="control-label">Holiday Date</label>
                                                <form:input path="holDate" type="text" id="dp1" data-validation="date" data-validation-format="yyyy-mm-dd" name="txtDp1"
                                                            class="form-control" readonly="true" placeholder="Click to select Date Holiday" />

                                            </div>

                                            <div class="form-group ">
                                                <label for="txtIdDivName" class="control-label">Holiday</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon "></span>
                                                    <form:input path="holDesc" type="text" id="txtIdHolName" name="txtHolName" class="form-control" placeholder="Holiday Name"
                                                                required="true" maxlength="30" />
                                                </div>
                                                <span class="help-block with-errors"></span>
                                            </div>

                                            <div class="form-group">
                                                Is Active
                                                <form:checkbox path="holIsActive" id="chkIdHolActive" />
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <button id="btnSave" type="submit" class="btn btn-success btn-block">
                                                    <i class="icon-save icon-white"></i> Save
                                                </button>
                                            </div>

                                            <div class="col-lg-4 col-sm-4 col-xs-4">

                                            </div>


                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <button id="btnClose" class="btn btn-block" data-dismiss="modal">
                                                    <i class="icon-remove icon-white"></i> Close
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <!--End of Save and Update Modal -->
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
        <script src="${pageContext.request.contextPath}/resources/js/divsec_rpt_holiday.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
        <script src="${pageContext.request.contextPath}/resources/plugins/fullcalendar-2.8.0/lib/moment.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/resources/plugins/fullcalendar-2.8.0/fullcalendar.js" type="text/javascript"></script>
        <script>

//            $('#dp1').datepicker({
//                format: "yyyy-mm-dd"
//            });

//            $('#dpFrom').datepicker({
//                format: "yyyy-mm-dd"
//            });
//
//            $('#dpTo').datepicker({
//                format: "yyyy-mm-dd"
//            });

        </script>


        <!-- END PAGE LEVEL SCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
