<%-- 
    Document   : settings
    Created on : Feb 9, 2025, 3:19:20 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.models.SettingsResponse"%>
<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.models.AppResponse"%>
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
    List<Attribute> genAttributes =  null, drvAttributes = null, empAttributes = null, memAttributes =  null, useAttributes = null, pwdAttributes = null;
    String surnameValue = "", surnameChecked = "", firstNameValue = "", firstNameChecked = "", otherNameValue = "", otherNameChecked = "", dobValue = "";
    String dobChecked = "", idRequiredValue = "", idRequiredChecked = "", idAtRegValue = "", idAtRegChecked = "", dHomeDistRegValue = "", dHomeDistChecked = "";
    String dresDistRegValue = "", dresDistChecked = "", dphoneValue = "", dphoneChecked = "", dsocialValue = "", dsocialChecked = "", dmarkDeletedValue = "";
    String dmarkDeletedChecked = "", dacademicValue = "", dacademicChecked = "", demailValue="", demailChecked="";
    String dacademicDocsValue = "", dacademicDocsChecked = "", dlicenseValue = "", dlicenseChecked = "", dlicenseCopyValue = "", dlicenseCopyChecked = "";
    String dreferValue = "", dreferChecked = "", dreferCopyValue = "", dreferCopyChecked = "", dworkexpValue = "", dworkexpChecked = "", dworkexpPeriodValue = "0";
    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }

    String ipAddress = ApplicationUtilities.getClientIP(request);
    SettingsController controller = new SettingsController(session,ipAddress);
    ApplicationLog.saveLog("Application Configurations", "SETTINGS");
    
    try {
        if (request.getMethod().equalsIgnoreCase("POST")) {
            List<String> checkboxNames = null;
            ArrayList<Attribute> attributes = null;
            String mtd  = request.getParameter("mtd");
            String settingType = "ALL";
            
            Attribute workingExpAtrr = null;
            switch(mtd){
                case "general-setting":
                    settingType = AppConstants.GENATRIB;
                    checkboxNames = AttributeList.getGeneralSettings();
                break;
                case "driver-setting":
                    settingType = AppConstants.DRVATRIB;
                    checkboxNames = AttributeList.getDriverSettings();
                    String workExperience =  request.getParameter("workingExperience"); 
                    workExperience = (workExperience =="" || workExperience == null) ? "0" : workExperience;
                    workingExpAtrr = new Attribute(); 
                    workingExpAtrr.setId(0);
                    workingExpAtrr.setIdentifier(settingType);
                    workingExpAtrr.setParameterName("workingExperience");
                    workingExpAtrr.setParameterValue(workExperience);
                break;
                case "employ-setting":
                    settingType = AppConstants.EMPATRIB;
                    checkboxNames = AttributeList.getEmployerSettings() ;
                break;
                case "member-setting":
                    settingType = AppConstants.MEMATRIB;
                    checkboxNames = AttributeList.getMemberSettings() ;
                break;
                case "user-setting":
                    settingType = AppConstants.USEATRIB;
                    checkboxNames = AttributeList.getUserSettings() ;
                break;
                case "pwd-setting":
                    settingType = AppConstants.PWDATRIB;
                    checkboxNames = AttributeList.getPasswordSettings() ;
                break;
                default:
                    //get from the database and use all check names
                    //checkboxNames = AttributeList.getPasswordSettings() ;
                break;
            }

            ApplicationLog.saveLog("Processing settings ::", "SETTINGS");
            attributes = AttributeList.getAttributes(settingType);
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
                ApplicationLog.saveLog(String.format("Processing (%d)settings for %s", attributes.size(), settingType), "SETTINGS");
                
                attributes.add(workingExpAtrr);
                AppResponse resp = controller.updateConfigurations(attributes.toArray(new Attribute[0]), settingType);
                if (resp.getResponseCode() == 200) {
                    msg = String.format("%s:: %s",resp.getResponseMessage(), resp.getResponseDescription());
                    alertClass = "alert-success";
                    msg_type = "Success";
                    ApplicationLog.saveLog(String.format("%d Settings saved successfullys", attributes.size()), "SETTINGS");
                } else {
                    msg = "Could not save settings. An error occurred :: " + resp.getResponseMessage();
                    alertClass = "alert-danger";
                    msg_type = "Error !";
                    ApplicationLog.saveLog(msg, "SETTINGS");
                }
            }
        }
    } catch(Exception ex){
        alertClass = "alert-danger";
        msg_type = "System Error! ";
        msg = ex.getMessage();
        ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "SETTINGS");
    }
    
    //get all settings
    SettingsResponse sResp = controller.getAllAttributes();
    List<Attribute> zattributes = new ArrayList<>();
    if (sResp.getResponseCode() == 200) {
        zattributes = sResp.getItems();
        if(zattributes != null){
            ApplicationLog.saveLog(String.format("%d settings retrieved", zattributes.size()), "SETTINGS");
            //group settings by idetifiers
            Map<String, List<Attribute>> groupedAttributes = ApplicationUtilities.groupAttributes(zattributes);
            //..access each group separately
            genAttributes = groupedAttributes.get("GENATRIB");
            drvAttributes = groupedAttributes.get("DRVATRIB");
            
            ApplicationLog.saveLog(String.format("%d Driver settings", drvAttributes.size()), "SETTINGS");
            if(drvAttributes != null && drvAttributes.size() > 0){
            
                for(Attribute a : drvAttributes){
                    if ("surnameNameRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        surnameValue = boolValue ? "YES" : "NO";
                        surnameChecked = boolValue ? "checked" : "";
                    }

                    if ("firstNameRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        firstNameValue = boolValue ? "YES" : "NO";
                        firstNameChecked = boolValue ? "checked" : "";
                    }

                    if ("otherNameRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        otherNameValue = boolValue ? "YES" : "NO";
                        otherNameChecked = boolValue ? "checked" : "";
                    }

                    if ("dobRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dobValue = boolValue ? "YES" : "NO";
                        dobChecked = boolValue ? "checked" : "";
                    }

                    if ("idRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        idRequiredValue = boolValue ? "YES" : "NO";
                        idRequiredChecked = boolValue ? "checked" : "";
                    }

                    if ("idRequiredAtReqgistration".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        idAtRegValue = boolValue ? "YES" : "NO";
                        idAtRegChecked = boolValue ? "checked" : "";
                    }

                    if ("homeDistrict".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dHomeDistRegValue = boolValue ? "YES" : "NO";
                        dHomeDistChecked = boolValue ? "checked" : "";
                    }

                    if ("residenceDistrict".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dresDistRegValue = boolValue ? "YES" : "NO";
                        dresDistChecked = boolValue ? "checked" : "";
                    }

                    if ("phoneNumber".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dphoneValue = boolValue ? "YES" : "NO";
                        dphoneChecked = boolValue ? "checked" : "";
                    }

                    if ("emailAddress".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        demailValue = boolValue ? "YES" : "NO";
                        demailChecked = boolValue ? "checked" : "";
                    }

                    if ("socialMedia".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dsocialValue = boolValue ? "YES" : "NO";
                        dsocialChecked = boolValue ? "checked" : "";
                    }

                    if ("markDriverAsDeleted".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dmarkDeletedValue = boolValue ? "YES" : "NO";
                        dmarkDeletedChecked = boolValue ? "checked" : "";
                    }

                    if ("academicInfo".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dacademicValue = boolValue ? "YES" : "NO";
                        dacademicChecked = boolValue ? "checked" : "";
                    }

                    if ("academicDocumentsRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dacademicDocsValue = boolValue ? "YES" : "NO";
                        dacademicDocsChecked = boolValue ? "checked" : "";
                    }

                    if ("licienceRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dlicenseValue = boolValue ? "YES" : "NO";
                        dlicenseChecked = boolValue ? "checked" : "";
                    }

                    if ("copyOfLicienceRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dlicenseCopyValue = boolValue ? "YES" : "NO";
                        dlicenseCopyChecked = boolValue ? "checked" : "";
                    }

                    if ("refereesRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dreferValue = boolValue ? "YES" : "NO";
                        dreferChecked = boolValue ? "checked" : "";
                    }

                    if ("copyOfReferenceRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dreferCopyValue = boolValue ? "YES" : "NO";
                        dreferCopyChecked = boolValue ? "checked" : "";
                    }

                    if ("workExperienceRequired".equals(a.getParameterName())) {
                        Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                        dworkexpValue = boolValue ? "YES" : "NO";
                        dworkexpChecked = boolValue ? "checked" : "";
                    }

                    if ("workingExperience".equals(a.getParameterName())) {
                        dworkexpPeriodValue = String.format("%d", Integer.valueOf(a.getParameterValue().toString()));
                    }
                }
            }
            
            empAttributes = groupedAttributes.get("EMPATRIB");
            memAttributes = groupedAttributes.get("MEMATRIB");
            useAttributes = groupedAttributes.get("USEATRIB");
            pwdAttributes = groupedAttributes.get("PWDATRIB");
        }
    } else {
        ApplicationLog.saveLog(String.format("Error! %s - %s", 
            sResp.getResponseMessage(), 
            sResp.getResponseMessage()), "SETTINGS");
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
                            <button class="tablinks tab-active" id="generalTab" onclick="openTab(event, 'general')">
                                <span><i class="mdi mdi-cogs"></i></span>
                                <span>General</span>
                            </button>
                            <button class="tablinks"  id="driverTab" onclick="openTab(event, 'Drivers')">
                                <span><i class="mdi mdi-car-cruise-control"></i></span>
                                <span>Drivers</span>
                            </button>
                            <button class="tablinks" id="employerTab" onclick="openTab(event, 'Employers')">
                               <span><i class="mdi mdi-car-cog"></i></span>
                               <span>Employers</span>
                            </button>
                            <button class="tablinks" id="membersTab" onclick="openTab(event, 'Members')">
                                <span><i class="mdi mdi-account-tie-outline"></i></span>
                               <span>Members</span>
                            </button>
                            
                            <button class="tablinks" id="usersTab" onclick="openTab(event, 'Users')">
                                <span><i class="mdi mdi-account-cog"></i></span>
                                <span>Users</span>
                            </button>
                            
                            <button class="tablinks" id="passwordTab" onclick="openTab(event, 'Passwords')"> 
                                <span><i class="mdi mdi-lock-reset"></i></span>
                                <span>Password</span>
                            </button>
                            
                        </div>

                        <div id="general" class="tabcontent">
                            
                            <form id="general-form" method="post" role="form" >
                                <input type="hidden" id="salt" name="salt" value="<%=ApplicationUtilities.getSalt(request)%>">
                                <input type="hidden" name="mtd" value="general-setting"/>
                                
                                <div class="tab-content-header">
                                    <div class="tab-content-header-banner">
                                        <h3>General Settings</h3>
                                    </div>
                                    <div class="tab-content-header-button">
                                        <button type="submit" class="btn btn-success" onclick="showLoading();">Update</button>
                                    </div>
                                </div>
                                
                                <div class="tab-content-details">
                                    
                                    <div class="row p-0">
                                        <% if(genAttributes != null && genAttributes.size() > 0){
                                            String includeDeletedValue = "";
                                            String includeDeletedChecked = "";
                                            for(Attribute a : genAttributes){
                                                if ("includeDeletedObjects".equals(a.getParameterName())) {
                                                    Boolean boolValue = Boolean.valueOf(a.getParameterValue().toString());
                                                    includeDeletedValue = boolValue ? "YES" : "NO";
                                                    includeDeletedChecked = boolValue ? "checked" : "";
                                                }
                                        %>
                                            
                                            <div class="col-md-6 p-0">
                                                
                                                <div class="row-cols-1 settings-row">
                                                    <div class="form-check form-switch">
                                                        <input name="includeDeletedObjects" class="form-check-input general-attribute" type="checkbox"
                                                            id="includeDeletedObjects"
                                                            value="<%=includeDeletedValue%>" 
                                                            <%= includeDeletedChecked.equals("checked") ? "checked" : "" %> />
                                                        <label class="form-check-label" for="includeDeletedObjects">
                                                            Include records marked as deleted when searching for records
                                                        </label>
                                                    </div>
                                                </div>
                                                
                                            </div>

                                            <div class="col-md-6 p-0"></div>
                                            
                                        <%} } else {%>
                                        
                                            <div class="col-md-6 p-0">
                                                
                                                <div class="row-cols-1 settings-row">
                                                    <div class="form-check form-switch">
                                                        <label class="form-check-label" for="surnameNameRequired">
                                                          Include records marked as deleted when searching for records
                                                          <input name="includeDeletedObjects" class="form-check-input" type="checkbox" value="NO" id="surnameNameRequired"/>
                                                        </label>
                                                    </div>
                                                </div>
                                                
                                            </div>

                                            <div class="col-md-6 p-0"></div>
                                        
                                        <% } %>
                                        
                                    </div>
                                    
                                </div>
                                
                            </form>
                            
                        </div>
                        
                        <div id="Drivers" class="tabcontent">
                            
                            <form id="driver-form" method="post" role="form" >
                                 <input type="hidden" id="salt" name="salt" value="<%=ApplicationUtilities.getSalt(request)%>">
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
                                                      <input name="surnameNameRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=surnameValue%>"
                                                             <%= surnameChecked.equals("checked") ? "checked" : "" %> 
                                                             id="surnameNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="firstNameRequired">
                                                      Driver first name is required
                                                      <input name="firstNameRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=firstNameValue%>"
                                                             <%=firstNameChecked.equals("checked") ? "checked" : "" %> 
                                                             id="firstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="otherNameRequired">
                                                      Driver other name is required
                                                      <input name="otherNameRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=otherNameValue%>"
                                                             <%=otherNameChecked.equals("checked") ? "checked" : "" %> 
                                                             id="otherNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="dobRequired">
                                                      Driver date of birth is required
                                                      <input name="dobRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=dobValue%>"
                                                             <%=dobChecked.equals("checked") ? "checked" : "" %> 
                                                             id="dobRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequired">
                                                      Driver Identification is required
                                                      <input name="idRequired" class="form-check-input  driver-attribute" type="checkbox"
                                                            value="<%=idRequiredValue%>"
                                                            <%=idRequiredChecked.equals("checked") ? "checked" : "" %> 
                                                            id="idRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="idRequiredAtReqgistration">
                                                      Driver Identification is required at registration
                                                      <input name="idRequiredAtReqgistration" class="form-check-input  driver-attribute" type="checkbox" 
                                                            value="<%=idAtRegValue%>"
                                                            <%=idAtRegChecked.equals("checked") ? "checked" : "" %> 
                                                             id="idRequiredAtReqgistration"/>
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
                                                      <input name="homeDistrict" class="form-check-input  driver-attribute" type="checkbox"
                                                             value="<%=dHomeDistRegValue%>"
                                                             <%=dHomeDistChecked.equals("checked") ? "checked" : "" %> 
                                                             id="homeDistrict"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="residenceDistrict">
                                                      Driver residence district is required
                                                      <input name="residenceDistrict" class="form-check-input  driver-attribute" type="checkbox"
                                                             value="<%=dresDistRegValue%>"
                                                             <%=dresDistChecked.equals("checked") ? "checked" : "" %> 
                                                             id="residenceDistrict"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="phoneNumber">
                                                      Phone number is required
                                                      <input class="form-check-input  driver-attribute" type="checkbox" name="phoneNumber"
                                                             value="<%=dphoneValue%>"
                                                             <%=dphoneChecked.equals("checked") ? "checked" : "" %>
                                                             id="phoneNumber"/>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="emailAddress">
                                                      Driver email address is required
                                                      <input class="form-check-input  driver-attribute" type="checkbox" name="emailAddress"
                                                             value="<%=demailValue%>"
                                                             <%=demailChecked.equals("checked") ? "checked" : "" %>
                                                             id="emailAddress"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="socialMedia">
                                                      Social media contact is required
                                                      <input class="form-check-input  driver-attribute" type="checkbox" name="socialMedia"
                                                             value="<%=dsocialValue%>"
                                                             <%=dsocialChecked.equals("checked") ? "checked" : "" %>
                                                             id="socialMedia"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="markDriverAsDeleted">
                                                      Only Mark Drivers as deleted on deletion (Driver record will not be deleted permanently)
                                                      <input name="markDriverAsDeleted" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=dmarkDeletedValue%>"
                                                             <%=dmarkDeletedChecked.equals("checked") ? "checked" : "" %>
                                                             id="markDriverAsDeleted"/>
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
                                                      <input name="academicInfo" class="form-check-input  driver-attribute" type="checkbox" 
                                                              value="<%=dacademicValue%>"
                                                             <%=dacademicChecked.equals("checked") ? "checked" : "" %>
                                                             id="academicInfo"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="academicDocumentsRequired">
                                                      Copied of academic documents are required
                                                      <input name="academicDocumentsRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                              value="<%=dacademicDocsValue%>"
                                                             <%=dacademicDocsChecked.equals("checked") ? "checked" : "" %> 
                                                             id="academicDocumentsRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="licienceRequired">
                                                      Driver's license certification is required
                                                      <input name="licienceRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=dlicenseValue%>"
                                                             <%=dlicenseChecked.equals("checked") ? "checked" : "" %> 
                                                             id="licienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="copyOfLicienceRequired">
                                                      Copied of driver's license certification is required
                                                      <input name="copyOfLicienceRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                            value="<%=dlicenseCopyValue%>"
                                                             <%=dlicenseCopyChecked.equals("checked") ? "checked" : "" %> 
                                                             id="copyOfLicienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="refereesRequired">
                                                      Must provide referees at registration
                                                      <input name="refereesRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=dreferValue%>"
                                                             <%=dreferChecked.equals("checked") ? "checked" : "" %> 
                                                             id="refereesRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="copyOfReferenceRequired">
                                                      Copied of reference are required
                                                      <input name="copyOfReferenceRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=dreferCopyValue%>"
                                                             <%=dreferCopyChecked.equals("checked") ? "checked" : "" %> 
                                                             id="copyOfReferenceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="workExperienceRequired">
                                                      Require work experience
                                                      <input name="workExperienceRequired" class="form-check-input  driver-attribute" type="checkbox" 
                                                             value="<%=dworkexpValue%>"
                                                             <%=dworkexpChecked.equals("checked") ? "checked" : "" %> 
                                                             id="workExperienceRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="workingExperience">Number of years of working experience required</span>
                                                    <input id="workingExperience" name="workingExperience" type="number" class="form-control" 
                                                           placeholder="Enter number of reusable passwords" aria-label="Number of years experience" 
                                                           value="<%=dworkexpPeriodValue%>"
                                                           aria-describedby="workingExperience">
                                                 </div>
                                            </div>
                                         </div>
                                        
                                    </div>
                                                           
                                </div>
                                
                            </form>
                            
                         </div>

                        <div id="Employers" class="tabcontent">
                            
                            <form id="employ-form" method="post" role="form" >
                                 <input type="hidden" id="salt" name="salt" value="<%=ApplicationUtilities.getSalt(request)%>">
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
                                    <%
                                        if(genAttributes != null && genAttributes.size() > 0){

                                        } else {

                                        }
                                    %>
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
                                                      <input name="companyNameRequired" class="form-check-input" type="checkbox" value="YES" checked id="companyNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="companyAddressRequired">
                                                      Company's physical address is required
                                                      <input name="companyAddressRequired" class="form-check-input" type="checkbox" value="YES" checked id="companyAddressRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonRequired">
                                                      Contact's Name is required
                                                      <input name="contactPersonRequired" class="form-check-input" type="checkbox" value="YES" checked id="contactPersonRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonNumberRequired">
                                                      Contact Number is required
                                                      <input name="contactPersonNumberRequired" class="form-check-input" type="checkbox" value="N" id="contactPersonNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonIdRequired">
                                                      Contact National Id is required
                                                      <input class="form-check-input" type="checkbox" value="YES" checked id="contactPersonIdRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="contactPersonIdCopyRequired">
                                                      A copy of contact's National Id is required
                                                      <input name="contactPersonIdCopyRequired" class="form-check-input" type="checkbox" value="NO" id="contactPersonIdCopyRequired"/>
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
                                                      <input name="employerNameRequired" class="form-check-input" type="checkbox" value="YES" checked id="employerNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerAddressRequired">
                                                      Employer's physical address is required
                                                      <input name="employerAddressRequired" class="form-check-input" type="checkbox" value="YES" checked id="employerAddressRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerContactNumberRequired">
                                                      Employer's contact number is required
                                                      <input name="employerContactNumberRequired" class="form-check-input" type="checkbox" value="YES" checked id="employerContactNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerIdRequired">
                                                      Employer's National Id is required
                                                      <input name="employerIdRequired" class="form-check-input" type="checkbox" value="YES" checked id="employerIdRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerIdCopyRequired">
                                                      A copy employer's National Id is required
                                                      <input nam="employerIdCopyRequired" class="form-check-input" type="checkbox" value="NO" id="employerIdCopyRequired"/>
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
                                                      <input name="employerDistrictRequired" class="form-check-input" type="checkbox" value="YES" checked id="employerDistrictRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerEmailRequired">
                                                      Employer email address is required
                                                      <input name="employerEmailRequired" class="form-check-input" type="checkbox" value="YES" checked  id="employerEmailRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="employerAlternativeNumberRequired">
                                                      Alternative Contact Number is required
                                                      <input name="employerAlternativeNumberRequired" class="form-check-input" type="checkbox" value="YES" checked id="employerAlternativeNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                             
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="markEmployerAsDeleted">
                                                      Only Mark Employers as deleted on deletion (Employer record will not be deleted permanently)
                                                      <input name="markEmployerAsDeleted" class="form-check-input" type="checkbox" value="NO" id="markEmployerAsDeleted"/>
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
                                 <input type="hidden" id="salt" name="salt" value="<%=ApplicationUtilities.getSalt(request)%>">
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
                                    <%
                                        if(genAttributes != null && genAttributes.size() > 0){

                                        } else {

                                        }
                                    %>
                                    
                                    <div class="section-lable">
                                        <span>General Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                           
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberFirstNameRequired">
                                                      member first name is required
                                                      <input name="memberFirstNameRequired" class="form-check-input" type="checkbox" value="YES" checked id="memberFirstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberAddressRequired">
                                                      Member's physical address is required
                                                      <input name="memberAddressRequired" class="form-check-input" type="checkbox" value="YES" checked id="memberAddressRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberIdRequired">
                                                      Member's National Id is required
                                                      <input name="memberIdRequired" class="form-check-input" type="checkbox" value="YES" id="memberIdRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberSurameRequired">
                                                      member surname name is required
                                                      <input name="memberSurameRequired" class="form-check-input" type="checkbox" value="YES" checked id="memberSurameRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberContactRequired">
                                                      Member's contact number is required
                                                      <input name="memberContactRequired" class="form-check-input" type="checkbox" value="YES" checked id="memberContactRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberIdCopyRequired">
                                                      A copy of member's National Id is required
                                                      <input name="memberIdCopyRequired" class="form-check-input" type="checkbox" value="YES" id="memberIdCopyRequired"/>
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
                                                      <input name="memberDistrictRequired" class="form-check-input" type="checkbox" value="YES" checked id="memberDistrictRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberEmailRequired">
                                                      Member email address is required
                                                      <input name="memberEmailRequired" class="form-check-input" type="checkbox" value="YES" checked  id="memberEmailRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="memberAlternativeNumberRequired">
                                                      Member alternative contact number is required
                                                      <input name="memberAlternativeNumberRequired" class="form-check-input" type="checkbox" value="YES" checked id="memberAlternativeNumberRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                             
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="markMemberAsDeleted">
                                                      Only mark Member as deleted on deletion (Member record will not be deleted permanently)
                                                      <input name="markMemberAsDeleted" class="form-check-input" type="checkbox" value="YES" checked id="markMemberAsDeleted"/>
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
                                 <input type="hidden" id="salt" name="salt" value="<%=ApplicationUtilities.getSalt(request)%>">
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
                                    
                                    <%
                                        if(genAttributes != null && genAttributes.size() > 0){

                                        } else {

                                        }
                                    %>
                                        
                                    <div class="section-lable">
                                        <span>General Info</span>
                                    </div>
                                    
                                    <div class="row p-0">
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userFirstNameRequired">
                                                      User first name is required
                                                      <input name="userFirstNameRequired" class="form-check-input" type="checkbox" value="YES" checked id="userFirstNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userLastNameRequired">
                                                      User last name is required
                                                      <input name="userLastNameRequired" class="form-check-input" type="checkbox" value="YES" checked id="userLastNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userMiddleNameRequired">
                                                      User middle name is required
                                                      <input name="userMiddleNameRequired" class="form-check-input" type="checkbox" value="YES" checked id="userMiddleNameRequired"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="uniqueUsername">
                                                      Username must be unique
                                                      <input name="uniqueUsername" class="form-check-input" type="checkbox" value="YES" checked id="uniqueUsername"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="col-md-6 p-0">
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="userEmailRequired">
                                                      User must provide an email address
                                                      <input name="userEmailRequired" class="form-check-input" type="checkbox" value="YES" checked id="userEmailRequired"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="uniqueUserEmail">
                                                      User must provide a unique email address
                                                      <input name="uniqueUserEmail" class="form-check-input" type="checkbox" value="YES"  checked id="uniqueUserEmail"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="verifyUsers">
                                                      Users must be verified
                                                      <input namme="verifyUsers" class="form-check-input" type="checkbox" value="YES"  checked id="verifyUsers"/>
                                                    </label>
                                                </div>
                                            </div>
                                            
                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="cannotVerifySame">
                                                      Users can't be verified by user who created them
                                                      <input name="cannotVerifySame" class="form-check-input" type="checkbox" value="YES"  checked id="cannotVerifySame"/>
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
                                                      <input name="markUserAsDeleted" class="form-check-input" type="checkbox" value="YES" checked id="markUserAsDeleted"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="form-check form-switch">
                                                    <label class="form-check-label" for="lockUserAccount">
                                                      Lock user account after a specified number of attempted logins
                                                      <input name="lockUserAccount" class="form-check-input" type="checkbox" value="YES" checked id="lockUserAccount"/>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row-cols-1 settings-row">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="expireDays">Maximum login attempts</span>
                                                    <input name="maximumAttempts" type="number" class="form-control" placeholder="Enter maximum login attempts" aria-label="Maximum Login Attempts" aria-describedby="maximumAttempts">
                                                 </div>
                                            </div>
                                            
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                                
                            </form>    
                            
                        </div>

                        <div id="Passwords" class="tabcontent">
                           
                            <form id="password-form" method="post" role="form" >
                                 <input type="hidden" id="salt" name="salt" value="<%=ApplicationUtilities.getSalt(request)%>">
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
                                    
                                    <% if(pwdAttributes != null && pwdAttributes.size() > 0){%>
                                    
                                    <%} else {%>

                                    <% } %>
                                        
                                    <div class="row-cols-1 settings-row">
                                        <div class="form-check form-switch">
                                            <label class="form-check-label" for="expirePasswords">
                                              Expire user passwords after a specified period
                                              <input name="expirePasswords" class="form-check-input" type="checkbox" value="NO" id="expirePasswords"/>
                                            </label>
                                        </div>
                                    </div>
                                    
                                    <div class="row-cols-1 settings-row">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="expireDays">Number of days it takes to expire a password</span>
                                            <input name="expireDays" type="number" class="form-control" placeholder="Enter Days" aria-label="Password expire days" aria-describedby="expireDays">
                                         </div>
                                    </div>

                                    <div class="row-cols-1 settings-row">
                                        <div class="form-check form-switch">
                                            <label class="form-check-label" for="reusePasswords">
                                              Allow users to reuse old passwords after a specified number of password
                                              <input name="reusePasswords" class="form-check-input" type="checkbox" value="NO" id="reusePasswords"/>
                                            </label>
                                        </div>
                                    </div>
                            
                                    <div class="row-cols-1 settings-row">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="expireDays">Number of passwords user must have before start reusing passwords</span>
                                            <input name="reusablePasswords" type="number" class="form-control" placeholder="Enter number of reusable passwords" aria-label="Number of reusable passwords" aria-describedby="reusablePasswords">
                                         </div>
                                    </div>
                                    
                                    <div class="row-cols-1 settings-row">
                                        <div class="form-check form-switch">
                                            <label class="form-check-label" for="strongPasswords">
                                              Use strong passwords(User password should contain a combination of upper and lower case letters, numbers and special characters)
                                              <input name="strongPasswords" class="form-check-input" type="checkbox" value="NO" id="strongPasswords"/>
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

