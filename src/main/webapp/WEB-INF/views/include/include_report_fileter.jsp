
<!--Report Filter Modal -->
<div class="col-lg-12">
    <div class="modal fade" id="mdlReqFilter" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="H4">Report Filter</h4>
                </div>
                <div class="modal-body">
                    <form role="form" id="block-validate">

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                  
                                    <input type="text" id="idTxtRequest" name="txtRequest" class="form-control" placeholder="Request Id" />
                                </div>
                                <div class="col-lg-6">
                                    <input type="hidden" id="txtIdSbjId" name="txtSbjId" />
                                    <div class="form-group input-group" id="divIdSubject">
                                        <input type="text" id="txtIdSbjName" name="txtSbjName" class="form-control" placeholder="Subject Code" /> <span
                                            class="input-group-btn">
                                            <button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalSubject">
                                                <i class="icon-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                    <input type="hidden" id="txtIdPublicId" name="txtPublicId" />
                                    <div class="form-group input-group" id="divIdPublic">
                                        <input type="text" class="form-control" id="txtIdPublicName" name="txtPublicName" placeholder="Public Id" /> <span
                                            class="input-group-btn">
                                            <button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalPublic">
                                                <i class="icon-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <input type="hidden" id="txtIdDivisionId" name="txtDivisionId" />
                                    <div class="form-group input-group" id="divIdDivision">
                                        <input type="text" class="form-control" id="txtIdDivision" name="txtDivision" placeholder="Division" /> <span
                                            class="input-group-btn">
                                            <button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalDivision">
                                                <i class="icon-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                    <div id="divIdStatus">
                                        <select id="cmdIdReqStatus" class="form-control" style="width: 250px;">
                                        </select> <input type="hidden" id="idCmbReqStausId" name="txtStatusId" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                     <div id="divIdUser">
                                    <select id="selStaff" class="form-control" style="width: 250px;">
                                    </select> <input id="idStaff" type="hidden" />
                                     </div>
                                </div>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-lg-12">
                                    <div class="input-group input-daterange" id="divIdDateRange">
                                        <span class="input-group-addon">From</span> <input id="dpFrom" type="text" class="form-control" placeholder="from date yyyy-mm-dd">
                                        <span class="input-group-addon">to</span> <input id="dpTo" type="text" class="form-control" placeholder="to date yyyy-mm-dd">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-lg-4">
                                <button type="button" id="btnIdApplyFilter" class="btn btn-success btn-block">
                                    <i class="icon-filter icon-white"></i> Apply Filter
                                </button>
                            </div>
                            <div class="col-lg-4">
                                <button type="reset" id="btnIdReset" class="btn btn-warning btn-block">
                                    <i class="icon-refresh icon-white"></i> Reset Filter
                                </button>
                            </div>
                            <div class="col-lg-4">
                                <button id="btnClose" class="btn btn-default btn-block" data-dismiss="modal">
                                    <i class="icon- icon-white"></i> Close
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!--End Report Filter Modal -->

<!-- Subject Modal -->
<div class="col-lg-12">
    <div class="modal fade" id="modalSubject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="H4">Subject</h4>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover table-condensed" id="dtSubject">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">SbjId</th>
                                    <th style="width: 80%;">Name</th>
                                    <th style="width: 10%;">Active</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="col-lg-4 col-sm-4 col-xs-4">
                        <button id="btnClose" class="btn btn-block" data-dismiss="modal">
                            <i class="icon-remove icon-white"></i> Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Subject Modal -->


<!-- Public Modal -->
<div class="col-lg-12">
    <div class="modal fade" id="modalPublic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="H4">Select Public</h4>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover table-condensed" id="dtPublic">
                            <thead>
                                <tr>
                                    <th style="width: 10%;">Id</th>
                                    <th style="width: 80%;">Name</th>
                                    <th style="width: 10%;">NIC</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="col-lg-4 col-sm-4 col-xs-4">
                        <button id="btnClose" class="btn btn-block" data-dismiss="modal">
                            <i class="icon-remove icon-white"></i> Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Public Modal -->

<!-- Division Modal -->
<div class="col-lg-12">
    <div class="modal fade" id="modalDivision" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="H4">Division</h4>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dtDivision">
                                <thead>
                                    <tr>
                                        <th>DivId</th>
                                        <th>Name</th>
                                        <th>Active</th>
                                    </tr>
                                </thead>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <div class="col-lg-4 col-sm-4 col-xs-4">
                        <button id="btnClose" class="btn btn-block" data-dismiss="modal">
                            <i class="icon-remove icon-white"></i> Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Division Modal -->
