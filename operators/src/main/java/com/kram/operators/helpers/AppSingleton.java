/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kram.operators.helpers;

/**
 * Create a single instance of an object
 * @author Macjohnan
 */
public class AppSingleton {
     private String clientIP;
    
    private AppSingleton() {
    }
    
    public static AppSingleton getInstance() {
        return ApSingletonHolder.INSTANCE;
    }
    
    private static class ApSingletonHolder {

        private static final AppSingleton INSTANCE = new AppSingleton();
    }

    public String getClientIP() {
        return clientIP;
    }

    public void setClientIP(String clientIP) {
        this.clientIP = clientIP;
    }
}
