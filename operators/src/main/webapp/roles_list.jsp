<%-- 
    Document   : roles_list
    Created on : Apr 5, 2025, 8:11:26 AM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.dtos.AppRole"%>
<%@page import="java.util.List"%>
<%@page import="com.kram.operators.models.RoleListResponse"%>
<%@page import="com.kram.operators.controllers.AccessController"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    RoleListResponse<List<AppRole>> responseObj = new RoleListResponse<>();

    try {
        // Create AccessController and fetch roles details
        AccessController accessController = new AccessController(session, request.getRemoteAddr());
        responseObj = accessController.getRoles(); 

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
