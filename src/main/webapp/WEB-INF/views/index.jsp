<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
        <sec:authorize access="isAuthenticated()">
            Your email <sec:authentication property="principal.username" /></p>
        </sec:authorize>

        <sec:authorize access="hasRole('USER')">
            <p> I am USER</p>
        </sec:authorize>
        <sec:authorize access="hasRole('MANAGER')">
            <p> I am MANAGER</p>
        </sec:authorize>
        <sec:authorize access="hasRole('ADMINISTRATOR')">
             <p> I am ADMINISTRATOR</p>
        </sec:authorize>

</div>