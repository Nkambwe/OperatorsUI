package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import com.kram.operators.models.DriverRecordRequest;
import com.kram.operators.models.DriverRecordResponse;
import com.kram.operators.models.DriverRequest;
import com.kram.operators.models.DriverResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Macjohnan
 */
public class DriverController {
    public static String ErrorMessage;
    private final HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    private final String clientIP;
    
    public DriverController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);

    }
    
    public DriverRecordResponse getDriverInfo(long driverId){
        Gson gson = new GsonBuilder().create();
        String requestBody;
        try{
            ApplicationLog.saveLog("Get driver's record", "DRIVERCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User ID :: %d", userId), "DRIVERCONTROLLER");

            //..generate request bject
            DriverRecordRequest request = new DriverRecordRequest();
            request.setUserId(userId);
            request.setIpAddress(this.clientIP);
            request.setDriverId(driverId);

            //create columns to decrypt
            String[] dycrypt = new String[0]; //{"firstName", "email", "middleName", "surname", "addedBy", "modifiedBy"};
            request.setDecrypt(dycrypt);

            //log request object
            requestBody = gson.toJson(request);
            ApplicationLog.saveLog("REQUEST BODY :: " + requestBody, "DRIVERCONTROLLER");
            return apiMiddleware.getDriverRecord(request);           
        } catch(NumberFormatException ex){
            var response = new DriverRecordResponse(); 
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "DRIVERCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "DRIVERCONTROLLER");
            return response;
        }

    }
    
    public DriverResponse getDrivers(int pageNumber, int pageSize, boolean includeDeleted){
        Gson gson = new GsonBuilder().create();
        String requestBody;
        
        try{
            ApplicationLog.saveLog("Get a list of all drivers", "DRIVERCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User ID :: %d", userId), "DRIVERCONTROLLER");
            
            //..generate request bject
            DriverRequest request = new DriverRequest();
            request.setUserId(userId);
            request.setIpAddress(this.clientIP);
            request.setPageNumber(pageNumber);
            request.setPageSize(pageSize);
            request.setIncludeDeleted(includeDeleted);
            
            //create columns to decrypt
            String[] dycrypt = new String[0]; //{"employeeNo", "email", "password", "employeeName", "addedBy", "modifiedBy"};
            request.setDecrypt(dycrypt);
            
            //log request object
            requestBody = gson.toJson(request);
            ApplicationLog.saveLog("Request body :: " + requestBody, "DRIVERCONTROLLER");
            return apiMiddleware.getDrivers(request);
        } catch(NumberFormatException ex){
            var response = new DriverResponse(); 
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "DRIVERCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "DRIVERCONTROLLER");
            return response;
        } 
    }
}
