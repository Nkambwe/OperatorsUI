<%-- 
    Document   : employer_business
    Created on : May 16, 2025, 5:56:07 AM
    Author     : Macjohnan
--%>


<%@page import="com.kram.operators.dtos.BusinessEmployer"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonSyntaxException"%>
<%@page import="com.kram.operators.models.EmployerResponse"%>
<%@page import="com.kram.operators.controllers.EmployerController"%>
<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.models.DriverRecordResponse"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%
    String driverIdStr = request.getParameter("driverId");
    EmployerResponse<?> responseObj = null;

    try {
        long employerId = Long.parseLong(driverIdStr);

        // Create EmployerController and fetch driver details
        EmployerController controller = new EmployerController(session, request.getRemoteAddr());
        responseObj = controller.getEmployerInfo(employerId, 2); 

        BusinessEmployer data = (BusinessEmployer)responseObj.getData();
        
        Gson gson = new GsonBuilder().serializeNulls().create(); 
        if(data != null){
            String jsonData = gson.toJson(data).toString();
            ApplicationLog.saveLog("RECORD : " + jsonData, "RESPONSE");
        }
        String json = gson.toJson(responseObj);
        out.print(json); // Outputting structured JSON response
    } catch (Exception e) {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        responseObj.setResponseCode(500);
        responseObj.setResponseMessage("Error retrieving driver data");
        responseObj.setResponseDescription(e.getMessage());

        Gson gson = new Gson();
        String err = gson.toJson(responseObj);
        out.print(err);
    }
%>
