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
                            
                            <button class="tablinks" onclick="openTab(event, 'Users')">
                                <span><i class="mdi mdi-account-cog"></i></span>
                                <span>Users</span>
                            </button>
                            
                            <button class="tablinks" onclick="openTab(event, 'Passwords')"> 
                                <span><i class="mdi mdi-lock-reset"></i></span>
                                <span>Password</span>
                            </button>
                            
                        </div>

                        <div id="Drivers" class="tabcontent">
                            
                            <form id="driver-form" action="" method="post">
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Drivers Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </div>
                                </div>
                                
                                <div class="tab-content-details">
                                
                                    
                                    <div class="section-lable">
                                        <span>Bio-data settings</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="surnameNameRequired">
                                                      Driver Surname is required
                                                      <input class="form-check-input" type="checkbox" value="N" checked id="surnameNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="firstNameRequired">
                                                      Driver first name is required
                                                      <input class="form-check-input" type="checkbox" value="N" checked id="firstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="otherNameRequired">
                                                      Driver other name is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="otherNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="dobRequired">
                                                      Driver date of birth is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="dobRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequired">
                                                      Driver Identification is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="idRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequiredAtReqgistration">
                                                      Driver Identification is required at registration
                                                      <input class="form-check-input" type="checkbox" value="N" id="idRequiredAtReqgistration"/>
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
                                                      Driver home district is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="homeDistrictct"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="residenceDistrictct">
                                                      Driver residence district is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="residenceDistrictct"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="phoneNumber">
                                                      Phone number is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="phoneNumber"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="emailAddress">
                                                      Driver email address is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="emailAddress"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="socialMedia">
                                                      Social media contact is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="socialMedia"/>
                                                    </label>
                                                </div>
                                            </div>
                                         </div>
                                        
                                    </div>
        
                                    <div class="section-lable">
                                        <span>Documentation</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="academicInfo">
                                                      Academic info is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="academicInfo"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="academicDocumentsRequired">
                                                      Copied of academic documents are required
                                                      <input class="form-check-input" type="checkbox" value="N" id="academicDocumentsRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="licienceRequired">
                                                      Driver's license certification is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="licienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="copyOfLicienceRequired">
                                                      Copied of driver's license certification is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="copyOfLicienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="refereesRequired">
                                                      Must provide referees at registration
                                                      <input class="form-check-input" type="checkbox" value="N" id="refereesRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="copyOfReferenceRequired">
                                                      Copied of reference are required
                                                      <input class="form-check-input" type="checkbox" value="N" id="copyOfReferenceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
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
                                    
                               
                                </div>
                            </form>
                         </div>

                        <div id="Employers" class="tabcontent">
                            <form id="employer-form" action="" method="post">
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Employee Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </div>
                                </div>
                            
                                <div class="tab-content-details">
                                
                                    <div class="section-lable">
                                        <span>General Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <span class="inner-label">Company Employers</span>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="companyNameRequired">
                                                      Company's name is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="companyNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="companyAddressRequired">
                                                      Company's physical address is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="companyAddressRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonRequired">
                                                      Contact's Name is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="contactPersonRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonNumberRequired">
                                                      Contact Number is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="contactPersonNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonIdRequired">
                                                      Contact National Id is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="contactPersonIdRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonIdCopyRequired">
                                                      A copy of contact's National Id is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="contactPersonIdCopyRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <span class="inner-label">Individual Employers</span>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerNameRequired">
                                                      Employer's name is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="employerNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerAddressRequired">
                                                      Employer's physical address is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="employerAddressRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerContactNumberRequired">
                                                      Employer's contact number is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="employerContactNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerIdRequired">
                                                      Employer's National Id is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="employerIdRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerIdCopyRequired">
                                                      A copy employer's National Id is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="employerIdCopyRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        
                                    </div>
                                    
                                    <div class="section-lable">
                                        <span>Additional Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                           
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerDistrictRequired">
                                                      Employer district is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="employerDistrictRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerEmailRequired">
                                                      Employer email address is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked  id="employerEmailRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerAlternativeNumberRequired">
                                                      Alternative Contact Number is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="employerAlternativeNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                             
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="markEmployerAsDeleted">
                                                      Only Mark Employers as deleted on deletion (Employer record will not be deleted permanently)
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="markEmployerAsDeleted"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                    
                                
                                
                                </div>        
                            
                            </form>
                            
                        </div>

                        <div id="Members" class="tabcontent">
                            
                            <form id="member-form" action="" method="post">
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Member Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </div>
                                </div>
                            
                                <div class="tab-content-details">
                                
                                    <div class="section-lable">
                                        <span>General Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                           
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberFirstNameRequired">
                                                      member first name is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="memberFirstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberAddressRequired">
                                                      Member's physical address is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="memberAddressRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberIdRequired">
                                                      Member's National Id is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="memberIdRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberSurameRequired">
                                                      member surname name is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="memberSurameRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="cmemberContactRequired">
                                                      Member's contact number is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="cmemberContactRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberIdCopyRequired">
                                                      A copy of member's National Id is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="memberIdCopyRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="section-lable">
                                        <span>Additional Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                           
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberDistrictRequired">
                                                      Member district is required
                                                      <input class="form-check-input" type="checkbox" value="N" id="memberDistrictRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberEmailRequired">
                                                      Member email address is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked  id="memberEmailRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberAlternativeNumberRequired">
                                                      Member alternative contact number is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="memberAlternativeNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                             
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="markMemberAsDeleted">
                                                      Only mark Member as deleted on deletion (Member record will not be deleted permanently)
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="markMemberAsDeleted"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                </div>   
                            </form>
                        </div>

                        <div id="Users" class="tabcontent">
                            
                            <form id="driver-form" action="" method="post">
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>User Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </div>
                                </div>
                            
                                <div class="tab-content-details">

                                    <div class="section-lable">
                                        <span>General Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userFirstNameRequired">
                                                      User first name is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="userFirstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userLastNameRequired">
                                                      User last name is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="userLastNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userMiddleNameRequired">
                                                      User middle name is required
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="userMiddleNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="uniqueUsername">
                                                      Username must be unique
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="uniqueUsername"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userEmailRequired">
                                                      User must provide an email address
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="userEmailRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="uniqueUserEmail">
                                                      User must provide a unique email address
                                                      <input class="form-check-input" type="checkbox" value="Y"  checked id="uniqueUserEmail"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="verifyUsers">
                                                      Users must be verified
                                                      <input class="form-check-input" type="checkbox" value="Y"  checked id="verifyUsers"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="cannotVerifySame">
                                                      Users can't be verified by user who created them
                                                      <input class="form-check-input" type="checkbox" value="Y"  checked id="cannotVerifySame"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="section-lable">
                                        <span>Additional settings</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="markUserAsDeleted">
                                                      Mark users as deleted on deletion  (User record will not be deleted permanently)
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="markUserAsDeleted"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="lockUserAccount">
                                                      Lock user account after a specified number of attempted logins
                                                      <input class="form-check-input" type="checkbox" value="Y" checked id="lockUserAccount"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="expireDays">Maximum login attempts</span>
                                                    <input type="number" class="form-control" placeholder="Enter maximum login attempts" aria-label="Maximum Login Attempts" aria-describedby="maximumAttempts">
                                                 </div>
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                </div>
                            </form>    
                        </div>

                        <div id="Passwords" class="tabcontent">
                           
                            <form action="" method="post">
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Password Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </div>
                                </div>
                                
                                <div class="tab-content-details">

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
                                </div>
                            </form>
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

