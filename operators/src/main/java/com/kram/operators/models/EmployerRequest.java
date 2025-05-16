package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class EmployerRequest {
    @SerializedName("userId")
    @Expose
    private int userId;
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    @SerializedName("ipAddress")
    @Expose
    private String ipAddress;
    public String getIpAddress() { return ipAddress; }
    public void setIpAddress(String ipAddress) { this.ipAddress = ipAddress; }

    @SerializedName("employerId")
    @Expose
    private long employerId;
    public long getEmployerId() { return employerId; }
    public void setEmployerId(long employerId) { this.employerId = employerId; }
    
    @SerializedName("employerType")
    @Expose
    private int employerType;
    public long getEmployerType() { return employerType; }
    public void setEmployerType(int employerType) { this.employerType = employerType; }
    
    @SerializedName("decrypt")
    @Expose
    private String[] decrypt;
    public String[] getDecrypt() { return decrypt; }
    public void setDecrypt(String[] decrypt) { this.decrypt = decrypt; }
}
