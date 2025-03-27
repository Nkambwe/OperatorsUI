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
    
    ArrayList<AppUser> users = new ArrayList<>();
    AppUser user1 = new AppUser();
    user1.setId(1);
    user1.setFirstName("Mark");
    user1.setMiddleName("John");
    user1.setLastName("Nkambwe");
    user1.setUsername("mnkambwe");
    user1.setFullName("Nkambwe John Mark");
    user1.setEmail("jo.jomac.mac801@gmail.com");
    user1.setRoleId(1);
    user1.setRole("Administrator");
    user1.setBranchId(1);
    user1.setBranchName("Head Office");
    user1.setIsActive(true);
    user1.setIsVerified(true);
    user1.setIsDeleted(false);
    user1.setAddedOn("2025-01-23");
    user1.setAddedBy("System");
    user1.setModifiedOn("2025-01-25");
    user1.setModifiedBy("Jack");
    user1.setLastLogin("2025-02-15");
    users.add(user1);
    
    AppUser user2 = new AppUser();
    user2.setId(2);
    user2.setFirstName("Annet");
    user2.setMiddleName("Sophia");
    user2.setLastName("Namala");
    user2.setUsername("anamala");
    user2.setFullName("Namala Sophia Annet");
    user2.setEmail("anamala@gmail.com");
    user2.setRoleId(1);
    user2.setRole("Data Agent");
    user2.setBranchId(1);
    user2.setBranchName("Head Office");
    user2.setIsActive(true);
    user2.setIsVerified(true);
    user2.setIsDeleted(false);
    user2.setAddedOn("2025-02-12");
    user2.setAddedBy("System");
    user2.setModifiedOn("2025-02-12");
    user2.setModifiedBy("Paul");
    user2.setLastLogin("2025-02-14");
    users.add(user2);
    
    AppUser user3 = new AppUser();
    user3.setId(3);
    user3.setFirstName("Smith");
    user3.setMiddleName("Jack");
    user3.setLastName("Opolot");
    user3.setUsername("jsopolot");
    user3.setFullName("Opolot Jack Smith");
    user3.setEmail("jsopolot@gmail.com");
    user3.setRoleId(1);
    user3.setRole("Accountant");
    user3.setBranchId(1);
    user3.setBranchName("Head Office");
    user3.setIsActive(true);
    user3.setIsVerified(true);
    user3.setIsDeleted(false);
    user3.setAddedOn("2025-01-20");
    user3.setAddedBy("System");
    user3.setModifiedOn("2025-01-23");
    user3.setModifiedBy("Mark");
    user3.setLastLogin("2025-02-15");
    users.add(user3);
    
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | USERS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
                             <h1>User Home Page</h1>
                        </div>
                        
                    </div>
                    
                    <div class="footer shadow-text">
                        <%=AppConstants.APP_FOOTER%>
                    </div>
                    
                </section>
                
            </div>
            
        </div>
         
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/users-script.js" type="text/javascript"></script>
    </body>
</html>


