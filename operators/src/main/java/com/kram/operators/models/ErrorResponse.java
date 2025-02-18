package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * Class handles error responses from middle ware
 * @author Macjohnan
 */
public class ErrorResponse {
    @SerializedName("responseCode")
    @Expose
    private int responseCode;
    public int getResponseCode() { return this.responseCode; }
    public void setResponseCode(int responseStatus) { this.responseCode = responseCode; }
    
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
