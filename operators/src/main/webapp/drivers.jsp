<%-- 
    Document   : drivers
    Created on : Feb 9, 2025, 3:13:35 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.dtos.Driver"%>
<%@page import="com.kram.operators.models.PageMeta"%>
<%@page import="com.kram.operators.models.DriverResponse"%>
<%@page import="com.kram.operators.controllers.DriverController"%>
<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ip =ApplicationUtilities.getClientIP(request);
    String msg = null, alertClass = "alert-success", msg_type="Success";
    String username = (String)session.getAttribute(AppConstants.EMPLOYEE_NAME);

    //..make sure user is logged in to access page
    boolean isLoggedIn = session.getAttribute(AppConstants.KEY_LOGGEDIN) != null ? (Boolean)session.getAttribute(AppConstants.KEY_LOGGEDIN) : false;
    if(!isLoggedIn){
        response.sendRedirect("login.jsp");
        return;
    }
    
    //set current page
    session.setAttribute(AppConstants.CURRENT_PAGE, "DRIVERS_PAGE");
    
    //get session theme
    String theme_name = session.getAttribute(AppConstants.THEME_TEXTURE) != null ? 
    (String)session.getAttribute(AppConstants.THEME_TEXTURE) : "light" ; 
    ApplicationLog.saveLog("Session Kin :: " + theme_name, "DRIVERS_PAGE");
    
    String theme_clr = session.getAttribute(AppConstants.THEME_COLOR) != null ? 
    (String)session.getAttribute(AppConstants.THEME_COLOR) : "green" ; 
    ApplicationLog.saveLog("Session Color :: " + theme_clr, "DRIVERS_PAGE");
    
    String img_clr = theme_clr; 
    ApplicationLog.saveLog("Image Color :: " + img_clr, "DRIVERS_PAGE");
    
    //get current user theme
    SettingsController controller = new SettingsController(session, ip);
    UserTheme theme = controller.gerCurrentTheme();
    if(theme != null){
        theme_name = theme.getSkin();
        session.setAttribute(AppConstants.THEME_TEXTURE, theme_name);
        ApplicationLog.saveLog("Saved Skin :: " + theme_name, "DRIVERS_PAGE");
        theme_clr = theme.getColor();
        session.setAttribute(AppConstants.THEME_COLOR, theme_clr);
        ApplicationLog.saveLog("Saved Color :: " + theme_clr, "DRIVERS_PAGE");
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
        ApplicationLog.saveLog("Image Color :: " + theme_clr, "DRIVERS_PAGE");
    } else {
        //current theme color
        session.setAttribute(AppConstants.ACTIVE_THEME, theme_name);
        session.setAttribute(AppConstants.ACTIVE_COLOR, theme_clr);
        session.setAttribute(AppConstants.IMG_COLOR, theme_clr);
    }
    String theme_color = String.format("%s-%s-", theme_name, theme_clr);
    ApplicationLog.saveLog("Current Theme :: " + theme_color, "DRIVERS_PAGE");

    DriverController driverController = new DriverController(session, ip);
    int pageNumber = session.getAttribute(AppConstants.PAGE_NUMBER) != null ? 
                    (int)session.getAttribute(AppConstants.PAGE_NUMBER) : 1 ;   

    int pageSize = session.getAttribute(AppConstants.PAGE_SIZE) != null ? 
                    (int)session.getAttribute(AppConstants.PAGE_SIZE) : 10;   
    
    int pageCount = session.getAttribute(AppConstants.PAGE_COUNT) != null ? 
                    (int)session.getAttribute(AppConstants.PAGE_COUNT) : 0;   
    
    int totalDrivers = session.getAttribute(AppConstants.TOTAL_COUNT) != null ? 
                    (int)session.getAttribute(AppConstants.TOTAL_COUNT) : 0; 
    
    boolean includeDeleted = session.getAttribute(AppConstants.INCLUDE_DELETED) != null ? 
                    (boolean)session.getAttribute(AppConstants.INCLUDE_DELETED) : false;

    DriverResponse data =  driverController.getDrivers(pageNumber, pageSize, includeDeleted);
    String mtd = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
    
    } else {
        pageNumber = pageNumber == 0 ? 1: pageNumber;
        pageSize = pageSize == 0 ? 10: pageSize;
        data =  driverController.getDrivers(pageNumber, pageSize, includeDeleted);
        
    }
    
    //..get meta data
    if(data != null){
        PageMeta meta = data.getMeta();
        pageNumber = meta == null ? 0 : meta.getPageNumber();
        pageSize = meta == null ? 0 :  meta.getPageSize();
        pageCount = meta == null ? 0 :  meta.getTotalPages();
        totalDrivers = meta == null ? 0 :  meta.getCount();
    }
    
    //..save page infor in session
    session.setAttribute(AppConstants.PAGE_NUMBER, pageNumber);
    session.setAttribute(AppConstants.PAGE_SIZE, pageSize);
    session.setAttribute(AppConstants.INCLUDE_DELETED, includeDeleted);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | DRIVERS</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/rest-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>app-styles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>sidebar-style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/<%=theme_color%>table-customerzation.css" rel="stylesheet" type="text/css"/>
    </head>
     <body>
         
        <!----------------main container-------->
        <div class="ops-base-container" data-sidebar-state="collapsed">
            
            <!----------------sidebar-------->
            <%@include file="sidebar.jsp"%> 
            
            <!----------------section container-------->
            <div class="ops-base-content">
                
                <!----------------sidebar-------->
                <%@include file="header.jsp"%> 
                
                <section class="main-content-container">
                    
                    <% if (msg != null) {%>
                    <div class="alert <%= alertClass%> alert-dismissable message-container">
                        <span><strong><%=msg_type%>!</strong> <%=msg%>!</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    <% }%>
                    
                    <div class="section-main-content">
                        
                        <!--container for child pages-->
                        <div id="overlay">
                            <div id="parent-container" class="page-container" data-child="no-child"></div>
                        </div>
                        
                        <div class="page-content">
                            <% if(data != null){
                                    List<Driver> drivers = data.getDrivers();
                                    if(drivers != null && !drivers.isEmpty()){
                            %>
                               <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="card-title mb-0">Driver List</h5>
                                        <div class="total-brand">
                                            <span class="badge total-brand-primary">Total: <%= totalDrivers %></span>
                                            <span class="badge total-brand-secondary">Page: <%= pageNumber %> / <%= pageCount %></span>
                                        </div>
                                    </div>
                                    <div class="card-body" style="padding:0!important">
                                        <div class="table-responsive">
                                            <table id="driversTable" class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Full Name</th>
                                                        <th>Date of Birth</th>
                                                        <th>Category</th>
                                                        <th>Email</th>
                                                        <th>Experience</th>
                                                        <th>Primary Contact</th>
                                                        <th>District</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% for(Driver driver : drivers) { %>
                                                        <tr class="driver-row" data-driver-id="<%= driver.getId() %>">
                                                            <td><%= driver.getFullName() != null ? driver.getFullName() : "" %></td>
                                                            <td><%= driver.getDateOfBirth() != null ? driver.getDateOfBirth() : "" %></td>
                                                            <td><%= driver.getCategoryName() != null ? driver.getCategoryName() : "" %></td>
                                                            <td><%= driver.getEmail() != null ? driver.getEmail() : "" %></td>
                                                            <td><%= driver.getExperience() %> years</td>
                                                            <td><%= driver.getPrimaryContact() != null ? driver.getPrimaryContact() : "" %></td>
                                                            <td><%= driver.getResidentialDistrict() != null ? driver.getResidentialDistrict() : "" %></td>
                                                            <td>
                                                                <% if(driver.isIsActive()) { %>
                                                                    <span class="active-badge">Active</span>
                                                                <% } else { %>
                                                                    <span class="inactive-badge text-dark">Inactive</span>
                                                                <% } %>
                                                                <% if(driver.isIsDeleted()) { %>
                                                                    <span class="deleted-badge">Deleted</span>
                                                                <% } %>
                                                            </td>
                                                        </tr>
                                                    <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <nav>
                                            <ul class="pagination">
                                                <li class="page-item <%= pageNumber <= 1 ? "disabled" : "" %>">
                                                    <a class="page-link" href="?page=<%= pageNumber-1 %>&pageSize=<%= pageSize %>" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <% 
                                                int startPage = Math.max(1, pageNumber - 2);
                                                int endPage = Math.min(pageCount, pageNumber + 2);

                                                for(int i = startPage; i <= endPage; i++) { 
                                                %>
                                                    <li class="page-item <%= i == pageNumber ? "active" : "" %>">
                                                        <a class="page-link" href="?page=<%= i %>&pageSize=<%= pageSize %>"><%= i %></a>
                                                    </li>
                                                <% } %>

                                                <li class="page-item <%= pageNumber >= pageCount ? "disabled" : "" %>">
                                                    <a class="page-link" href="?page=<%= pageNumber+1 %>&pageSize=<%= pageSize %>" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            
                            <%} else {%>
                               <div class="card shadow">
                                    <div class="card-body text-center p-5">
                                        <div class="mb-4">
                                            <i class="mdi mdi-account-search" style="font-size: 4rem; color: #ccc;"></i>
                                        </div>
                                        <h3 class="text-muted">No Drivers Found</h3>
                                        <p class="text-secondary">There are no driver records available in the system.</p>
                                    </div>
                                </div>
                            <%} } else {%>
                                <   <div class="card shadow">
                                        <div class="card-body text-center p-5">
                                            <div class="mb-4">
                                                <i class="mdi mdi-alert-circle-outline" style="font-size: 4rem; color: #dc3545;"></i>
                                            </div>
                                            <h3 class="text-danger">Data Error</h3>
                                            <p class="text-secondary">Unable to retrieve driver data. Please try again later.</p>
                                        </div>
                                    </div>
                            <%}%>
                             
                        </div>
                        
                       <!-- Form to handle driver selection - this will be hidden -->
                        <form id="driverForm" action="${pageContext.request.contextPath}/Pages/driver_view.jsp" method="post" style="display:none;">
                            <input type="hidden" id="selectedDriverId" name="driverId">
                        </form>
                            
                        </div>
                    
                    <div class="footer shadow-text">
                        <%=AppConstants.APP_FOOTER%>
                    </div>
                   
                </section>
                
            </div>
            
        </div>
        
        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/app-script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/drivers-script.js" type="text/javascript"></script>

    </body>
    
</html>
