<%-- 
    Document   : settings
    Created on : Feb 9, 2025, 3:19:20 PM
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
    session.setAttribute(AppConstants.CURRENT_PAGE, "SETTINGS_PAGE");
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | ACCESS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/sidebar-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/settings-style.css" rel="stylesheet" type="text/css"/>
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
                    <div class="content-header"> 
                        <span>System Configurations</span>
                    </div>
                    <div class="tab-area">
                        <div class="tab tab-headers">
                            <button class="tablinks tab-active" id="defaultTab" onclick="openTab(event, 'Drivers')">
                                <span><i class="mdi mdi-car-cruise-control"></i></span>
                                <span>Drivers</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Employers')">
                               <span><i class="mdi mdi-car-cog"></i></span>
                               <span>Employers</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Members')">
                                <span><i class="mdi mdi-account-tie-outline"></i></span>
                               <span>Members</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Branches')">
                                <span><i class="mdi mdi-source-branch-plus"></i></span>
                                <span>Branches</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Users')">
                                <span><i class="mdi mdi-account-cog"></i></span>
                                <span>Users</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Roles')">
                                <span><i class="mdi mdi-account-multiple-outline"></i></span>
                                <span>Roles</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Permission')">
                                <span><i class="mdi mdi-account-network"></i></span>
                                <span>Permissions</span>
                            </button>
                            <button class="tablinks" onclick="openTab(event, 'Passwords')"> 
                                <span><i class="mdi mdi-lock-reset"></i></span>
                                <span>Password</span>
                            </button>
                        </div>

                        <div id="Drivers" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Drivers Settings</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <form id="driver-form" action="" method="post">
                                    
                                    <div class="section-lable">
                                        <span>Bio-data settings</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="surnameNameRequired">
                                                      Require driver Surname
                                                      <input class="form-check-input" type="checkbox" value="N" id="surnameNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="firstNameRequired">
                                                      Require driver first name
                                                      <input class="form-check-input" type="checkbox" value="N" id="firstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="otherNameRequired">
                                                      Require driver other name
                                                      <input class="form-check-input" type="checkbox" value="N" id="otherNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="dobRequired">
                                                      Require driver date of birth
                                                      <input class="form-check-input" type="checkbox" value="N" id="dobRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequired">
                                                      Require identification at registration
                                                      <input class="form-check-input" type="checkbox" value="N" id="idRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                    
                                        </div>
                                        
                                    </div>
                                 
                                    <div class="section-lable">
                                        <span>Contact info settings</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="homeDistrictct">
                                                      Require home district
                                                      <input class="form-check-input" type="checkbox" value="N" id="homeDistrictct"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="residenceDistrictct">
                                                      Require residence district
                                                      <input class="form-check-input" type="checkbox" value="N" id="residenceDistrictct"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="phoneNumber">
                                                      Require phone number
                                                      <input class="form-check-input" type="checkbox" value="N" id="phoneNumber"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="emailAddress">
                                                      Require email address
                                                      <input class="form-check-input" type="checkbox" value="N" id="emailAddress"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="socialMedia">
                                                      Require social media contact
                                                      <input class="form-check-input" type="checkbox" value="N" id="socialMedia"/>
                                                    </label>
                                                </div>
                                            </div>
                                         </div>
                                        
                                    </div>
        
                                    <div class="section-lable">
                                        <span>Education and work experience</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="academicInfo">
                                                      Require academic info
                                                      <input class="form-check-input" type="checkbox" value="N" id="academicInfo"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="licience">
                                                      Require driver license certification
                                                      <input class="form-check-input" type="checkbox" value="N" id="licience"/>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="experience">
                                                      Require work experience
                                                      <input class="form-check-input" type="checkbox" value="N" id="experience"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="expireDays">Number of years of working experience required</span>
                                                    <input type="number" class="form-control" placeholder="Enter number of reusable passwords" aria-label="Number of years experience" aria-describedby="yearsOfExperience">
                                                 </div>
                                            </div>
                                         </div>
                                        
                                    </div>
                                    
                                </form>
                            </div>
                         </div>

                        <div id="Employers" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Employers</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <p>Employers settings goes here</p> 
                            </div>
                        </div>

                        <div id="Members" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Members</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <p>Members settings goes here</p>
                            </div>
                            
                            
                        </div>

                        <div id="Branches" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Branches</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <p>Branches settings goes here</p>
                            </div>
                            
                            
                        </div>
                        
                        <div id="Users" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Users</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <p>User settings goes here</p>
                            </div>

                        </div>

                        <div id="Roles" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Roles</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <p>Roles settings goes here</p>
                            </div>
                        </div>

                        <div id="Permission" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Permission</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <p>Permission settings goes here</p>
                            </div>
                        </div>

                        <div id="Passwords" class="tabcontent">
                            <div class="tab-cotent-header">
                                <h3>Passwords</h3>
                            </div>
                            <div class="tab-cotent-details">
                                <form action="" method="post">
                                    
                                    <div class="row-cols-1 settings-row">
                                        <div class="form-check form-switch">
                                            <label class="form-check-label" for="expirePasswords">
                                              Expire user passwords after a specified period
                                              <input class="form-check-input" type="checkbox" value="N" id="expirePasswords"/>
                                            </label>
                                        </div>
                                    </div>
                                    
                                    <div class="row-cols-1 settings-row">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="expireDays">Number of days it takes to expire a password</span>
                                            <input type="number" class="form-control" placeholder="Enter Days" aria-label="Password expire days" aria-describedby="expireDays">
                                         </div>
                                    </div>

                                    <div class="row-cols-1 settings-row">
                                        <div class="form-check form-switch">
                                            <label class="form-check-label" for="reusePasswords">
                                              Allow users to reuse old passwords after a specified number of password
                                              <input class="form-check-input" type="checkbox" value="N" id="reusePasswords"/>
                                            </label>
                                        </div>
                                    </div>
                            
                                    <div class="row-cols-1 settings-row">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="expireDays">Number of passwords user must have before start reusing passwords</span>
                                            <input type="number" class="form-control" placeholder="Enter number of reusable passwords" aria-label="Number of reusable passwords" aria-describedby="reusablePasswords">
                                         </div>
                                    </div>
                                    
                                    <div class="row-cols-1 settings-row">
                                        <div class="form-check form-switch">
                                            <label class="form-check-label" for="strongPasswords">
                                              Use strong passwords(User password should contain a combination of upper and lower case letters, numbers and special characters)
                                              <input class="form-check-input" type="checkbox" value="N" id="strongPasswords"/>
                                            </label>
                                        </div>
                                    </div>
                                    
                                </form>
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
        
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/settings-script.js" type="text/javascript"></script>
    </body>
</html>

