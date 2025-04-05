<%-- 
    Document   : header
    Created on : Feb 9, 2025, 4:34:47 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="java.util.List"%>
<%@page import="com.kram.operators.helpers.StringValidator"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String current_branch =  session.getAttribute(AppConstants.BRANCH_NAME) != null ? (String)session.getAttribute(AppConstants.BRANCH_NAME):"";
    String current_page = session.getAttribute(AppConstants.CURRENT_PAGE) != null ? (String)session.getAttribute(AppConstants.CURRENT_PAGE) : "";
    
    
    Object themeObj = session.getAttribute(AppConstants.ACTIVE_THEME);
    String themeSkin = themeObj != null? (String)themeObj :"";
    String active_dark = "", active_light = "";
    if(themeSkin.equals("dark")){
        active_dark = "active-theme";
        active_light = "";
    } else {
        active_light = "active-theme";
        active_dark = "";
    }
    
    String active_green = "", active_red = "", active_aqua = "", active_purple = "", active_yellow = "";
    Object colorObj = session.getAttribute(AppConstants.ACTIVE_COLOR);
    String color = colorObj != null? (String)colorObj :"";
    List<String> themeColors = ApplicationUtilities.getThemecolor(color);
    active_red = themeColors.get(0);
    active_yellow = themeColors.get(1);
    active_purple = themeColors.get(2);
    active_aqua = themeColors.get(3);
    active_green = themeColors.get(4);
    
    
    Object objname = session.getAttribute(AppConstants.KEY_USERNAME);
    String initials = "";
    String strname = "";
    if(objname != null){
        strname = objname.toString();
        initials = strname.substring(0, 2);
    }
    
        
