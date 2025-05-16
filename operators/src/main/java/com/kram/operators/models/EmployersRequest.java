package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class EmployersRequest {
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
    
    @SerializedName("pageNumber")
    @Expose
    private int pageNumber;
    public int getPageNumber() { return pageNumber; }
    public void setPageNumber(int pageNumber) { this.pageNumber = pageNumber; }
    
    @SerializedName("pageSize")
    @Expose
    private int pageSize;
    public int getPageSize() { return pageSize; }
    public void setPageSize(int pageSize) { this.pageSize = pageSize; }
    
    @SerializedName("includeDeleted")
    @Expose
    private boolean includeDeleted;
    public boolean getIncludeDeleted() { return includeDeleted; }
    public void setIncludeDeleted(boolean includeDeleted) { this.includeDeleted = includeDeleted; }
    
    @SerializedName("decrypt")
    @Expose
    private String[] decrypt;
    public String[] getDecrypt() { return decrypt; }
    public void setDecrypt(String[] decrypt) { this.decrypt = decrypt; }
}
