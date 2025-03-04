package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class LogoutRequest {
    @Expose
    private int userId;
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    @SerializedName("ipAddress")
    @Expose
    private String ipAddress;
    public String getIpAddress() { return ipAddress; }
    public void setIpAddress(String ipAddress) { this.ipAddress = ipAddress; }
}
