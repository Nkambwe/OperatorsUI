package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import jakarta.persistence.Entity;

/**
 *
 * @author Macjohnan
 */

public class GeneralRequest{
    @SerializedName("userId")
    @Expose
    private int userId;
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    @SerializedName("branchId")
    @Expose
    private int branchId;
    public int getBranchId() { return branchId; }
    public void setBranchId(int branchId) { this.branchId = branchId; }  
}
