package com.kram.operators.dtos;

/**
 *
 * @author Macjohnan
 */
public class AppResponse {
    
    private boolean responseStatus;
    public boolean getResponseStatus() { return this.responseStatus; }
    public void setResponseStatus(boolean responseStatus) { this.responseStatus = responseStatus; }
    
    private int responseCode;
    public int getResponseCode() { return this.responseCode; }
    public void setResponseCode(int responseCode) { this.responseCode = responseCode; }
    
    private String responseMessage;
    public String getResponseMessage() { return responseMessage; }
    public void setResponseMessage(String responseMessage) { this.responseMessage = responseMessage; }
    
    private String responseDescription;
    public String getResponseDescription() { return responseDescription; }
    public void setResponseDescription(String responseDescription) { this.responseDescription = responseDescription; }
}
