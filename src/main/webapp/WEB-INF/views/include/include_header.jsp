
<!-- HEADER SECTION -->
<div id="top">

    <nav class="navbar navbar-inverse navbar-fixed-top " style="padding-top: 10px;">
        <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip"
           class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle"> <i
                class="icon-align-justify"></i>
        </a>
        <!-- LOGO SECTION -->
        <div class="col-lg-offset-3">
            <div class="navbar-header navbar-collapse collapse ">
                <p class="navbar-brand"> Divisional Secretariat Management Information System </p>
            </div>
        </div>
        <!-- END LOGO SECTION -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="icon-user "></i>&nbsp; ${userName}
                </a>

                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/mysetup"><i class="icon-user"></i> User Profile </a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="icon-signout"></i> Logout </a></li>

                </ul></li>
            <!--END ADMIN SETTINGS -->
        </ul>

    </nav>

</div>
<!-- END HEADER SECTION -->
