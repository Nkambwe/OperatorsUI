package com.kram.operators.dtos;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class SettingsRequest {
    
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
    
    @SerializedName("settingType")
    @Expose
    private String settingType;
    public String getSettingType() { return settingType; }
    public void setSettingType(String settingType) { this.settingType = settingType; }
    
    @SerializedName("attributes")
    @Expose
    private Attribute[] attributes;
    public Attribute[] getAttributes() { return attributes; }
    public void setAttributes(Attribute[] attributes) { this.attributes = attributes; }

}
