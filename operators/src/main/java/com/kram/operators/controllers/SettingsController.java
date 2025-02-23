package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.models.AppResponse;
import com.kram.operators.dtos.Attribute;
import com.kram.operators.models.GeneralRequest;
import com.kram.operators.models.SettingsRequest;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import com.kram.operators.models.SettingsResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Macjohnan
 */
public class SettingsController {
    public static String ErrorMessage;
    private HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    private String clientIP;
    
    public SettingsController() {}
    
    public SettingsController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);

    }
    
    public SettingsResponse getAllAttributes(){
        Gson gson = new GsonBuilder().create();
        String requestBody;
        
        try{
            ApplicationLog.saveLog("Get a list of all settings", "SETTINGCONTROLLER");
            int branchId = Integer.parseInt(ApplicationUtilities.getBranchId(session));
            ApplicationLog.saveLog(String.format("Branch ID :: %d", branchId), "SETTINGCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User ID :: %d", userId), "SETTINGCONTROLLER");
            
            //..generate request bject
            GeneralRequest request = new GeneralRequest();
            request.setBranchId(branchId);
            request.setUserId(userId);
            
            //log request object
            requestBody = gson.toJson(request);
            ApplicationLog.saveLog("Request body :: " + requestBody, "SETTINGCONTROLLER");
            return apiMiddleware.getAllSettings(request);
        } catch(NumberFormatException ex){
            var response = new SettingsResponse(); 
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "SETTINGCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "SETTINGCONTROLLER");
            return response;
        } 
    
    }
    
    public AppResponse updateConfigurations(Attribute[] attributes, String settingType) {
        Gson gson = new GsonBuilder().create();
        String requestBody;
        SettingsRequest settings = new SettingsRequest();
        try{
            ApplicationLog.saveLog("Saving system configurations", "SETTINGCONTROLLER");
            int branchId = Integer.parseInt(ApplicationUtilities.getBranchId(session));
            ApplicationLog.saveLog(String.format("Branch ID :: %d", branchId), "SETTINGCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User ID :: %d", userId), "SETTINGCONTROLLER");
            
            settings.setAttributes(attributes);
            settings.setSettingType(settingType);
            settings.setUserId(userId);
            settings.setBranchId(branchId);

            //log request object
            requestBody = gson.toJson(settings);
            ApplicationLog.saveLog("Request body :: " + requestBody, "SETTINGCONTROLLER");
            return apiMiddleware.saveSettings(settings);
        } catch(NumberFormatException ex){
            var response = new AppResponse(); 
            response.setResponseCode(200);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE BODY :: %s", responseBody), "SETTINGCONTROLLER");
            // Convert the exception to a string and pass it to saveLog
             ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "SETTINGCONTROLLER");
            return response;
        } 
    }
}
