<%-- 
    Document   : index Home Page
    Created on : Jan 31, 2025, 7:04:26 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.helpers.UserTheme"%>
<%@page import="com.kram.operators.controllers.SettingsController"%>
<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ip =ApplicationUtilities.getClientIP(request);
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
    
    //get session theme
    String theme_name = session.getAttribute(AppConstants.THEME_TEXTURE) != null ? 
    (String)session.getAttribute(AppConstants.THEME_TEXTURE) : "light" ; 
    ApplicationLog.saveLog("Session Kin :: " + theme_name, "INDEX_PAGE");
    
    String theme_clr = session.getAttribute(AppConstants.THEME_COLOR) != null ? 
    (String)session.getAttribute(AppConstants.THEME_COLOR) : "green" ; 
    ApplicationLog.saveLog("Session Color :: " + theme_clr, "INDEX_PAGE");
    
    //get current user theme
    SettingsController controller = new SettingsController(session, ip);
    UserTheme theme = controller.gerCurrentTheme();
    if(theme != null){
        theme_name = theme.getSkin();
        session.setAttribute(AppConstants.THEME_TEXTURE, theme_name);
        ApplicationLog.saveLog("Saved Skin :: " + theme_name, "INDEX_PAGE");
        theme_clr = theme.getColor();
        session.setAttribute(AppConstants.THEME_TEXTURE, theme_name);
        ApplicationLog.saveLog("Saved Color :: " + theme_clr, "INDEX_PAGE");
    }

    //current theme color
    if(theme_name.equals("dark")){
        session.setAttribute(AppConstants.ACTIVE_DARK, "active-theme");
        session.setAttribute(AppConstants.ACTIVE_LIGHT, "");
    } else {
        session.setAttribute(AppConstants.ACTIVE_DARK, "");
        session.setAttribute(AppConstants.ACTIVE_LIGHT, "active-theme");
    }
    String theme_color = String.format("%s-%s-", theme_name, theme_clr);
    ApplicationLog.saveLog("Current Theme :: " + theme_color, "INDEX_PAGE");
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
                        </div>
                        
                        <div class="dashboard-chart-container"> 
                             <!----------------Left charts-------->
                            <div class="right-chart-container">
                                 
                               <div class="ops-charts-drivers">
                                    
                                   <div class="chart-card">
                                       <span class="chart-card-icon"><i class="mdi mdi-car-child-seat"></i></span>
                                       <div class="chart-card-content">
                                           <h1 class="display-2">139</h1>
                                           <span>Drivers</span>
                                       </div>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span class="chart-card-icon"><i class="mdi mdi-account-tie"></i></span>
                                       <div class="chart-card-content">
                                           <h1 class="display-2">83</h1>
                                           <span>Members</span>
                                       </div>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span class="chart-card-icon"><i class="mdi mdi-car-multiple"></i></span>
                                       <div class="chart-card-content">
                                          <h1 class="display-2">65</h1>
                                           <span>Employers</span>
                                       </div>
                                   </div>
                                   
                                </div>
                                 
                                  
                                <div class="ops-charts-members">
                                     
                                   <div class="chart-card">
                                       <span class="chart-card-icon"><i class="mdi mdi-car-traction-control"></i></span>
                                       <div class="chart-card-content">
                                           <h1 class="display-2">96</h1>
                                           <span>Active Drivers</span>
                                       </div>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span class="chart-card-icon"><i class="mdi mdi-account-tie-voice"></i></span>
                                       <div class="chart-card-content">
                                           <h1 class="display-2">65</h1>
                                           <span>Active Members</span>
                                       </div>
                                   </div>
                                    
                                   <div class="chart-card">
                                       <span class="chart-card-icon"><i class="mdi mdi-car-2-plus"></i></span>
                                       <div class="chart-card-content">
                                          <h1 class="display-2">41</h1>
                                           <span>Active Employers</span>
                                       </div>
                                   </div>
                                   
                                </div>
                                
                                <div class="ops-charts-recent">
                                    
                                    <div class="ops-selected-matches-container">
                                        <span class="display-5 matches-table-header">Selected matches call list</span>
                                        <table class="matched-table">
                                            <thead>
                                            <th>Driver Name</th>
                                            <th>Driver Contact</th>
                                            <th>Employer</th>
                                            <th>Employer Contact</th>
                                            <th>Contract Type</th>
                                            <th>Call About</th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Semakula Thormas</td>
                                                    <td>2567729014132</td>
                                                    <td>Mukula and Company</td>
                                                    <td>0456890127</td>
                                                    <td>Employment</td>
                                                    <td>Pending Charges</td>
                                                </tr>
                                                <tr>
                                                    <td>Atwine Philip</td>
                                                    <td>2567760018331</td>
                                                    <td>Mr.Matovu Muhamad</td>
                                                    <td>256704897213</td>
                                                    <td>Family Driver</td>
                                                    <td>Pending ID Documents</td>
                                                </tr>
                                                <tr>
                                                    <td>Okello Jackson</td>
                                                    <td>2567514010351</td>
                                                    <td>ST.Kizito Primary</td>
                                                    <td>0456966127</td>
                                                    <td>School Bus</td>
                                                    <td>Pending ID Documents</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        
                                    </div>
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
