package com.kram.operators.controllers;

import com.kram.operators.dtos.AppResponse;
import com.kram.operators.dtos.Attribute;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.middleware.MiddlewareService;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Macjohnan
 */
public class SettingsController {
    public static String ErrorMessage;
    private HttpSession session;
    private MiddlewareService apiMiddleware = new MiddlewareService();
    private String clientIP;
    
    public SettingsController() {}
    
    public SettingsController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);

    }
    
    public AppResponse updateConfigurations(ArrayList<Attribute> attributes) {
       
        return null;
    }
}
