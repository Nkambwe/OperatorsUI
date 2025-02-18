package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.kram.operators.dtos.UserData;

/**
 * Class defines a User record
 * @author Macjohnan
 */
public class User {
    
    @SerializedName("responseCode")
    @Expose
    private int responseCode;
    public int getResponseCode() { return this.responseCode; }
    public void setResponseCode(int responseCode) { this.responseCode = responseCode; }
    
    @SerializedName("responseMessage")
    @Expose
    private String responseMessage;
    public String getResponseMessage() { return responseMessage; }
    public void setResponseMessage(String responseMessage) { this.responseMessage = responseMessage; }
    
    @SerializedName("responseDescription")
    @Expose
    private String responseDescription;
    public String getResponseDescription() { return responseDescription; }
    public void setResponseDescription(String responseDescription) { this.responseDescription = responseDescription; }
    
    
    @SerializedName("data")
    @Expose
    private UserData data;
    public UserData getData() { return this.data; }
    public void setData(UserData data) { this.data = data; }
    
    // Default constructor needed for Gson
    public User() {}  
    
}