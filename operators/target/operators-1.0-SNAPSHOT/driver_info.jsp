<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.models.DriverRecordResponse"%>
<%@page import="com.kram.operators.controllers.DriverController"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>

<%
    String driverIdStr = request.getParameter("driverId");
    DriverRecordResponse responseObj = new DriverRecordResponse();

    try {
        long driverId = Long.parseLong(driverIdStr);

        // Create DriverController and fetch driver details
        DriverController driverController = new DriverController(session, request.getRemoteAddr());
        responseObj = driverController.getDriverInfo(driverId); // Now fetching full response

        Gson gson = new GsonBuilder().serializeNulls().create(); 
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
