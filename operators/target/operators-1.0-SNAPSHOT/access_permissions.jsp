<%-- 
    Document   : access
    Created on : Feb 9, 2025, 3:18:17 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = null, alertClass = "alert-danger", msg_type="Success";

    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }
    
    //set current page
    session.setAttribute(AppConstants.CURRENT_PAGE, "PERMISSIONS_PAGE");
    
    //user theme settings
    String theme_color = "light-green-";
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | ACCESS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <!----------------main container-------->    
        <div class="ops-base-container" data-sidebar-state="collapsed">

            <!----------------sidebar-------->
            <%@include file="sidebar.jsp"%> 
            
            <!----------------base content-------->
            <div class="ops-base-content" data-sidebar-state="collapsed">
                
                <!----------------header-------->
                <%@include file="header.jsp"%> 

                <!----------------section container-------->
                <section class="main-content-container">

                     
                    <% if (msg != null) {%>
                    <div class="alert <%= alertClass%> alert-dismissable message-container">
                        <span><strong><%=msg_type%>!</strong> <%=msg%>!</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% }%>
                    
                    <div class="section-main-content">  
                        
                        <!--container for child pages-->
                        <div id="overlay">
                            <div id="parent-container" class="page-container" data-child="no-child"></div>
                        </div>
                        
                        <div class="page-content">
                             <h1>User Permissions</h1>
                        </div>
                        
                    </div>

                    <div class="footer shadow-text">
                        <%=AppConstants.APP_FOOTER%>
                    </div>

                </section>
                
            </div>

        </div>
        
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
    </body>
</html>

