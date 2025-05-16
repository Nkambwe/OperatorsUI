package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import com.kram.operators.models.EmployerRequest;
import com.kram.operators.models.EmployerResponse;
import com.kram.operators.models.EmployersRequest;
import com.kram.operators.models.EmployersResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Macjohnan
 */
public class EmployerController {
    public static String ErrorMessage;
    private final HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    private final String clientIP;
    
    public EmployerController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);

    }
    
    public EmployerResponse<?> getEmployerInfo(long employerId, int type){
        EmployerResponse<?> response = null;
        try{
            ApplicationLog.saveLog("Get employer's record", "EMPLOYERCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User ID :: %d", userId), "EMPLOYERCONTROLLER");

            //..generate request bject
            EmployerRequest request = new EmployerRequest();
            request.setUserId(userId);
            request.setIpAddress(this.clientIP);
            request.setEmployerId(employerId);
            request.setEmployerType(type);

            //create columns to decrypt
            String[] dycrypt = new String[0]; //{"firstName", "email", "middleName", "surname", "addedBy", "modifiedBy"};
            request.setDecrypt(dycrypt);
           
            System.out.println("Decrypt Columns :: %" + Arrays.toString(dycrypt));
            response = apiMiddleware.getEmployer(request);        
        } catch(NumberFormatException ex){
            } catch (IOException | InterruptedException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            ApplicationLog.saveLog(ex.toString(), "EMPLOYERCONTROLLER");
        }
        
        return response;
    }
    
    public EmployersResponse getEmployers(int pageNumber, int pageSize, boolean includeDeleted){
        Gson gson = new GsonBuilder().create();
        String requestBody;
        
        try{
            ApplicationLog.saveLog("Get a list of all employers", "EMPLOYERCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User ID :: %d", userId), "EMPLOYERCONTROLLER");
            
            //..generate request bject
            EmployersRequest request = new EmployersRequest();
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
            return apiMiddleware.getEmployers(request);
        } catch(NumberFormatException ex){
            var response = new EmployersResponse(); 
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "EMPLOYERCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "EMPLOYERCONTROLLER");
            return response;
        } 
    }
}
