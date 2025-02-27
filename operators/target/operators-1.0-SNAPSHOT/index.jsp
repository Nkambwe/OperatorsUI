<%-- 
    Document   : index Home Page
    Created on : Jan 31, 2025, 7:04:26 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = null, alertClass = "alert-danger", msg_type="Success";
    String username = (String)session.getAttribute(AppConstants.EMPLOYEE_NAME);
    
    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }
    
    //set current page
    session.setAttribute(AppConstants.CURRENT_PAGE, "INDEX_PAGE");

    //TODO--check number of days left for expirey
    boolean checkExpiredPwd = (boolean)session.getAttribute(AppConstants.KEY_EXPIRRPWD);
    var remainders = (int)session.getAttribute(AppConstants.KEY_EXPIRESINDAYS); 
    if(remainders <= 7){
        msg_type="Warning! ";
        
        msg = String.format("Your password will expire in %d days. Consider changing your password", remainders);
        alertClass = "alert-warning";
    }
    
    //user theme settings
    
    String theme_name = session.getAttribute(AppConstants.THEME_TEXTURE) != null ? 
    (String)session.getAttribute(AppConstants.THEME_TEXTURE) : "Theme Not Found!" ; 

    String theme_clr = session.getAttribute(AppConstants.THEME_COLOR) != null ? 
    (String)session.getAttribute(AppConstants.THEME_COLOR) : "Color Not Found!" ; 
    String theme_color = String.format("%s-%s-", theme_name, theme_clr);
    
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
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
      
        <!----------------main container-------->
        <div class="ops-dashboard-container">
            
             <!----------------sidebar-------->
             <%@include file="sidebar.jsp"%> 
             
              <!----------------dashboard container: other pages use content container-------->
             <div class="ops-dashboard-content">
                 
                <!----------------sidebar-------->
                <%@include file="header.jsp"%> 
               
                <section>
                    
                    <% if (msg != null) {%>
                    <div class="message-container">

                        <div class="alert <%= alertClass%> alert-dismissable">
                            <span><strong><%=msg_type%>!</strong> <%=msg%>!</span>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>

                    </div>
                    <% }%>

                    <div class="content-wrapper">
                        
                        <div class="dashboard-welcome-container">
                            <span class="welcome-brand display-1"><%=ApplicationUtilities.greet()%> <%=username%>!</span>
                            <button id="btn-user" class="btn-user-settings">
                                <span><i class="mdi mdi-account-cog"></i></span>
                            </button>
                        </div>
                        
                        <div class="dashboard-chart-container"> 
                             <!----------------Left charts-------->
                            <div class="right-chart-container">
                                 
                               <div class="ops-charts-drivers">
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-settings"></i></span>
                                       <h3>Registered Drivers</h3>
                                       <h1>139</h1>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-connected"></i></span>
                                       <h3>Available</h3>
                                       <h1>65</h1>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-info"></i></span>
                                       <h3>Pending Approval</h3>
                                       <h1>32</h1>
                                   </div>
                                   
                                </div>
                                 
                                  
                                <div class="ops-charts-members">
                                     
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-settings"></i></span>
                                       <h3>Members</h3>
                                       <h1>82</h1>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-connected"></i></span>
                                       <h3>Individuals</h3>
                                       <h1>27</h1>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-info"></i></span>
                                       <h3>Companies</h3>
                                       <h1>55</h1>
                                   </div>
                                    
                                </div>
                                
                                <div class="ops-charts-employers">
                                     
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-settings"></i></span>
                                       <h3>Employers</h3>
                                       <h1>48</h1>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-connected"></i></span>
                                       <h3>Businesses</h3>
                                       <h1>38</h1>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span><i class="mdi mdi-car-info"></i></span>
                                       <h3>Seasonal</h3>
                                       <h1>10</h1>
                                   </div>
                                   
                                </div>
                                
                                <div class="ops-charts-recent">
                                    <span class="display-5">Recent matches charts here</span>
                                </div>
                                
                            </div>
                            
                               <!----------------Right charts-------->
                             <div class="left-chart-container">
                                 <span class="display-5">Other chats</span>
                            </div>
                            
                        </div>
                        
                    </div>

                </section>
                        
                <div class="footer shadow-text">
                    <%=AppConstants.APP_FOOTER%>
                </div>
                    
             </div>
             
        </div>
            
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
    </body>
</html>
