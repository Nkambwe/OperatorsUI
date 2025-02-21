package com.kram.operators.dtos;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class Attribute {
    @SerializedName("id")
    @Expose
    private int id;
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    @SerializedName("identifier")
    @Expose
    private String identifier;
    public String getIdentifier() { return identifier; }
    public void setIdentifier(String identifier) { this.identifier = identifier; }
    
    @SerializedName("parameterName")
    @Expose
    private String parameterName;
    public String getParameterName() { return parameterName; }
    public void setParameterName(String parameterName) { this.parameterName = parameterName; }
    
    @SerializedName("parameterValue")
    @Expose
    private Object parameterValue;
    public Object getParameterValue() { return parameterValue; }
    public void setParameterValue(Object parameterValue) {
        this.parameterValue = parameterValue;
    }
    
}
