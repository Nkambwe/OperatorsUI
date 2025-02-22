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
    
%>
 <header class="main-content-header">
    <div class="content-header-left"><%=current_branch %></div>
    <div class="content-header-right"><%=loggedin_user%></div>
</header>
