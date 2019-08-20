<%@ page import="eventmanagement.Person" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>

</head>
<body>

<div class="page-wrapper chiller-theme toggled">
    <sec:ifLoggedIn>
    <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fas fa-bars"></i>
    </a>

    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
            <div class="sidebar-brand">
                <a href="#">pro sidebar</a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="sidebar-header">
                <div class="user-pic">




            <g:if test="${ Person.get(currentUser.id).avatar == null}">

                    <img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
                         alt="User picture">
            </g:if>
                    <g:if test="${ Person.get(currentUser.id).avatar != null}">
                    <img class="img-responsive img-rounded" src="http://localhost:8089/signUp/displayAvatarForCurrentUser"
                             alt="User picture">

            </g:if>


                    </div>
                <div class="user-info">
                    <span class="user-name">
                        <strong>${currentUser.username}
                            </strong>
                    </span>
                    <span class="user-role">Administrator</span>
                    <span class="user-status">
                        <i class="fa fa-circle"></i>
                        <span>Online</span>
                    </span>
                </div>
            </div>
            <!-- sidebar-header  -->
            <div class="sidebar-search">
                <div>
                    <div class="input-group">
                        <input type="text" class="form-control search-menu" placeholder="Search...">
                        <div class="input-group-append">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- sidebar-search  -->
            <div class="sidebar-menu">
                <ul>
                    <li class="header-menu">
                        <span>General</span>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                            <span class="badge badge-pill badge-warning">New</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="#">Dashboard 1
                                        <span class="badge badge-pill badge-success">Pro</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">Dashboard 2</a>
                                </li>
                                <li>
                                    <a href="#">Dashboard 3</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-shopping-cart"></i>
                            <span>E-commerce</span>
                            <span class="badge badge-pill badge-danger">3</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="#">Products

                                    </a>
                                </li>
                                <li>
                                    <a href="#">Orders</a>
                                </li>
                                <li>
                                    <a href="#">Credit cart</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="far fa-gem"></i>
                            <span>Etkinlikler</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a id="funEvents"  style="cursor: pointer !important;">Eğlence Etkinlikleri</a>
                                </li>
                                <li>
                                    <a id="educationEvents"  style="cursor: pointer !important;">Eğitimler</a>
                                </li>
                                <li>
                                    <a href="#"  style="cursor: pointer !important;">Katılacaklarım</a>
                                </li>
                                <li>
                                    <a href="#">Icons</a>
                                </li>
                                <li>
                                    <a href="#">Forms</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                            <a href="#">
                            <i class="fa fa-chart-line"></i>
                            <span>Gruplar</span>
                            </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <g:link controller="community" action="groups">
                                        Grupları Listele
                                    </g:link>

                                </li>
                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                <li>
                                    <g:link controller="request" action="index">
                                        Bekleyen İstekler
                                    </g:link>
                                </li>
                            </sec:ifAllGranted>
                                <li>
                                    <a href="#" style="cursor: pointer;">Bar chart</a>
                                </li>
                                <li>
                                    <a href="#" style="cursor: pointer;">Histogram</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-chart-line"></i>
                            <span>Charts</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="#">Pie chart</a>
                                </li>
                                <li>
                                    <a href="#">Line chart</a>
                                </li>
                                <li>
                                    <a href="#">Bar chart</a>
                                </li>
                                <li>
                                    <a href="#">Histogram</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-globe"></i>
                            <span>Maps</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="#">Google maps</a>
                                </li>
                                <li>
                                    <a href="#">Open street map</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="header-menu">
                        <span>Extra</span>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-globe"></i>
                            <span>Profil</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a id="changeAvatar" href="#">Profil Resmi Değiştir</a>
                                </li>
                                <g:if test="${ Person.get(currentUser.id).avatar != null}">
                                <li>
                                    <g:link controller="signUp"  action="removeAvatar" params="[targetUri: (request.forwardURI - request.contextPath)]">Profil Resmi Kaldır</g:link>
                                </li>
                                </g:if>
                            </ul>
                        </div>
                    </li>
                    <li>
    <g:link controller="community" action="groups">
                            <i class="fa fa-book"></i>
                            <span>Gruplar</span>
                            <span class="badge badge-pill badge-primary">Beta</span>
    </g:link>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-calendar"></i>
                            <span>Calendar</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa fa-folder"></i>
                            <span>Examples</span>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8089/logout/index">
                            <i class="fa fa-power-off"></i>
                            <span>Çıkış</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- sidebar-menu  -->
        </div>
        <!-- sidebar-content  -->
        <div class="sidebar-footer">
            <a href="#">
                <i class="fa fa-bell"></i>
                <span class="badge badge-pill badge-warning notification">3</span>
            </a>
            <a href="#">
                <i class="fa fa-envelope"></i>
                <span class="badge badge-pill badge-success notification">7</span>
            </a>
            <a href="#">
                <i class="fa fa-cog"></i>
                <span class="badge-sonar"></span>
            </a>
            <a href="#">
                <i class="fa fa-power-off"></i>
            </a>
        </div>
    </nav>
    <!-- sidebar-wrapper  -->
                </sec:ifLoggedIn>

    <main class="page-content">
        <div class="container-fluid">
            <g:layoutBody/>
        </div>
    </main>
</div>

<g:uploadForm controller="signUp" action="upload"  params="[targetUri: (request.forwardURI - request.contextPath)]" style="visibility: hidden">
<!-- Photo ekleme için gerekli olan input...-->
    Photo: <input name="photo" type="file" id="inputPhoto"/>
    <g:submitButton name="upload" id="upload"/>
</g:uploadForm>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>


<script>
    $("#funEvents").click(function () {
        var url = window.location.hostname+":"+window.location.port;
        url+="/?eventType=fun";
        console.log("http://"+url);
        window.location.href= "http://"+url;
    });
    $("#educationEvents").click(function () {


        var url = window.location.hostname+":"+window.location.port;
        url+="/?eventType=education";
       console.log("http://"+url);
        window.location.href= "http://"+url;
    });


</script>

</body>
</html>
