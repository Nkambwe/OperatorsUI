package com.kram.operators.controllers;

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
    private final HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();

    public LogoutController(HttpSession session, String cleintip) {
        this.clientIP = cleintip;
        this.session = session;  
    }

    public boolean logoutUser(){
        int userId = Integer.parseInt(ApplicationUtilities.getUserId(this.session));
        ApplicationLog.saveLog("Loging out user at IP " + this.clientIP, "LOGOUT");
        ApplicationLog.saveLog(String.format("User ID :: %d", userId), "LOGOUT");
        return apiMiddleware.logout(userId, this.clientIP);
    }
}
