package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class DriverRecordRequest {
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

    @SerializedName("driverId")
    @Expose
    private long driverId;
    public long getDriverId() { return driverId; }
    public void setDriverId(long driverId) { this.driverId = driverId; }
    
    @SerializedName("decrypt")
    @Expose
    private String[] decrypt;
    public String[] getDecrypt() { return decrypt; }
    public void setDecrypt(String[] decrypt) { this.decrypt = decrypt; }
}
