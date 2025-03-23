<%-- 
    Document   : driver_page_01
    Created on : Feb 9, 2025, 6:57:51 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page import="com.kram.operators.controllers.DriverController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DriverController driverController = new DriverController(session, request.getRemoteAddr());
%>
<div id="driver-view" class="container-fluid app-page">
    <div class="page-top">
        <div class="back-container">
            <button class="btn-back" data-back="back">
                <span><i class="mdi mdi-arrow-left"></i></span>
            </button>
        </div>
        <div class="page-top-header-container">
            <span class="page-top-header">
                DRIVER DETAILS
            </span>
        </div>
        <div class="expand-container">
            <button class="btn-expand" data-expand="expand">
                <span>
                    <i class="mdi mdi-arrow-expand"></i>
                    <i class="mdi mdi-arrow-collapse hide-icon"></i>
                </span>
            </button>
        </div>
    </div>
    <div class="page-content">
        <div id="loadingSpinner" class="text-center p-5">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="mt-2">Loading driver information...</p>
        </div>
        
        <div id="driverDetails" class="driver-details" style="display: none;">
            <!-- Content will be populated by JavaScript -->
        </div>
        
        <div id="errorMessage" class="alert alert-danger" style="display: none;">
            <i class="mdi mdi-alert-circle-outline me-2"></i>
            <span id="errorText">Failed to load driver details. Please try again.</span>
        </div>
    </div>
</div>
 <div class="page-footer shadow-text">
    <%=AppConstants.APP_FOOTER%>
</div>