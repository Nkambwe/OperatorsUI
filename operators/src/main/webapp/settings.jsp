<%-- 
    Document   : settings
    Created on : Feb 9, 2025, 3:19:20 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.dtos.AppResponse"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
<%@page import="com.kram.operators.helpers.AttributeList"%>
<%@page import="com.kram.operators.dtos.Attribute"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kram.operators.controllers.SettingsController"%>
<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = null, alertClass = "alert-success", msg_type="Success";

    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }
    
    String ipAddress = ApplicationUtilities.getClientIP(request);
    SettingsController controller = new SettingsController(session,ipAddress);
    
    
    if (request.getMethod().equalsIgnoreCase("POST")) {
        List<String> checkboxNames = null;
        ArrayList<Attribute> attributes = null;
        String mtd  = request.getParameter("mtd");
        
        switch(mtd){
            case "driver-setting":
                checkboxNames = AttributeList.getDriverSettings() ;
                attributes = AttributeList.getAttributes(AppConstants.DRVATRIB);
            break;
            case "employ-setting":
                checkboxNames = AttributeList.getEmployerSettings() ;
                attributes = AttributeList.getAttributes(AppConstants.EMPATRIB);
            break;
            case "member-setting":
                checkboxNames = AttributeList.getMemberSettings() ;
                attributes = AttributeList.getAttributes(AppConstants.MEMATRIB);
            break;
            case "user-setting":
                checkboxNames = AttributeList.getUserSettings() ;
                attributes = AttributeList.getAttributes(AppConstants.USEATRIB);
            break;
            case "pwd-setting":
                checkboxNames = AttributeList.getPasswordSettings() ;
                attributes = AttributeList.getAttributes(AppConstants.PWDATRIB);
            break;
            default:
                //get from the database and use all check names
                //checkboxNames = AttributeList.getPasswordSettings() ;
                //attributes = AttributeList.getAttributes(AppConstants.DRVATRIB);
            break;
        }
        
        
        if(attributes != null && checkboxNames != null){
            for (String name : checkboxNames) {
                String paramValue = request.getParameter(name);

                // Get attribute object using proper stream syntax and Optional handling
                Optional<Attribute> atrObj = attributes.stream()
                    .filter(a -> a.getParameterName().equals(name))
                    .findFirst();

                // Update the value if attribute exists
                atrObj.ifPresent(attr -> {
                    attr.setParameterValue(paramValue != null && paramValue.equals("YES"));
                });
            }

            // Save updates
            AppResponse resp = controller.updateConfigurations(attributes);

            // Simplified response handling
            if (resp.getResponseStatus() && resp.getResponseCode() == 200) {
                msg = "Settings updated successfully";
                alertClass = "alert-success";
                msg_type = "Success";
            } else {
                msg = resp.getResponseMessage();
                alertClass = "alert-danger";
                msg_type = "Danger";
            }
        }
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
                            
                            <form id="driver-form" method="post" role="form" >
                                
                                <%=ApplicationUtilities.getSalt(request)%>
                                <input type="hidden" name="mtd" value="driver-setting"/>
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Drivers Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success" onclick="showLoading();">Update</button>
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
                                                      <input name="surnameNameRequired" class="form-check-input  driver-attribute" type="checkbox" value="YES" checked id="surnameNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="firstNameRequired">
                                                      Driver first name is required
                                                      <input name="firstNameRequired" class="form-check-input  driver-attribute" type="checkbox" value="YES" checked id="firstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="otherNameRequired">
                                                      Driver other name is required
                                                      <input name="otherNameRequired" class="form-check-input  driver-attribute" type="checkbox" value="NO" id="otherNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="dobRequired">
                                                      Driver date of birth is required
                                                      <input name="dobRequired" class="form-check-input  driver-attribute" type="checkbox" value="NO" id="dobRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequired">
                                                      Driver Identification is required
                                                      <input name="idRequired" class="form-check-input  driver-attribute" type="checkbox" value="YES" checked id="idRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequiredAtReqgistration">
                                                      Driver Identification is required at registration
                                                      <input name="idRequiredAtReqgistration" class="form-check-input  driver-attribute" type="checkbox" value="NO" id="idRequiredAtReqgistration"/>
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
                                                    <label class="form-check-label" for="homeDistrict">
                                                      Driver home district is required
                                                      <input name="homeDistrict" class="form-check-input  driver-attribute" type="checkbox" value="N" id="homeDistrict"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="residenceDistrict">
                                                      Driver residence district is required
                                                      <input name="residenceDistrict" class="form-check-input  driver-attribute" type="checkbox" value="Y" checked id="residenceDistrict"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="phoneNumber">
                                                      Phone number is required
                                                      <input class="form-check-input  driver-attribute" type="checkbox" value="Y" checked id="phoneNumber"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="emailAddress">
                                                      Driver email address is required
                                                      <input class="form-check-input  driver-attribute" type="checkbox" value="Y" checked id="emailAddress"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="socialMedia">
                                                      Social media contact is required
                                                      <input class="form-check-input  driver-attribute" type="checkbox" value="N" id="socialMedia"/>
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
                                                      <input name="academicInfo" class="form-check-input  driver-attribute" type="checkbox" value="Y" checked id="academicInfo"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="academicDocumentsRequired">
                                                      Copied of academic documents are required
                                                      <input name="academicDocumentsRequired" class="form-check-input  driver-attribute" type="checkbox" value="N" id="academicDocumentsRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="licienceRequired">
                                                      Driver's license certification is required
                                                      <input name="licienceRequired" class="form-check-input  driver-attribute" type="checkbox" value="Y" checked id="licienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="copyOfLicienceRequired">
                                                      Copied of driver's license certification is required
                                                      <input name="copyOfLicienceRequired" class="form-check-input  driver-attribute" type="checkbox" value="N" id="copyOfLicienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="refereesRequired">
                                                      Must provide referees at registration
                                                      <input name="refereesRequired" class="form-check-input  driver-attribute" type="checkbox" value="N" id="refereesRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="copyOfReferenceRequired">
                                                      Copied of reference are required
                                                      <input name="copyOfReferenceRequired" class="form-check-input  driver-attribute" type="checkbox" value="N" id="copyOfReferenceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="experience">
                                                      Require work experience
                                                      <input name="experience" class="form-check-input  driver-attribute" type="checkbox" value="N" id="experience"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="expireDays">Number of years of working experience required</span>
                                                    <input name="expireDays" type="number" class="form-control" placeholder="Enter number of reusable passwords" aria-label="Number of years experience" aria-describedby="yearsOfExperience">
                                                 </div>
                                            </div>
                                         </div>
                                        
                                    </div>
                                    
                               
                                </div>
                            </form>
                            
                         </div>

                        <div id="Employers" class="tabcontent">
                            
                            <form id="employ-form" method="post" role="form" >
                                
                                <%=ApplicationUtilities.getSalt(request)%>
                                <input type="hidden" name="mtd" value="employ-setting"/>
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Employee Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success" onclick="showLoading();">Update</button>
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
                            
                            <form id="member-form" method="post" role="form" >
                                
                                <%=ApplicationUtilities.getSalt(request)%>
                                <input type="hidden" name="mtd" value="member-setting"/>
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Member Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success" onclick="showLoading();">Update</button>
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
                            
                            <form id="user-form" method="post" role="form" >
                                
                                <%=ApplicationUtilities.getSalt(request)%>
                                <input type="hidden" name="mtd" value="user-setting"/>
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>User Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success" onclick="showLoading();">Update</button>
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
                           
                            <form id="password-form" method="post" role="form" >
                                
                                <%=ApplicationUtilities.getSalt(request)%>
                                <input type="hidden" name="mtd" value="pwd-setting"/>
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>Password Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success" onclick="showLoading();">Update</button>
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