%>
 <header class="main-content-header">
     
    <button type="button" class="ops-side-bar-expand">
        <span><i class="mdi mdi-menu"></i></span>
    </button>
     
    <div class="content-header-left">
        <% if(current_page.equals("ANALYTICS_PAGE")){%>
        
            <header class="content-page-header">

                <nav class="content-page-parent-header">

                    <span class="content-page-brand">ANALYTICS</span>

                    <ul class="content-page-header-menu">

                        <li class="page-header-menu-item">
                            <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="analytics_page_01.jsp">
                                <span>
                                    <i class="mdi mdi-account-tie-outline"></i>
                               </span>
                               <span>PERFORMANCE</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="analytics_page_02.jsp">
                                <span>
                                    <i class="mdi mdi-account-tie-voice"></i>
                                </span>
                                <span>FAILS</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-d4" class="nav-item-button page-menu-button" data-partial="analytics_page_03.jsp">
                               
                                <span>
                                    <i class="mdi mdi-account-tie-voice-off"></i>
                               </span>
                               <span>DELAYS</span>
                               
                            </button>
                        </li>

                   </ul>

                </nav>

            </header>
        
        <% } else if(current_page.equals("SETTINGS_PAGE")){%>
        
            <span class="display-1 page-brand">SETTINGS</span>
        
        <% } else if(current_page.equals("DRIVERS_PAGE")){%>

            <header class="content-page-header">

                <nav class="content-page-parent-header">

                    <span class="content-page-brand">DRIVERS</span>

                    <ul class="content-page-header-menu">

                        <li class="page-header-menu-item">
                            <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="driver_page_01.jsp">
                                <span>
                                      <i class="mdi mdi-plus"></i>
                                </span>
                                <span>NEW DRIVER</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="driver_page_02.jsp">
                                <span>
                                    <i class="mdi mdi-glasses"></i>
                                </span>
                                <span>UNDER REVIEW</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-d4" class="nav-item-button page-menu-button" data-partial="driver_page_04.jsp">
                                <span>
                                    <i class="mdi mdi-car-key"></i>
                                </span>
                                <span>CONTRACT DRIVER</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-d3" class="nav-item-button page-menu-button" data-partial="driver_page_03.jsp">
                                <span>
                                     <i class="mdi mdi-car-traction-control"></i>
                                </span>
                                <span>ENGAGEMENTS</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button  id="btn-page-d5" class="nav-item-button page-menu-button" data-partial="driver_page_05.jsp">
                                <span>
                                    <i class="mdi mdi-card-bulleted-settings"></i>
                                </span>
                                <span>BLACKLISTED</span>
                            </button>
                        </li>
                   </ul>

                </nav>
            </header>

        <% } else if(current_page.equals("EMPLOYERS_PAGE")){%>
        
            <header class="content-page-header">

                <nav class="content-page-parent-header">

                    <span class="content-page-brand">EMPLOYERS</span>

                    <ul class="content-page-header-menu">

                        <li class="page-header-menu-item">
                            <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="employer_page_01.jsp">
                                <span>
                                      <i class="mdi mdi-plus"></i>
                                </span>
                                <span>NEW EMPLOYER</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="employer_page_02.jsp">
                                <span>
                                     <i class="mdi  mdi-car-electric"></i>
                                </span>
                                <span>ENGAGEMENTS</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-d4" class="nav-item-button page-menu-button" data-partial="employer_page_03.jsp">
                                <span>
                                    <i class="mdi mdi-car-off"></i>
                                </span>
                                <span>CANCELLED CONTRACTS</span>
                            </button>
                        </li>

                   </ul>

                </nav>

            </header>
        
        <% } else if(current_page.equals("MEMBERS_PAGE")){%>
        
            <header class="content-page-header">

                <nav class="content-page-parent-header">

                    <span class="content-page-brand">MEMBERS</span>

                    <ul class="content-page-header-menu">

                        <li class="page-header-menu-item">
                            <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="members_page_01.jsp">
                                <span>
                                    <i class="mdi mdi-plus"></i>
                                </span>
                                <span>NEW MEMBER</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="members_page_03.jsp">
                                <span>
                                    <i class="mdi mdi-account-tie-voice"></i>
                                </span>
                                <span>REFERRALS</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-d4" class="nav-item-button page-menu-button" data-partial="customers_page_03.jsp">
                                <span>
                                    <i class="mdi mdi-account-tie-voice-off"></i>
                               </span>
                               <span>CANCELLED</span>
                            </button>
                        </li>

                   </ul>

                </nav>

            </header>
        
        <% } else if(current_page.equals("BRANCHES_PAGE")){%>
        
            <header class="content-page-header">

                <nav class="content-page-parent-header">

                    <span class="content-page-brand">BRANCHES</span>

                    <ul class="content-page-header-menu">

                        <li class="page-header-menu-item">
                            <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="members_page_01.jsp">
                                <span>
                                    <i class="mdi mdi-plus"></i>
                                </span>
                                <span>NEW BRANCH</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="members_page_03.jsp">
                                <span>
                                    <i class="mdi mdi-account-tie-voice"></i>
                                </span>
                                <span>MEMBERS</span>
                            </button>
                        </li>

                   </ul>

                </nav>

            </header>
        
        <% } else if(current_page.equals("USERS_PAGE")){%>
            
            <header class="content-page-header">

                <nav class="content-page-parent-header">

                    <span class="content-page-brand">USERS</span>

                    <ul class="content-page-header-menu">

                        <li class="page-header-menu-item">
                            <button id="btn-page-do1" class="nav-item-button page-menu-button" data-partial="driver_page_01.jsp">
                                <span>
                                    <i class="mdi mdi-account-plus"></i>
                                </span>
                                <span>NEW USER</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-do2" class="nav-item-button page-menu-button" data-partial="driver_page_02.jsp">
                                <span>
                                    <i class="mdi mdi-account-network"></i>
                                </span>
                                <span>ROLES</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button id="btn-page-d4" class="nav-item-button page-menu-button" data-partial="driver_page_04.jsp">
                                <span>
                                    <i class="mdi mdi-account-key"></i>
                                </span>
                                <span>PERMISSIONS</span>
                            </button>
                        </li>

                        <li class="page-header-menu-item">
                            <button  id="btn-page-d5" class="nav-item-button page-menu-button" data-partial="driver_page_05.jsp">
                                <span>
                                    <i class="mdi mdi-account-clock"></i>
                                </span>
                                <span>HISTORY</span>
                            </button>
                        </li>
                   </ul>

                </nav>
            </header>
        <% } else if(current_page.equals("ROLES_PAGE")){%>
            <span class="display-1 page-brand">SYSTEM ROLES</span>
        <%} else {%>
        
           <span class="display-1 page-brand">DASHBOARD</span>
           
        <%}%>
    </div>
    
    <div class="content-header-right">
        <div class="user-initials">
            <span class="display-5">
                <%=initials%>
            </span>
        </div>
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
                        
                        <div class="theme-button-color-green <%=active_green%>">
                            <button class="btn-green-clr"></button>
                        </div>

                        <div class="theme-button-color-red <%=active_red%>">
                            <button class="btn-red-clr"></button>
                        </div>

                        <div class="theme-button-color-purple <%=active_purple%>">
                            <button class="btn-purple-clr"></button>
                        </div>

                        <div class="theme-button-color-yellow <%=active_yellow%>">
                            <button class="btn-yellow-clr"></button>
                        </div>

                        <div class="theme-button-color-aqua <%=active_aqua%>">
                            <button class="btn-aqua-clr"></button>
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
    </div>
                            
</header>
                            
<script>
      var themeName = "<%=session.getAttribute(AppConstants.THEME_TEXTURE) %>";
      var themeColor = "<%= session.getAttribute(AppConstants.THEME_COLOR) %>";
</script>
