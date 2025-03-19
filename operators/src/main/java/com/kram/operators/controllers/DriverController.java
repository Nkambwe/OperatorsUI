package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.dtos.Driver;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import com.kram.operators.models.DriverRequest;
import com.kram.operators.models.DriverResponse;
import com.kram.operators.models.GeneralRequest;
import com.kram.operators.models.SettingsResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Macjohnan
 */
public class DriverController {
    public static String ErrorMessage;
    private HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    private String clientIP;
    
    public DriverController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);

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
            request.setPageNumber(pageNumber);
            request.setPageSize(pageSize);
            request.setIncludeDeleted(includeDeleted);
            
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
