package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class ThemeRequest {
    @SerializedName("userId")
    @Expose
    private int userId;
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    @SerializedName("theme")
    @Expose
    private String theme;
    public String getTheme() { return theme; }
    public void setTheme(String theme) { this.theme = theme; }  
}
