<%-- 
    Document   : logout
    Created on : Mar 4, 2025, 5:28:27 AM
    Author     : Macjohnan
--%>
<%@page import="com.kram.operators.controllers.LogoutController"%>
<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.helpers.UserTheme"%>
<%@page import="com.kram.operators.controllers.SettingsController"%>
<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String smg = null;
    if (session.getAttribute(AppConstants.KEY_LOGGEDIN) != null) {
         String ip=ApplicationUtilities.getClientIP(request);
         
        //..call controller to update Database
        LogoutController controller = new LogoutController(session,ip);
        if (controller.logoutUser()) {
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else{
        //TODO --putcontetent to page
          smg = "UNABLE TO COMPLETE REQUEST";
        }

    } else {
        System.out.println("Sending Redirect to Login");
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | HOME</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/app-logout-styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <!----------------main container-------->
        <div class="ops-logout-container">
            <div class="ops-logout-top">
                <div class="ops-logout-logo">
                    <div class="image-box">
                        <img id="img-logo" src="${pageContext.request.contextPath}/assets/images/green.png" alt="logo"/>
                    </div>
                </div>
                <h1 class="display-1 ops-logout-drive">Drive Match</h1>
            </div>
            <div class="ops-logout-content">
                <div class="ops-logout-text">
                    <span class="display-5">Oops!, Something went wrong</span>
                </div>
                <h1 class="display-5">There could be a malfunction in the system or a service outage. We track these errors automatically, but if the error persists, feel free to contact us. Please try again.</h1>
                <div class="btn-container">
                    <a class="btn btn-success" href="login.jsp">
                        Back to login
                    </a>
                </div>
            </div>
                   
            <div class="footer shadow-text">
                <%=AppConstants.APP_FOOTER%>
            </div>
                     
        </div>
        
    </body>
    
</html>
