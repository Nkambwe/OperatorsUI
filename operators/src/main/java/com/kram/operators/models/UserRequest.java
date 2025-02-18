/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class UserRequest {
    
    @SerializedName("username")
    @Expose
    private String username;
    public String getUsername() { return this.username; }
    public void setUsername(String username) { this.username = username; }
    
    @SerializedName("decrypt")
    @Expose
    private String[] decrypt;
    public String[] getDecrypt() { return decrypt; }
    public void setDecrypt(String[] decrypt) { this.decrypt = decrypt; }
}
