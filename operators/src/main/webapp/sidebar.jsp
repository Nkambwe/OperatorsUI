<%-- 
    Document   : Sidenar Page
    Created on : Jan 31, 2025, 7:04:26 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.StringValidator"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = session.getAttribute(AppConstants.USER_ROLE) != null ? (String)session.getAttribute(AppConstants.USER_ROLE) : "";
    if(StringValidator.isNullOrWhitespace(role)){
        role = "";
    }
%>
        
<aside class="ops-side-bar-container">
    
    <div class="ops-side-bar-top">
        <div class="ops-side-bar-logo">
             <img id="img-logo" src="${pageContext.request.contextPath}/assets/images/green.png" alt="logo"/>
             <h2 class="display-1 ops-brand">DRIVE<span class="drive-tint">MATCH<span></h2>
        </div>
    </div>
             
    <div class="ops-side-bar">  
        <ul class="ops-side-bar-menu">
            <li id="menu_dashboard" class="ops-side-bar-menu-item">
                <a id="menu_dashboard_link" href="index.jsp" class="ops-side-bar-menu-item-link active-menu-item" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-view-grid"></i>
                    </span> 
                    <p>Dashboard</p> 
                </a>
            </li>
            <li class="ops-side-bar-menu-item">
                <a id="menu_drivers_link" href="drivers.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-car-child-seat"></i>
                    </span> 
                    <p>Drivers</p> 
                </a>
            </li>

            <li class="ops-side-bar-menu-item">
                <a id="menu_clients_link" href="employer.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-car-multiple"></i>
                    </span> 
                    <p>Employer</p> 
                </a>

            </li>
            <li class="ops-side-bar-menu-item">
                <a id="menu_members_link" href="members.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-account-tie"></i>
                    </span> 
                    <p>Members</p> 
                </a>

            </li>
            
            <li class="ops-side-bar-menu-item">
                <a id="menu_analytics_link" href="analytics.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-chart-line"></i>
                    </span> 
                    <p>Analytics</p> 
                </a>

            </li>

            <li class="menu-separator"></li>

            <li class="ops-side-bar-menu-item">
                <a id="menu_users_link" href="access_branches.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-source-branch-plus"></i>
                    </span> 
                    <p>Branches</p> 
                </a>

            </li>

            <li class="ops-side-bar-menu-item">
                <a id="menu_users_link" href="access_users.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-account-group"></i>
                    </span> 
                    <p>Users</p> 
                </a>

            </li>

            <li class="ops-side-bar-menu-item">
                <a id="menu_roles_link" href="access_roles.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-account-supervisor"></i>
                    </span> 
                     <p>Roles</p> 
                </a>

            </li>
            <li class="ops-side-bar-menu-item">
                <a id="menu_permissions_link" href="access_permissions.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-account-key"></i>
                    </span> 
                    <p>Permissions</p> 
                </a>

            </li>

            <li class="ops-side-bar-menu-item">
                <a id="menu_settings_link" href="settings.jsp" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-cogs"></i>
                    </span> 
                    <p>Settings</p> 
                </a>

            </li>
            
            
            <li class="ops-side-bar-menu-item">
                <a id="menu_logout_link" href="#" class="ops-side-bar-menu-item-link" onclick="showLoading();">
                    <span>  
                        <i class="mdi mdi-logout"></i>
                    </span> 
                    <p>Logout</p> 
                </a>

            </li>
        </ul>
    </div>
             
</aside>