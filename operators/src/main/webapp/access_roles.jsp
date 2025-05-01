<%-- 
    Document   : access_roles
    Created on : Feb 15, 2025, 7:08:37 AM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.dtos.AppRole"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = null, alertClass = "alert-danger", msg_type="Success";
    String ip =ApplicationUtilities.getClientIP(request);
    String username = (String)session.getAttribute(AppConstants.EMPLOYEE_NAME);

    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }
    
    //set current page
    session.setAttribute(AppConstants.CURRENT_PAGE, "ROLES_PAGE");
    
    //get session theme
    String theme_name = session.getAttribute(AppConstants.THEME_TEXTURE) != null ? 
    (String)session.getAttribute(AppConstants.THEME_TEXTURE) : "light" ; 
    ApplicationLog.saveLog("Session Kin :: " + theme_name, "ROLES_PAGE");
    
    String theme_clr = session.getAttribute(AppConstants.THEME_COLOR) != null ? 
    (String)session.getAttribute(AppConstants.THEME_COLOR) : "green" ; 
    ApplicationLog.saveLog("Session Color :: " + theme_clr, "ROLES_PAGE");
    
    String img_clr = theme_clr; 
    ApplicationLog.saveLog("Image Color :: " + img_clr, "ROLES_PAGE");
    
    //get current user theme
    SettingsController controller = new SettingsController(session, ip);
    UserTheme theme = controller.gerCurrentTheme();
    if(theme != null){
        theme_name = theme.getSkin();
        session.setAttribute(AppConstants.THEME_TEXTURE, theme_name);
        ApplicationLog.saveLog("Saved Skin :: " + theme_name, "ROLES_PAGE");
        theme_clr = theme.getColor();
        session.setAttribute(AppConstants.THEME_COLOR, theme_clr);
        ApplicationLog.saveLog("Saved Color :: " + theme_clr, "ROLES_PAGE");
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
        ApplicationLog.saveLog("Image Color :: " + theme_clr, "ROLES_PAGE");
    } else {
        //current theme color
        session.setAttribute(AppConstants.ACTIVE_THEME, theme_name);
        session.setAttribute(AppConstants.ACTIVE_COLOR, theme_clr);
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
    }
    String theme_color = String.format("%s-%s-", theme_name, theme_clr);
    ApplicationLog.saveLog("Current Theme :: " + theme_color, "ROLES_PAGE");
    
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | ROLES</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
         <link href="${pageContext.request.contextPath}/assets/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>table-customerzation.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <!----------------main container-------->    
        <div class="ops-base-container" data-sidebar-state="collapsed">

            <!----------------sidebar-------->
            <%@include file="sidebar.jsp"%> 
            
            <!----------------base content-------->
            <div class="ops-base-content">
                
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
                    
                    <%@include file="Pages/roles_page.jsp"%> 

                    <div class="footer shadow-text">
                        <%=AppConstants.APP_FOOTER%>
                    </div>

                </section>
                
            </div>

        </div>
        
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/role-script.js" type="text/javascript"></script>
    </body>
</html>
