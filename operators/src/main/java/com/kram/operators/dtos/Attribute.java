package com.kram.operators.dtos;

/**
 *
 * @author Macjohnan
 */
public class Attribute {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    private String identifier;

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }
    
    private String parameterName;

    public String getParameterName() {
        return parameterName;
    }

    public void setParameterName(String parameterName) {
        this.parameterName = parameterName;
    }
    
    private boolean parameterValue;

    public boolean isParameterValue() {
        return parameterValue;
    }

    public void setParameterValue(boolean parameterValue) {
        this.parameterValue = parameterValue;
    }
    
}
