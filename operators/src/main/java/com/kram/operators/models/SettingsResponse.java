package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.kram.operators.dtos.Attribute;
import java.util.List;

/**
 *
 * @author Macjohnan
 */
public class SettingsResponse {
    
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

    @SerializedName("items")
    @Expose
    private List<Attribute> items;
    public  List<Attribute> getItems() { return items; }
    public void setItems(List<Attribute> items) { this.items = items; }
}
