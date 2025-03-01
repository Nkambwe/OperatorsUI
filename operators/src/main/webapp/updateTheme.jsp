<%-- 
    Document   : updateTheme
    Created on : Mar 1, 2025, 5:32:24 PM
    Author     : Macjohnan
--%>

<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="com.kram.operators.models.AppResponse"%>
<%@page import="com.kram.operators.controllers.SettingsController"%>
<%@ page import="com.google.gson.Gson" %>
<%
  // Get the client IP
  String clientIP = request.getRemoteAddr();
  
  // Get the theme parameter and log it to verify
  String theme = request.getParameter("theme");
  System.out.println("Theme received in JSP: " + theme);
  
  // Create the controller instance with the session and client IP
  SettingsController controller = new SettingsController(session, clientIP);
  
  // Call the method to update the theme
  AppResponse appResponse = controller.updateUserTheme(theme);
  
  // Convert the response to JSON and send it back
  Gson gson = new Gson();
  String jsonResponse = gson.toJson(appResponse);
  out.print(jsonResponse);
%>