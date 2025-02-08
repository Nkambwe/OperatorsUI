<%@page import="com.kram.operators.helpers.StringValidator"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%
    String role = session.getAttribute(AppConstants.USER_ROLE) != null ? (String)session.getAttribute(AppConstants.USER_ROLE) : "";
    if(StringValidator.isNullOrWhitespace(role)){
        role = "";
    }
%>
<div id="loading" class="loader" style="">
  <img src="${pageContext.request.contextPath}/assets/images/loader.gif" alt="loader"/>
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
                    <a id="menu_drivers_link" href="index.jsp" class="menu-item-link">
                        <span>  
                            <i class="mdi mdi-car-child-seat"></i>
                        </span> 
                        <p>Drivers</p> 
                    </a>
                    <ul class="menu-sub-menu">
                        <li class="menu-list-item">
                            <a id="menu_drivers_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-card-account-details"></i>
                                </span> 
                                <p>Registration</p> 
                            </a>
                        </li>
                        <li class="menu-list-item">
                            Vetted
                        </li>
                        <li class="menu-list-item">
                            Under Review
                        </li>
                        <li class="menu-list-item">
                            <a id="menu_blacklist_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-car-traction-control"></i>
                                </span> 
                                <p>Engaged</p> 
                            </a>  
                        </li>
                        <li class="menu-list-item">
                            <a id="menu_blacklist_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-car-2-plus"></i>
                                </span> 
                                <p>Open For Engagements</p> 
                            </a>  
                        </li>
                        <li class="menu-list-item">
                            <a id="menu_blacklist_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-card-bulleted-settings"></i>
                                </span> 
                                <p>Blacklisted</p> 
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a id="menu_clients_link" href="index.jsp" class="menu-item-link">
                        <span>  
                            <i class="mdi mdi-car-multiple"></i>
                        </span> 
                        <p>Clients</p> 
                    </a>
                    <ul class="menu-sub-menu">
                        <li class="menu-list-item">
                            <a id="menu_drivers_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-car-info"></i>
                                </span> 
                                <p>New Client</p> 
                            </a>
                        </li>
                        <li class="menu-list-item">
                            <a id="menu_drivers_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi  mdi-car-electric"></i>
                                </span> 
                                <p>Engagements</p> 
                            </a>

                        </li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a id="menu_members_link" href="index.jsp" class="menu-item-link">
                        <span>  
                            <i class="mdi mdi-account-tie"></i>
                        </span> 
                        <p>Business Members</p> 
                    </a>
                    <ul class="menu-sub-menu">
                        <li class="menu-list-item">
                            <a id="menu_members_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-account-tie-outline"></i>
                                </span> 
                                <p>New Member</p> 
                            </a>  
                        </li>
                        <li class="menu-list-item">
                            <a id="menu_members_link" href="index.jsp" class="menu-item-link">
                                <span>  
                                    <i class="mdi mdi-account-tie-voice"></i>
                                </span> 
                                <p>Member Referrals</p> 
                            </a>
                           
                        </li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a id="menu_access_link" href="index.jsp" class="menu-item-link">
                        <span>  
                            <i class="mdi mdi-arrange-bring-to-front"></i>
                        </span> 
                        <p>System Access</p> 
                    </a>
                    <ul class="menu-sub-menu">
                        <li class="menu-list-item">User Management</li>
                        <li class="menu-list-item">System Roles</li>
                        <li class="menu-list-item">System Permissions</li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a id="menu_settings_link" href="index.jsp" class="menu-item-link">
                        <span>  
                            <i class="mdi mdi-cogs"></i>
                        </span> 
                        <p>Settings</p> 
                    </a>
                    <ul class="menu-sub-menu">
                        <li class="menu-list-item">
                            <a id="menu_passwords_link" href="index.jsp" class="menu-item-link active" onclick="showLoading();">
                                <span>  
                                    <i class="mdi mdi-av-timer"></i>
                                </span> 
                                <p>Password Management</p> 
                            </a>
                        </li>
                        <li class="menu-list-item">
                            <a id="menu_dashboard_link" href="index.jsp" class="menu-item-link active" onclick="showLoading();">
                                <span>  
                                    <i class="mdi mdi-car-cog"></i>
                                </span> 
                                <p>Driver Settings</p> 
                            </a>
                        </li>
                        <li class="menu-list-item">Client Settings</li>
                        <li class="menu-list-item">Member Settings</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
