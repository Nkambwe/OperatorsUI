<%-- 
    Document   : logout
    Created on : Mar 4, 2025, 5:28:27 AM
    Author     : Macjohnan
--%>
<%@page import="com.kram.operators.controllers.LogoutController"%>
<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%
    if (session.getAttribute(AppConstants.KEY_LOGGEDIN) != null) {
         String ip=ApplicationUtilities.getClientIP(request);
         
        //..call controller to update Database
        LogoutController controller = new LogoutController(session,ip);
        if (controller.isIsSuccessful()) {
            session.invalidate();
            response.sendRedirect("login.jsp");
        }else{
          out.println("<h1>UNABLE TO COMPLETE REQUEST </h1>");
        }

    } else {
        System.out.println("Sending Redirect to Login");
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

