package com.kram.operators.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;

/**
 * Class defines a User record
 * @author Macjohnan
 */
public class User {
    private int id;
    public int getId() { return this.id; }
    public void setId(int id) { this.id = id; }
    
    private int branchId;
    public int getBranchId() { return this.branchId; }
    public void setBranchId(int branchId) { this.branchId = branchId; }

    private String employeeNo;
    public String getEmployeeNo() { return employeeNo; }
    public void setEmployeeNo(String employeeNo) { this.employeeNo = employeeNo; }
    
    private String employeeName;
    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }
    
    private String branchCode;
    public String getBranchCode() { return branchCode; }
    public void setBranchCode(String branchCode) { this.branchCode = branchCode; }
    
    private int roleId;
    public int getRoleId() { return this.roleId; }
    public void setRoleId(int roleId) { this.roleId = roleId; }
    
    private String role;
    public String getRole() { return this.role; }
    public void setRole(String role) { this.role = role; }
    
    private String username;
    public String getUsername() { return this.username; }
    public void setUsername(String username) { this.username = username; }
    
    private String email;
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    private long passwordId;
    public long getPasswordId() { return passwordId; }
    public void setPasswordId(long passwordId) { this.passwordId = passwordId; }
    
    private String password;
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    private int expiresIn;
    public int getExpiresIn() { return expiresIn; }
    public void setPassword(int expiresIn) { this.expiresIn = expiresIn; }
    
    private boolean expirePasswords;
    public boolean getExpirePasswords() { return expirePasswords; }
    public void setExpirePasswords(boolean expirePasswords) { this.expirePasswords = expirePasswords; }
    
    private boolean active;
    public boolean isActive() { return this.active; }
    public void setIsActive(boolean active) { this.active = active; }
    
    private boolean verified;
    public boolean isVerified() { return this.verified; }
    public void setIsVerified(boolean verified) { this.verified = verified; }
    
    private boolean deleted;
    public boolean isDeleted() { return this.deleted; }
    public void setIsDeleted(boolean deleted) { this.deleted = deleted; }
    
    private boolean loggedin;
    public boolean isLoggedin() { return this.loggedin; }
    public void setIsLoggedin(boolean loggedin) { this.loggedin = loggedin; }
    
    private String addedOn;
    public String getAddedOn() { return this.addedOn; }
    public void setAddedOn(String addedOn) { this.addedOn = addedOn; }
    
    private String addedBy;
    public String getAddedBy() { return addedBy; }
    public void setAddedBy(String addedBy) { this.addedBy = addedBy; }
    
    private String modifiedOn;
    public String getModifiedOn() { return this.modifiedOn; }
    public void setModifiedOn(String modifiedOn) { this.modifiedOn = modifiedOn; }
    
    private String modifiedBy;
    public String getModifiedBy() { return modifiedBy; }
    public void setModifiedBy(String modifiedBy) { this.modifiedBy = modifiedBy; }
    
    private  List<String> permissions;
    public  List<String> getPermissions() { return permissions; }
    public void setPermissions( List<String> permissions) { this.permissions = permissions; }
    
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
    
    
    // Add a field for response metadata
    private ResponseMetadata responseMetadata = new ResponseMetadata();
    
    // Create a separate inner class for response metadata
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ResponseMetadata {
        private boolean responseStatus;
        private int responseCode;
        private String responseMessage;
        private String responseDescription;
        
        // Getters and setters for response metadata
        public boolean getResponseStatus() { return this.responseStatus; }
        public void setResponseStatus(boolean responseStatus) { this.responseStatus = responseStatus; }
        
        public int getResponseCode() { return this.responseCode; }
        public void setResponseCode(int responseCode) { this.responseCode = responseCode; }
        
        public String getResponseMessage() { return responseMessage; }
        public void setResponseMessage(String responseMessage) { this.responseMessage = responseMessage; }
        
        public String getResponseDescription() { return responseDescription; }
        public void setResponseDescription(String responseDescription) { this.responseDescription = responseDescription; }
    }
    

}