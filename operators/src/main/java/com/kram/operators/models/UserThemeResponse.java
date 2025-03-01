package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class UserThemeResponse {
    @SerializedName("id")
    @Expose
    private long id;
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }
    
    @SerializedName("skin")
    @Expose
    private String skin;
    public String getSkin() { return skin; }
    public void setSkin(String skin) { this.skin = skin; }  
    
    @SerializedName("color")
    @Expose
    private String color;
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }  
    
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
}
