<%-- 
    Document   : access_users
    Created on : Feb 15, 2025, 7:07:53 AM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.dtos.AppUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ip =ApplicationUtilities.getClientIP(request);
    String msg = null, alertClass = "alert-success", msg_type="Success";
    String username = (String)session.getAttribute(AppConstants.EMPLOYEE_NAME);

    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }
    
    //set current page
    session.setAttribute(AppConstants.CURRENT_PAGE, "USERS_PAGE");
    
    //get session theme
    String theme_name = session.getAttribute(AppConstants.THEME_TEXTURE) != null ? 
    (String)session.getAttribute(AppConstants.THEME_TEXTURE) : "light" ; 
    ApplicationLog.saveLog("Session Kin :: " + theme_name, "USERS_PAGE");
    
    String theme_clr = session.getAttribute(AppConstants.THEME_COLOR) != null ? 
    (String)session.getAttribute(AppConstants.THEME_COLOR) : "green" ; 
    ApplicationLog.saveLog("Session Color :: " + theme_clr, "USERS_PAGE");
    
    String img_clr = theme_clr; 
    ApplicationLog.saveLog("Image Color :: " + img_clr, "USERS_PAGE");
    
    //get current user theme
    SettingsController controller = new SettingsController(session, ip);
    UserTheme theme = controller.gerCurrentTheme();
    if(theme != null){
        theme_name = theme.getSkin();
        session.setAttribute(AppConstants.THEME_TEXTURE, theme_name);
        ApplicationLog.saveLog("Saved Skin :: " + theme_name, "USERS_PAGE");
        theme_clr = theme.getColor();
        session.setAttribute(AppConstants.THEME_COLOR, theme_clr);
        ApplicationLog.saveLog("Saved Color :: " + theme_clr, "USERS_PAGE");
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
        ApplicationLog.saveLog("Image Color :: " + theme_clr, "USERS_PAGE");
    } else {
        //current theme color
        session.setAttribute(AppConstants.ACTIVE_THEME, theme_name);
        session.setAttribute(AppConstants.ACTIVE_COLOR, theme_clr);
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
    }
    String theme_color = String.format("%s-%s-", theme_name, theme_clr);
    ApplicationLog.saveLog("Current Theme :: " + theme_color, "USERS_PAGE");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | USERS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>table-customerzation.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
       
        <!----------------main container-------->
        <div class="ops-base-container" data-sidebar-state="collapsed">
            <!----------------sidebar-------->
            <%@include file="sidebar.jsp"%>
            
            <!----------------section container-------->
            <div class="ops-base-content">
                
                <!----------------sidebar-------->
                <%@include file="header.jsp"%> 
                
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
                            
                            <div class="user-container">
                                
                                <div class="card user-list-container">
                                   <div class="card-header">
                                        System Users
                                    </div>
                                    <ul id="userList" class="user-list list-group list-group-flush"></ul>
                                </div>
                                
                                <div class="role-details-container">
                                    
                                    <div class="row">
                                        
                                        <div class="col-sm-12">
                                            <span id="lbl-fullname" class="diaplay-1 fullname-label">
                                                Full name
                                            </span>
                                            
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row">
                                        
                                        <div class="col-sm-6">
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="tf-firstname">First Name</label>
                                                <input id="user-firstname" name="tf-firstname" type="text" class="form-control"  placeholder="First Name">
                                            </div>
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="tf-middlename">Middle Name</label>
                                                <input id="user-middlename" name="tf-middlename" type="text" class="form-control"  placeholder="Middle Name">
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-sm-6">
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="tf-lastname">First Name</label>
                                                <input id="user-lastname" name="tf-lastname" type="text" class="form-control"  placeholder="Last Name">
                                            </div>
                                            
                                            <div class=" row form-group">
                                                <label for="tf-user-email">Email address</label>
                                                <input type="email" class="form-control" id="user-email" name="tf-user-email" placeholder="username">
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row">
                                        
                                        <div class="col-sm-12">
                                            <span>System Access</span>
                                            <span>Deleted</span>
                                        
                                            <div class="row-cols-1">
                                                <form id="form-password-reset">
                                                    <button type="button" class="btn btn-secondary">
                                                        Password Reset
                                                    </button>
                                                </form>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-sm-6">
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="cb-branch">Branch</label>
                                                <select id="user-branch" name="cb-branch" class="form-control form-control-sm">
                                                  <option value="0">Choose Branch</option>
                                                  <option value="1">Main Branch</option>
                                                  <option value="2">Other Branch</option>
                                                </select>
                                            </div>
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="dt-created" class="col-sm-12 col-form-label">Created On</label>
                                                <div class="col-sm-12 input-group date" id="fddate">
                                                    <input  id="usercreated" type="text" class="form-control" name="dt-created"/>
                                                    <div class="input-group-addon input-group-append">
                                                        <div class="input-group-text">
                                                            <i class="glyphicon glyphicon-calendar mdi mdi-calendar-month"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-cols-1 form-group">
                                                <label for="tf-created">Created By</label>
                                                <input id="user-created" name="tf-created" type="text" class="form-control"  placeholder="Created By">
                                            </div>
                                            
                                            <div class="row-cols-1">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="chk-verified">
                                                      Is Verified
                                                      <input id="user-active" name="chk-verified"type="checkbox" class="form-check-input" value="true" checked/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="chk-active">
                                                      IS Active
                                                      <input id="user-active" name="chk-active"type="checkbox" class="form-check-input" value="true" checked/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-sm-6">
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="cb-role">System Role</label>
                                                <select id="user-role" name="cb-role" class="form-control form-control-sm">
                                                  <option value="0">Choose Role</option>
                                                  <option value="1">Administrator</option>
                                                  <option value="1">IT Administrator</option>
                                                </select>
                                            </div>
                                            
                                           
                                            <div class="row-cols-1 form-group">
                                                <label for="tf-username">Username</label>
                                                <input id="user-username" name="tf-username" type="email" class="form-control"  placeholder="username">
                                            </div>
                                            
                                            <div class="row">
                                                 <div class="row-cols-1 form-group">
                                                    <label for="dt-modified" class="col-sm-12 col-form-label">Last Modified On</label>
                                                    <div class="col-sm-12 input-group date" id="fddate">
                                                        <input  id="usermodified" type="text" class="form-control" name="dt-modified"/>
                                                        <div class="input-group-addon input-group-append">
                                                            <div class="input-group-text">
                                                                <i class="glyphicon glyphicon-calendar mdi mdi-calendar-month"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 form-group">
                                                <label for="tf-modified">Modified By</label>
                                                <input id="user-modified" name="tf-modified" type="text" class="form-control"  placeholder="Modified By">
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                                
                            </div>   
                            
                        </div>
                        
                    </div>
                    
                    <div class="footer shadow-text">
                        <%=AppConstants.APP_FOOTER%>
                    </div>
                    
                </section>
                
            </div>
            
        </div>
         
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/moment/locales.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/moment/moment.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/moment/moment.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/datepicker.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/daterangepicker.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/user-script.js" type="text/javascript"></script>      
    </body>
</html>


