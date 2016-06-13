<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="tophead">
    <div class="logo">
        <a href="/home">
        <img src="resources/img/logo.png" width="300"  />
        </a>
    </div>
</div>

<nav class="navbar navbar-default navbar-static-top primary-color" id="topnavbar">
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
            data-target="#top_navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div id="top_navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><sec:authorize access="!isAuthenticated()">
                                <li> <a href="<c:url value="/login" />">
                                <span class="glyphicon glyphicon-log-in" ></span>
                                <spring:message code="user.login" />
                                   </a>
                                   </li>
                                
                                <li><a  href="<c:url value="/registration" />">
                                <span class="glyphicon glyphicon-pencil"></span>
                                <spring:message code="user.registration" />
                                  </a></li>
                        </sec:authorize>


                        <sec:authorize access="isAuthenticated()">

                            <sec:authorize access="hasRole('USER')">
                                <li><a href="/home">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    <spring:message code="user.calendar" />
                                </a></li>
                            </sec:authorize>

                            <sec:authorize access="hasRole('MANAGER')">
                                <li id="roompicker" class="dropdown menu-item">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <span id="room"></span>
                                    </a>
                                    <ul id="selectRoom" class="dropdown-menu">
                                    <c:forEach items="${rooms}" var="room">
                                        <li>
                                            <a id="${room.id}">${room.address}</a>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                </li>

                                <li><a href="/home">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    <spring:message code="user.calendar" />
                                </a></li>
                            </sec:authorize>

                            <sec:authorize access="hasRole('USER')">
                                 <li><a href="mykids">
                                 <span class="glyphicon glyphicon-user"></span>
                                 <spring:message code="user.myKids" />
                                 </a></li>
                                 <li><a href="mybookings">
                                 <span class="glyphicon glyphicon-tasks"></span>
                                 <spring:message code="user.myBookings" />
                                 </a></li>
                            </sec:authorize>


                            <sec:authorize access="hasRole('MANAGER')">
                                  <li><a href="manager-report">
                                  <span class="glyphicon glyphicon-tasks"></span>
                                  <spring:message code="manager.report" /></a>
                                  </li>
                                  <li><a href="manager-confirm-booking">
                                  <span class="glyphicon glyphicon-list"></span>
                                  <spring:message code="manager.listbooking" />
                                  </a></li>
                                  <li><a href="manager-edit-booking">
                                  <span class="glyphicon glyphicon-edit"></span>
                                  <spring:message code="button.edit" />
                                  </a></li>

                              </sec:authorize>

                            <sec:authorize access="hasRole('ADMINISTRATOR')">
                                <li><a href="adm-statistics">
                                    <span class="glyphicon glyphicon-tasks"></span>
                                    <spring:message code="administrator.statistics" /></a>
                                </li>
                                <li><a href="adm-edit-room">
                                <span class="glyphicon glyphicon-home"></span>
                                <spring:message code="administrator.editRooms" />
                                </a></li>
                                <li><a href="adm-edit-manager">
                                 <span class="glyphicon glyphicon-user"></span>
                                <spring:message code="administrator.editManagers" />
                                </a></li>
                                <li><a href="adm-config">
                                <span class="glyphicon glyphicon-cog"></span>
                                <spring:message code="administrator.configuration" />
                                </a></li>
                            </sec:authorize>

                                <li>
                                <a href="logout">
                                <span class="glyphicon glyphicon-log-out"></span>
                                <spring:message code="user.logout" />
                                </a>
                                </li>

                        </sec:authorize>

                
            </ul>
            <ul class="nav navbar-nav navbar-right">
           <li class="dropdown menu-item">       
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="glyphicon glyphicon-globe"></span>
              <spring:message code="user.language" />
              </a>
                <ul class="dropdown-menu">
                    <li> <a class="langitem" id="EN">EN</a></li>
                    <li> <a class="langitem" id="UA">UA</a></li>
                   </ul>
                 </li>
            </ul>
        </div>
    </div>
</nav>
