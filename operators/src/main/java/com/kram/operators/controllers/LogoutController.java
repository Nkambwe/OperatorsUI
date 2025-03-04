package com.kram.operators.controllers;

import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Macjohnan
 */
public class LogoutController {
    private final String clientIP;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    
    private  boolean isSuccessful;
    public boolean isIsSuccessful() { return isSuccessful; }
    public void setIsSuccessful(boolean isSuccessful) { this.isSuccessful = isSuccessful; }

    public LogoutController(HttpSession session, String cleintip) {
        this.clientIP = cleintip;
        String userId = ApplicationUtilities.getUserId(session);
        ApplicationLog.saveLog("Loging out user at IP " + this.clientIP, "LOGOUT");
        isSuccessful = apiMiddleware.logout(userId, this.clientIP);
    }

}
