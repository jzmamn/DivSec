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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/colourpack.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />
        <!--END GLOBAL STYLES -->

        <!-- PAGE LEVEL STYLES -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/css/bootstrap-datepicker.css" />

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
                <div class="inner">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="text-info"> Approval </h3>
                        </div>
                    </div>
                    <hr />
                    <!-- Bread Crumb -->
                    <div class="row">
                        <div class="col-lg-12">
                            <ol class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/getDashboard">Home</a></li>
                                <li>Process</li>
                                <li class="active">Approval</li>
                            </ol>
                        </div>
                    </div>
                    <!--End Bread Crumb -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="col-lg-10">
                                        <ul class="nav nav-pills" style="max-width: 300%;">

                                            <li class="active" id="idApproval"><a href="#" data-toggle="tab"> <span id="spnIdApproval" class="badge badge-purple pull-right"></span>
                                                    For Approval
                                                </a></li>

                                            <li id="idApprove"><a href="#" data-toggle="tab"> <span id="spnIdApprove" class="badge badge-purple pull-right"></span>
                                                    Approved
                                                </a></li>


                                            <li id="idRejected"><a href="#" data-toggle="tab"> <span id="spnIdRejected" class="badge badge-purple pull-right"></span>
                                                    Rejected
                                                </a></li>
                                        </ul>
                                    </div>

                                    <div class="col-lg-2">


                                        <button id="btnIdPrintThis" type="button" class="  btn  btn-block btn-primary" onclick="location.href = 'print_approval';">
                                            <span class="icon-print"></span> Batch Print
                                            <span id="spnIdBatchPrint" class="badge badge-purple pull-right"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>


                            <hr />
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive" id="idContent">
                                        <div id="tblProcessRequest">
                                            <table class="table table-striped  table-hover table-condensed" id="dtTable">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">Rq Id</th>
                                                        <th style="width: 12%">Status</th>
                                                        <th>StatusName</th>
                                                        <th>SbjId</th>
                                                        <th style="width: 68%">Subject</th>
                                                        <th style="width: 10%">Date</th>
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

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="col-lg-12">
                                        <div class="modal fade" id="idModalApproval" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="H4">Approval </h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <form role="form" id="frmIdUpdateStatus" method="GET">
                                                            <div>
                                                                <div>
                                                                    Request Id : <span id="spnReqId" class="text-muted small"></span> <span class="small"> <input
                                                                            type="hidden" style="width: 50%; height: 20%;" id="txtIdReqId" readonly="true" />
                                                                    </span>

                                                                </div>

                                                                <div style="display: none;">
                                                                    Subject Id : <span id="spnSbjId" class="text-muted small"></span>
                                                                </div>

                                                                <div>
                                                                    Subject : <span id="spnSbj" class="text-muted small"></span>
                                                                </div>


                                                                <div>
                                                                    Client Id : <span id="spnPubId" class=" text-muted small"></span> <span class="small"> <input
                                                                            type="hidden" style="width: 50%; height: 20%;" id="txtIdPublic" />
                                                                    </span>
                                                                </div>

                                                                <div>
                                                                    Client Name : <span id="spnPubName" class=" text-muted small"></span>
                                                                </div>

                                                                <div style="display: none;">
                                                                    Division Id : <span id="spnDivId" class="text-muted small"></span>
                                                                </div>

                                                                <div>
                                                                    Division : <span id="spnDivision" class="text-muted small"></span>
                                                                </div>

                                                                <!-- 																<div style="display: none;"> -->
                                                                <div>
                                                                    Staff Id : <span id="spnStaffId" class="text-muted small"></span> <span class="small"> <input
                                                                            type="hidden" style="width: 50%; height: 20%;" id="txtIdStaff" />
                                                                    </span>
                                                                </div>

                                                                <div>
                                                                    Staff Accepted : <span id="spnStaff" class="text-muted small"></span>
                                                                </div>

                                                                <div>
                                                                    Fee : <span id="spnFee" class="text-muted small"> <em>Yesterday esterday esterday esterday </em></span>
                                                                </div>

                                                                <div>
                                                                    Duration : <span id="spnDuration" class="text-muted small"> <em>Yesterday esterday esterday esterday
                                                                        </em></span>
                                                                </div>

                                                                <div>
                                                                    Accepted on : <span id="spnDate" class="text-muted small"> <em>Yesterday esterday esterday esterday
                                                                        </em></span>
                                                                </div>

                                                                <div>
                                                                    Note: <span class="small"><input type="text" style="width: 280px; height: 20px;" id="txtIdNote" maxlength="90" /></span>
                                                                    <!-- 
                                                                    Remark : <span id="spnRemark" class="text-muted small"> <em>Yesterday esterday esterday esterday </em></span>
                                                                    -->

                                                                </div>

                                                                <div>
                                                                    Request Status <span class="text-muted small"> <select id="cmdIdReqStatus">

                                                                        </select>
                                                                    </span> <span class="text-muted small"> <input type="hidden" id="idCmbReqStausId" />
                                                                    </span>
                                                                </div>



                                                                <br />

                                                                <div class="list-group-item">
                                                                    <button id="btnIdSaveChanges" type="button" class="btn  btn-block btn-primary">
                                                                        <span class="icon-save"></span> Save Changes
                                                                    </button>
                                                                </div>

<!--                                                                <div id="divIdPrintThis" class="list-group-item">
                                                                    <button id="btnIdPrintThis" type="button" class="btn  btn-block btn-primary">
                                                                        <span class="icon-save"></span> Print
                                                                    </button>
                                                                </div>-->

                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                    </div>
                                </div>
                            </div>
                            <!--END MAIN WRAPPER -->

                        </div>

                        <!-- FOOTER -->

                        <!-- END FOOTER -->


                        <!-- GLOBAL SCRIPTS -->
                        <script src="${pageContext.request.contextPath}/resources/plugins/jquery-2.1.4.min.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/jQuery-printPage/jqueryprintPage.js" type="text/javascript"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>

                        <!-- END GLOBAL SCRIPTS -->

                        <!-- PAGE LEVEL SCRIPTS -->
                        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/form-validator/jquery.form-validator.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/plugins/datepicker/js/bootstrap-datepicker.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/js/divsec_approval.js"></script>
                        <script>
                                            var contextPath = "${pageContext.request.contextPath}"
                                            var userName = "${userName}";
                                            var role = "${role}"
                                            var stfId = "${stfId}"
                                            var divId = "${stfDivId}"
                                            var divName = "${stfDivName}"

                                            alert(stfDivId);

                                            $('#dp1').datepicker({
                                                format: "yyyy-mm-dd"
                                            });

                                            $('#idTxtInstDate').datepicker({
                                                format: "yyyy-mm-dd"
                                            });

                                            $('#frmIdPublic').validator();


                        </script>

                        <!-- END PAGE LEVEL SCRIPTS -->
                        </body>

                        <!-- END BODY -->
                        </html>
