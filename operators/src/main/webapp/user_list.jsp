<%-- 
    Document   : user_list
    Created on : Apr 5, 2025, 11:46:02 AM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.controllers.AccessController"%>
<%@page import="com.kram.operators.dtos.AppUser"%>
<%@page import="com.kram.operators.models.UserListResponse"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>

<%
    UserListResponse<List<AppUser>> responseObj = new UserListResponse<>();

    try {
        // Create AccessController and fetch user details
        AccessController accessController = new AccessController(session, request.getRemoteAddr());
        responseObj = accessController.getUsers(); 

        Gson gson = new GsonBuilder().serializeNulls().create(); 
        String json = gson.toJson(responseObj);
        out.print(json);
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        responseObj.setResponseCode(500);
        responseObj.setResponseMessage("Error retrieving roles");
        responseObj.setResponseDescription(e.getMessage());

        Gson gson = new Gson();
        String err = gson.toJson(responseObj);
        out.print(err);
    }
%>
