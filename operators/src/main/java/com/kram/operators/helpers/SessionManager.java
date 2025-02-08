package com.kram.operators.helpers;

/** Session Manager
 * Application session manager
 * @author Macjohnan
 */

import com.kram.operators.middleware.MiddlewareService;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class SessionManager implements HttpSessionListener  {
    
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println(String.format("Session Started : %s",event.getSession().getId()));
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("Session Timeout Out Sigining Out.");
        HttpSession session = se.getSession();
        MiddlewareService api = new MiddlewareService();
        
        String userId = ApplicationUtilities.getUserId(session);
        String clientIP=AppSingleton.getInstance().getClientIP();
       //update database login status
        boolean isLoggedout =api.logout(userId, clientIP);
        System.out.println("Session Timeout Out With :: ");
        if(isLoggedout){
            System.out.println("User session closed");
        } else {
            System.out.println("Session Failed to close");
        }
        
    }
}
