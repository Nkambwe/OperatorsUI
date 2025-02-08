package com.kram.operators.models;

/**
 * Class handles error responses from middle ware
 * @author Macjohnan
 */
public class ErrorResponse {
    private int statusCode;
    public int getStatusCode() { return this.statusCode; }
    public void setStatusCode(int statusCode) { this.statusCode = statusCode; }
    
    private String responseMessage;
    public String getResponseMessage() { return responseMessage; }
    public void setResponseMessage(String responseMessage) { this.responseMessage = responseMessage; }
    
    private String responseDescription;
    public String getResponseDescription() { return responseDescription; }
    public void setResponseDescription(String responseDescription) { this.responseDescription = responseDescription; }
}
