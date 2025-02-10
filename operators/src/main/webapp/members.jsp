<%-- 
    Document   : members
    Created on : Feb 9, 2025, 3:16:19 PM
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
    session.setAttribute(AppConstants.CURRENT_PAGE, "MEMBERS_PAGE");
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | MEMBERS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/sidebar-style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <body>
     <body>
        <%@include file="sidebar.jsp"%> 

        <section class="main-content-container">
            
            <%@include file="header.jsp"%> 
            <div class="main-content">
                <% if (msg != null) {%>
                <div class="message-container">
                    
                    <div class="alert <%= alertClass%> alert-dismissable">
                        <span><strong><%=msg_type%>!</strong> <%=msg%></span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                        
                </div>
                <% }%>
                
                
                <div class="content-wrapper">
                    
                    <header class="page-header">
                        
                        <nav class="page-parent-header">

                            <span class="page-brand text-success">MEMBERS</span>

                            <ul class="page-header-menu">

                                <li class="page-header-menu-item">
                                    <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="members_page_01.jsp">
                                        <span>
                                             <i class="mdi mdi-account-tie-outline"></i>
                                        </span>
                                        <span>New Member</span>
                                    </button>
                                </li>

                                <li class="page-header-menu-item">
                                    <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="members_page_03.jsp">
                                        <span>
                                            <i class="mdi mdi-account-tie-voice"></i>
                                        </span>
                                        <p>Referrals</p>
                                    </button>
                                </li>
                                
                                <li class="page-header-menu-item">
                                    <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="customers_page_03.jsp">
                                        <span>
                                             <i class="mdi mdi-account-tie-voice-off"></i>
                                        </span>
                                        <span>Canceled</span>
                                    </button>
                                </li>
                                
                           </ul>

                        </nav>
                    </header>
                    
                    <div class="page-content">
                        <!--container for child pages-->
                        <div id="overlay">
                            <div id="parent-container" class="page-container" data-child="no-child"></div>
                        </div>
                         <h1>Members Home Page</h1>
                    </div>
                   
                </div>
               
                
            </div>
            
            <div class="footer shadow-text">
                <%=AppConstants.APP_FOOTER%>
            </div>
        </section>
       
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
    </body>
</html>
