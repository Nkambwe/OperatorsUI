<%-- 
    Document   : access_users
    Created on : Feb 15, 2025, 7:07:53 AM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.dtos.AppUser"%>
<%@page import="java.util.ArrayList"%>
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
    
    
    //set current page
    session.setAttribute(AppConstants.CURRENT_PAGE, "SETTINGS_PAGE");
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
        <link href="${pageContext.request.contextPath}/assets/styles/app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/sidebar-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/table-customerzation.css" rel="stylesheet" type="text/css"/>
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

                            <span class="page-brand text-success">Users</span>

                            <ul class="page-header-menu">

                                <li class="page-header-menu-item">
                                    <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="user_page_01.jsp">
                                        <span>
                                              <i class="mdi mdi-account-plus"></i>
                                        </span>
                                        <span>New</span>
                                    </button>
                                </li>

                                <li class="page-header-menu-item">
                                    <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="user_page_02.jsp">
                                        <span>
                                            <i class="mdi mdi-account-network"></i>
                                        </span>
                                        <span>Roles</span>
                                    </button>
                                </li>
                                
                                <li class="page-header-menu-item">
                                    <button id="btn-page-d4" class="nav-item-button page-menu-button" data-partial="user_page_04.jsp">
                                        <span>
                                            <i class="mdi mdi-account-key"></i>
                                        </span>
                                        <span>Permissions</span>
                                    </button>
                                </li>

                                <li class="page-header-menu-item">
                                    <button id="btn-page-d3" class="nav-item-button page-menu-button" data-partial="user_page_03.jsp">
                                        <span>
                                             <i class="mdi mdi-account-clock"></i>
                                        </span>
                                        <span>History</span>
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
                        
                        <!--main content page-->
                        <div class="page-cotent-home">
                            <table id="datatable-users" class="table table-striped table-bordered table-hover">
                                
                                <thead>
                                    <tr>
                                         <th></th>
                                        <th>FIRST NAME</th>
                                        <th>MIDDLE NAME</th>
                                        <th>LAST NAME</th>
                                        <th>LOGIN NAME</th>
                                        <th>EMAIL</th>
                                        <th>ROLE</th>
                                        <th>BRANCH</th>
                                        <th>ACTIVE</th>
                                        <th>VERIFIED</th>
                                        <th>ADDED ON</th>
                                        <th>LAST MODIFIED</th>
                                        <th>LAST LOGIN</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <%
                                        if(users != null && users.size() > 0){
                                            for(AppUser user : users){
                                    %>
                                                
                                                <tr id="<%= user.getId()%>">
                                                     <td></td>
                                                    <td><%= user.getFirstName()%></td> 
                                                    <td><%= user.getMiddleName()%></td> 
                                                    <td><%= user.getLastName()%></td> 
                                                    <td><%= user.getUsername()%></td> 
                                                    <td><%= user.getEmail()%></td> 
                                                    <td><%= user.getRole()%></td> 
                                                    <td><%= user.getBranchName()%></td> 
                                                    <td><%= user.isActive()%></td> 
                                                    <td><%= user.isVerified()%></td> 
                                                    <td><%= user.getAddedOn()%></td> 
                                                    <td><%= user.getModifiedOn()%></td> 
                                                    <td><%= user.getLastLogin()%></td> 
                                                </tr>
                                            <%}
                                        } else {%>
                                        <tr>
                                            <td colspan="15" class="no-data-container">
                                                <span style="display:inline-block; font-size:1.2em; font-weight:600; padding-left:20px;">
                                                    No Records found
                                                </span>
                                            </td>
                                        </tr>   
                                    <%}
                                    %>
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                   
                </div>
                
            </div>
            
            <div class="footer shadow-text">
                <%=AppConstants.APP_FOOTER%>
            </div>
        </section>
            
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/datatables.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/users-script.js" type="text/javascript"></script>
    </body>
</html>


