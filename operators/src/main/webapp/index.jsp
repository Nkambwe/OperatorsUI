<%-- 
    Document   : index
    Created on : Jan 31, 2025, 7:04:26 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = null, alertClass = "alert-success";
    String username = (String)session.getAttribute(AppConstants.KEY_USERNAME);
    
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }

    //TODO--check number of days left for expirey
    boolean checkExpiredPwd = (boolean)session.getAttribute(AppConstants.KEY_EXPIRRPWD);
    var remainders = (int)session.getAttribute(AppConstants.KEY_EXPIRESINDAYS); 
    if(remainders <= 7){
        msg = String.format("Your password will expire in %s days. Change password");
        alertClass = "alert-warning";
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
        <link href="${pageContext.request.contextPath}/assets/styles/app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/sidebar-style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="sidebar.jsp"%> 

        <section class="main-content-container">
            
            <header class="main-content-header">
                <div class="content-header-left">Left header</div>
                <div class="content-header-right">Right header</div>
            </header>
            
            <div class="main-content">
                <h1>Welcome <%=username%>!</h1>
            </div>
            
            <div class="footer shadow-text">
                <%=AppConstants.APP_FOOTER%>
            </div>
        </section>
            
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
    </body>
</html>
