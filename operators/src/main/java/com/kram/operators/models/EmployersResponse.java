package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.kram.operators.dtos.Employer;
import java.util.List;

/**
 *
 * @author Macjohnan
 */
public class EmployersResponse {
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
    private List<Employer> data;
    public  List<Employer> getDrivers() { return data; }
    public void setDrivers(List<Employer> data) { this.data = data; }
    
    @SerializedName("meta")
    @Expose
    private PageMeta meta;
    public PageMeta getMeta() { return meta; }
    public void setMeta(PageMeta meta) { this.meta = meta; }
    
}
