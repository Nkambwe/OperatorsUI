<%-- 
    Document   : customers
    Created on : Feb 9, 2025, 4:53:10 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.ApplicationLog"%>
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
    session.setAttribute(AppConstants.CURRENT_PAGE, "EMPLOYERS_PAGE");
    
    //get session theme
    String theme_name = session.getAttribute(AppConstants.THEME_TEXTURE) != null ? 
    (String)session.getAttribute(AppConstants.THEME_TEXTURE) : "light" ; 
    ApplicationLog.saveLog("Session Kin :: " + theme_name, "EMPLOYERS_PAGE");
    
    String theme_clr = session.getAttribute(AppConstants.THEME_COLOR) != null ? 
    (String)session.getAttribute(AppConstants.THEME_COLOR) : "green" ; 
    ApplicationLog.saveLog("Session Color :: " + theme_clr, "EMPLOYERS_PAGE");
    
    String img_clr = theme_clr; 
    ApplicationLog.saveLog("Image Color :: " + img_clr, "EMPLOYERS_PAGE");
    
    //get current user theme
    SettingsController controller = new SettingsController(session, ip);
    UserTheme theme = controller.gerCurrentTheme();
    if(theme != null){
        theme_name = theme.getSkin();
        session.setAttribute(AppConstants.THEME_TEXTURE, theme_name);
        ApplicationLog.saveLog("Saved Skin :: " + theme_name, "EMPLOYERS_PAGE");
        theme_clr = theme.getColor();
        session.setAttribute(AppConstants.THEME_COLOR, theme_clr);
        ApplicationLog.saveLog("Saved Color :: " + theme_clr, "EMPLOYERS_PAGE");
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
        ApplicationLog.saveLog("Image Color :: " + theme_clr, "EMPLOYERS_PAGE");
    } else {
        //current theme color
        session.setAttribute(AppConstants.ACTIVE_THEME, theme_name);
        session.setAttribute(AppConstants.ACTIVE_COLOR, theme_clr);
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
    }
    
    String theme_color = String.format("%s-%s-", theme_name, theme_clr);
    ApplicationLog.saveLog("Current Theme :: " + theme_color, "EMPLOYERS_PAGE");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | EMPLOYERS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        
        <!----------------main container-------->
        <div class="ops-base-container">
            
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
                             <h1>Employers Home Page</h1>
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

