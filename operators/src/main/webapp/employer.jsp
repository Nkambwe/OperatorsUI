<%-- 
    Document   : customers
    Created on : Feb 9, 2025, 4:53:10 PM
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
    session.setAttribute(AppConstants.CURRENT_PAGE, "CUSTOMERS_PAGE");
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | CLIENTS</title>
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

                            <span class="page-brand text-success">CLIENTS</span>

                            <ul class="page-header-menu">

                                <li class="page-header-menu-item">
                                    <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="employer_page_01.jsp">
                                        <span>
                                            <i class="mdi mdi-car-info"></i>
                                        </span>
                                        <span>Employer</span>
                                    </button>
                                </li>

                                <li class="page-header-menu-item">
                                    <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="employer_page_02.jsp">
                                        <span>
                                             <i class="mdi  mdi-car-electric"></i>
                                        </span>
                                        <span>Engagements</span>
                                    </button>
                                </li>
                                
                                <li class="page-header-menu-item">
                                    <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="employer_page_03.jsp">
                                        <span>
                                             <i class="mdi mdi-car-off"></i>
                                        </span>
                                        <span>Canceled Contracts</span>
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
                         <h1>Employer Home Page</h1>
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

