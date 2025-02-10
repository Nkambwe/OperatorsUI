<%@page import="com.kram.operators.helpers.StringValidator"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%
    String role = session.getAttribute(AppConstants.USER_ROLE) != null ? (String)session.getAttribute(AppConstants.USER_ROLE) : "";
    if(StringValidator.isNullOrWhitespace(role)){
        role = "";
    }
%>
<div id="loading" class="loader" style="">
  <img src="${pageContext.request.contextPath}/assets/images/loading2.gif" alt="loader"/>
</div>

<nav class="side-bar">
    <div class="side-bar-container">
        <a class="slide-button">
            <span><i class="mdi mdi-forwardburger"></i></span>
        </a>
        <span class="side-bar-label">Operators</span>
        <span class="app-logo">
            <img id="logo" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo"/>
        </span>
    </div>
</nav>

<nav class="nav-bar-slide">
    <div class="slide-container">
        <div class="slide-header">
            <span><%=role%></span>
        </div>
        <div class="slide-menu-container">
            <ul class="slide-menu">
                <li id="menu_dashboard" class="menu-item">
                    <a id="menu_dashboard_link" href="index.jsp" class="menu-item-link active" onclick="showLoading();">
                        <span>  
                            <i class="mdi mdi-chart-bubble"></i>
                        </span> 
                        <p>Dashboard</p> 
                    </a>
                </li>
                <li class="menu-item">
                    <a id="menu_drivers_link" href="drivers.jsp" class="menu-item-link" onclick="showLoading();">
                        <span>  
                            <i class="mdi mdi-car-child-seat"></i>
                        </span> 
                        <p>Drivers</p> 
                    </a>
                </li>
                
                <li class="menu-item">
                    <a id="menu_clients_link" href="employer.jsp" class="menu-item-link" onclick="showLoading();">
                        <span>  
                            <i class="mdi mdi-car-multiple"></i>
                        </span> 
                        <p>Employer</p> 
                    </a>

                </li>
                <li class="menu-item">
                    <a id="menu_members_link" href="members.jsp" class="menu-item-link" onclick="showLoading();">
                        <span>  
                            <i class="mdi mdi-account-tie"></i>
                        </span> 
                        <p>Business Members</p> 
                    </a>

                </li>
                <li class="menu-item">
                    <a id="menu_access_link" href="access.jsp" class="menu-item-link" onclick="showLoading();">
                        <span>  
                            <i class="mdi mdi-arrange-bring-to-front"></i>
                        </span> 
                        <p>System Access</p> 
                    </a>

                </li>
                <li class="menu-item">
                    <a id="menu_settings_link" href="settings.jsp" class="menu-item-link" onclick="showLoading();">
                        <span>  
                            <i class="mdi mdi-cogs"></i>
                        </span> 
                        <p>Settings</p> 
                    </a>

                </li>
            </ul>
        </div>
    </div>
</nav>
