
<!-- MENU SECTION -->
<div id="left">
    <div class="media user-media well-small">
        <%-- <a class="user-link" href="#"> <img class="media-object img-thumbnail user-img" alt="User Picture" src="assets/img/user.gif" />
        </a> <br />
        <div class="media-body">
                <div id="divIdUserName" class="media-heading">${userName}</div>

                        <!-- <ul class="list-unstyled user-info">
                                <li><a class="btn btn-success btn-xs btn-circle"
                                        style="width: 10px; height: 12px;"></a> Online</li>
                        </ul> -->
                </div>
                <br />
        --%>
    </div>

    <div id="divIdUserName" class="media-heading">
        <div></div>

    </div>
    <ul id="menu" class="collapse">
        <!-- Dashboard -->
        <li class="panel active"><a href="${pageContext.request.contextPath}/getDashboard" id="index"> <i class="icon-dashboard"></i>
                Dashboard
            </a></li>
        <!-- Dashboard -->

        <!-- Process -->
        <li class="panel "><a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle collapsed"
                              data-target="#process-nav"> <i class="icon-cog"></i> Process <span class="pull-right"> <i class="icon-angle-left"></i> <!-- 			</span> &nbsp; <span class="label label-success">5</span>&nbsp; --></a>
            <ul class="collapse" id="process-nav">
                <li class=""><a href="${pageContext.request.contextPath}/reqprocess"><i class="icon-angle-right"></i> Request Processing </a></li>
                <li class=""><a href="${pageContext.request.contextPath}/batch-approval"><i class="icon-angle-right"></i> Approval </a></li>

<!--  <li class=""><a href="${pageContext.request.contextPath}/undoprinted"><i class="icon-angle-right"></i> Undo/Redo Printed </a></li>-->
                <li class=""><a href="${pageContext.request.contextPath}/public"><i class="icon-angle-right"></i> Public Details </a></li>
                    <%-- <li class=""><a href="${pageContext.request.contextPath}/ticket"><i class="icon-angle-right"></i> Ticket </a></li> --%>
            </ul></li>
        <!-- Process -->


        <!-- Quick View -->
        <li class="panel"><a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#DDL-nav"> <i
                    class=" icon-bar-chart"></i> Reports <span class="pull-right"> <i class="icon-angle-left"></i>
                </span>
            </a>

            <ul class="collapse" id="DDL-nav">
                <li><a href="#" data-parent="#DDL-nav" data-toggle="collapse" class="accordion-toggle" data-target="#DDL1-nav"> <i
                            class="icon-sitemap"></i>&nbsp; Process <span class="pull-right" style="margin-right: 20px;"> <i class="icon-angle-left"></i>
                        </span>
                    </a>
                    <ul class="collapse" id="DDL1-nav">
                        <li class=""><a href="${pageContext.request.contextPath}/rptpublic"><i class="icon-angle-right"></i> Public Info </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptrequest"><i class="icon-angle-right"></i> Request </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptrequeststage"><i class="icon-angle-right"></i> Request Stage </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptrequestoverdue"><i class="icon-angle-right"></i> Request Overdue</a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptrequestremider"><i class="icon-angle-right"></i> Request Reminder</a></li>
<!--                        <li class=""><a href="${pageContext.request.contextPath}/divperstatus"><i class="icon-angle-right"></i>
                                Division-Period-Status </a></li>-->
                    </ul></li>

                <li><a href="#" data-parent="#DDL-nav" data-toggle="collapse" class="accordion-toggle" data-target="#DDL2-nav"> <i
                            class="icon-sitemap"></i>&nbsp; Audit Trail <span class="pull-right" style="margin-right: 20px;"> <i class="icon-angle-left"></i>
                        </span>
                    </a>
                    <ul class="collapse" id="DDL2-nav">
                        <li class=""><a href="${pageContext.request.contextPath}/rptrequesttrail"><i class="icon-angle-right"></i> Request Trail </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptrequeststagetrail"><i class="icon-angle-right"></i> Request Stage
                                Trail </a></li>

                        <li class=""><a href="${pageContext.request.contextPath}/rptemaillog"><i class="icon-angle-right"></i> Email Log </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptsmslog"><i class="icon-angle-right"></i> SMS Log </a></li>
                    </ul></li>

                <li><a href="#" data-parent="#DDL-nav" data-toggle="collapse" class="accordion-toggle" data-target="#DDL3-nav"> <i
                            class="icon-sitemap"></i>&nbsp; Setup <span class="pull-right" style="margin-right: 20px;"> <i class="icon-angle-left"></i>
                        </span>
                    </a>
                    <ul class="collapse" id="DDL3-nav">
                        <li class=""><a href="${pageContext.request.contextPath}/rptdivision"><i class="icon-angle-right"></i> Division List </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptsubject"><i class="icon-angle-right"></i> Subject List </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptsubjectstage"><i class="icon-angle-right"></i> Subject Stage List
                            </a></li>
                        <li class=""><a href="${pageContext.request.contextPath}/rptstaff"><i class="icon-angle-right"></i> Staff List </a></li>
                    </ul></li>

            </ul></li>
        <!-- Quick View -->



        <!-- Charts -->
        <li class="panel"><a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#admin-nav"> <i
                    class="icon-wrench"></i> Setup <span class="pull-right"> <i class="icon-angle-left"></i> <!-- 			</span> &nbsp; <span class="label label-info">6</span>&nbsp; --></a>
            <ul class="collapse" id="admin-nav">
                <%-- 			<li><a href="${pageContext.request.contextPath}/mainmenu/main/50"><i class="icon-angle-right"></i> Preference </a></li> --%>
                <li><a href="${pageContext.request.contextPath}/usercreation"><i class="icon-angle-right"></i> User Creation </a></li>
                <li><a href="${pageContext.request.contextPath}/createaccount"><i class="icon-angle-right"></i> Client Creation </a></li>
                <li><a href="${pageContext.request.contextPath}/division"><i class="icon-angle-right"></i> Division </a></li>
                <li><a href="${pageContext.request.contextPath}/subject"><i class="icon-angle-right"></i> Subject </a></li>
                <li><a href="${pageContext.request.contextPath}/sbjstages"><i class="icon-angle-right"></i> Subject Stages </a></li>
                <li><a href="${pageContext.request.contextPath}/holiday"><i class="icon-angle-right"></i> Holiday </a></li>

                <%-- 	<li><a href="${pageContext.request.contextPath}/mainmenu/main/55"><i class="icon-angle-right"></i> Request Status </a></li>
                    <li><a href="${pageContext.request.contextPath}/mainmenu/main/56"><i class="icon-angle-right"></i> Stage Status </a></li>
                    <li><a href="${pageContext.request.contextPath}/mainmenu/main/57"><i class="icon-angle-right"></i> Email </a></li>
                    <li><a href="${pageContext.request.contextPath}/mainmenu/main/58"><i class="icon-angle-right"></i> SMS </a></li>
                    <li><a href="${pageContext.request.contextPath}/mainmenu/main/59"><i class="icon-angle-right"></i> User Category </a></li> --%>
            </ul></li>

    </ul>

</div>
<!--END MENU SECTION -->