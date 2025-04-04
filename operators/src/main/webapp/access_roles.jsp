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
    
    ArrayList<AppRole> roles = new ArrayList<>();
    AppRole user1 = new AppRole();
    user1.setId(1);
    user1.setRoleName("Administrator");
    user1.setDescription("System Administrator");
    user1.setIsActive(true);
    user1.setAddedOn("2025-01-23");
    user1.setAddedBy("System");
    user1.setModifiedOn("2025-01-25");
    user1.setModifiedBy("Mark");
    roles.add(user1);
    
    AppRole user2 = new AppRole();
    user2.setId(2);
    user2.setRoleName("System");
    user2.setDescription("Customer Support");
    user2.setIsActive(true);
    user2.setAddedOn("2025-02-12");
    user2.setAddedBy("System");
    user2.setModifiedOn("2025-02-12");
    user2.setModifiedBy("Mark");
    roles.add(user2);
    
    AppRole user3 = new AppRole();
    user3.setId(3);
    user3.setRoleName("System");
    user3.setDescription("Super User");
    user3.setIsActive(true);
    user3.setAddedOn("2025-01-20");
    user3.setAddedBy("System");
    user3.setModifiedOn("2025-01-23");
    user3.setModifiedBy("Mark");
    roles.add(user3);
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
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
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
                    
                    <div class="section-main-content">  
                        
                        <!--container for child pages-->
                        <div id="overlay">
                            <div id="parent-container" class="page-container" data-child="no-child"></div>
                        </div>
                        
                        <div class="page-content">
                            <div class="role-container">   
                                <div class="role-list-container">
                                    <div class="role-list-add-container">
                                        <form id="role-form">

                                            <div class="mb-3">
                                                <label for="roleName" class="form-label">Role</label>
                                                <input id="roleName" name="roleName" class="form-control form-control-sm" type="text" placeholder="Role Name" aria-label="Role Name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="roleDecription" class="form-label">Description</label>
                                                <input id="roleDecription" name="roleDecription" class="form-control form-control-sm" type="text" placeholder="Description" aria-label="Description">
                                            </div>
                                            <div class="mb-3">
                                                <button id="roleBtn" type="button" class="btn btn-primary">Add</button>
                                            </div>
                                        </form>
                                        
                                        <div class="role-list-box">
                                            <%if(roles != null && !roles.isEmpty()){%>
                                            <ul id="roleList" class="role-list">
                                                <%for(AppRole role : roles){%>
                                                <li><%=role.getRoleName()%></li>
                                                <%}%>
                                            </ul>
                                            <%}else{%>
                                            <div class="no-data-box">
                                                <span class="display-4">No Roles</span>
                                            </div>
                                            <%}%>
                                            
                                        </div>
                                        
                                    </div>
                                </div>

                                <div class="role-details-container"></div>
                            </div>
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
