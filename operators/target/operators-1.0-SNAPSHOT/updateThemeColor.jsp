<%-- 
    Document   : updateThemeColor
    Created on : Mar 2, 2025, 11:34:56 AM
    Author     : Macjohnan
--%>

<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="com.kram.operators.models.AppResponse"%>
<%@page import="com.kram.operators.controllers.SettingsController"%>
<%@ page import="com.google.gson.Gson" %>
<%
  // Get the client IP
  String clientIP = request.getRemoteAddr();
  
  // Get the color parameter and log it to verify
  String color = request.getParameter("color");
  System.out.println("Color received in JSP: " + color);
  
  // Create the controller instance with the session and client IP
  SettingsController controller = new SettingsController(session, clientIP);
  
  // Call the method to update the theme
  AppResponse appResponse = controller.updateUserThemeColor(color);
  
  // Convert the response to JSON and send it back
  Gson gson = new Gson();
  String jsonResponse = gson.toJson(appResponse);
  out.print(jsonResponse);
%>
