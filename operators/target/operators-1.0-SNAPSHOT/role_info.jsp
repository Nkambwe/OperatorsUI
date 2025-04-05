<%-- 
    Document   : role_info
    Created on : Apr 5, 2025, 9:01:42 AM
    Author     : Macjohnan
--%>

<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.kram.operators.controllers.AccessController"%>
<%@page import="com.kram.operators.models.RoleResponse"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    String roleIdStr = request.getParameter("roleId");
    String roleName = request.getParameter("roleName");
    RoleResponse responseObj = new RoleResponse();

    try {
        long roleId = 0;
        if(roleIdStr != null && roleIdStr.isEmpty()){
            roleId = Long.parseLong(roleIdStr);
        }

        // Create AccessController and fetch driver details
        AccessController driverController = new AccessController(session, request.getRemoteAddr());
        
        // Now fetching full response by Id or role name
         responseObj = roleId != 0? driverController.getRoleById(roleId): driverController.getRoleByName(roleName); 
        Gson gson = new GsonBuilder().serializeNulls().create(); 
        String json = gson.toJson(responseObj);
        out.print(json); 
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        responseObj.setResponseCode(500);
        responseObj.setResponseMessage("Error retrieving role data");
        responseObj.setResponseDescription(e.getMessage());

        Gson gson = new Gson();
        String err = gson.toJson(responseObj);
        out.print(err);
    }
%>
