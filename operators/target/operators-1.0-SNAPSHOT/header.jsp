<%-- 
    Document   : header
    Created on : Feb 9, 2025, 4:34:47 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.StringValidator"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String loggedin_user =  session.getAttribute(AppConstants.EMPLOYEE_NAME) != null ? (String)session.getAttribute(AppConstants.EMPLOYEE_NAME):"";
    String current_branch =  session.getAttribute(AppConstants.BRANCH_NAME) != null ? (String)session.getAttribute(AppConstants.BRANCH_NAME):"";
    String current_page = session.getAttribute(AppConstants.CURRENT_PAGE) != null ? (String)session.getAttribute(AppConstants.CURRENT_PAGE) : "";
    
    
    Object darkObj = session.getAttribute(AppConstants.ACTIVE_DARK);
    Object lightObj = session.getAttribute(AppConstants.ACTIVE_LIGHT);
    String active_dark = darkObj != null? (String)darkObj :"";
    String active_light = lightObj != null? (String)lightObj :"";
    if(lightObj.equals("") && darkObj.equals("")){
        active_light = "active-theme";
    }
        
%>
 <header class="main-content-header">
    <div class="ops-side-bar-expand">
        <span><i class="mdi mdi-menu"></i></span>
    </div>
    <div class="content-header-left">
        <% if(current_page.equals("INDEX_PAGE")){%>
        <span class="display-1 page-brand">DASHBOARD</span>
        <%} else {%>
            <span><%=current_page%></span>
        <%}%>
    </div>
    <div class="content-header-right">
        <%=loggedin_user%>
        <button id="btn-user" class="btn-user-settings">
            <span><i class="mdi mdi-account-cog"></i></span>
        </button>
        <div class="user-settings-slide">
            <div class="user-settings-slide-header">
                <span class="display-5 user-settings-brand">
                    Appearance
                </span>
                <button type="submit" class="btn-settings-close">
                    <span><i class="mdi mdi-close"></i></span>
                </button>
            </div>

            <div class="user-settings-slide-content">
                
                <div class="theme-buttons">
                    <span class="theme-selected">Light mode</span>
                    
                    <div class="theme-button-box">
                       
                        <div class="theme-button-container">
                            <button class="btn-light-theme <%=active_light%>"></button>
                            <span class="theme-name-light">Light</span>
                        </div>

                        <div class="theme-button-container">
                            <button class="btn-black-theme <%=active_dark%>"></button>
                            <span  class="theme-name-dark">Dark</span>
                        </div>
                    
                    </div>
                    
                </div>
                
                <div class="color-buttons">
                    
                    <div class="color-selected-container">
                        <span class="color-selected">Color</span>
                    </div>
                    
                    <div class="color-buttons-container">
                        <div class="theme-button-color">
                            <button class="btn-green-clr"></button>
                        </div>

                        <div class="theme-button-color">
                            <button class="btn-red-clr"></button>
                        </div>

                        <div class="theme-button-color">
                            <button class="btn-purple-clr"></button>
                        </div>

                        <div class="theme-button-color">
                            <button class="btn-yellow-clr"></button>
                        </div>

                        <div class="theme-button-color">
                            <button class="btn-aqua-clr"></button>
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>
</header>
