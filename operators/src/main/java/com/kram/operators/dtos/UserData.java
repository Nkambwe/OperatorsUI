package com.kram.operators.dtos;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import java.util.List;

/**
 *
 * @author Macjohnan
 */
public class UserData {
    
    @SerializedName("id")
    @Expose
    private int id;
    public int getId() { return this.id; }
    public void setId(int id) { this.id = id; }

    @SerializedName("branchId")
    @Expose
    private int branchId;
    public int getBranchId() { return this.branchId; }
    public void setBranchId(int branchId) { this.branchId = branchId; }

    @SerializedName("branchCode")
    @Expose
    private String branchCode;
    public String getBranchCode() { return branchCode; }
    public void setBranchCode(String branchCode) { this.branchCode = branchCode; }

    @SerializedName("branchName")
    @Expose
    private String branchName;
    public String getBranchName() { return branchName; }
    public void setBranchName(String branchName) { this.branchName = branchName; }

    @SerializedName("roleId")
    @Expose
    private int roleId;
    public int getRoleId() { return this.roleId; }
    public void setRoleId(int roleId) { this.roleId = roleId; }

    @SerializedName("role")
    @Expose
    private String role;
    public String getRole() { return this.role; }
    public void setRole(String role) { this.role = role; }

    @SerializedName("username")
    @Expose
    private String username;
    public String getUsername() { return this.username; }
    public void setUsername(String username) { this.username = username; }

    @SerializedName("employeeNo")
    @Expose
    private String employeeNo;
    public String getEmployeeNo() { return employeeNo; }
    public void setEmployeeNo(String employeeNo) { this.employeeNo = employeeNo; }

    @SerializedName("employeeName")
    @Expose
    private String employeeName;
    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }

    @SerializedName("email")
    @Expose
    private String email;
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    @SerializedName("passwordId")
    @Expose
    private long passwordId;
    public long getPasswordId() { return passwordId; }
    public void setPasswordId(long passwordId) { this.passwordId = passwordId; }

    @SerializedName("password")
    @Expose
    private String password;
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    @SerializedName("expiresIn")
    @Expose
    private int expiresIn;
    public int getExpiresIn() { return expiresIn; }
    public void setExpiresIn(int expiresIn) { this.expiresIn = expiresIn; }

    @SerializedName("expirePasswords")
    @Expose
    private boolean expirePasswords;
    public boolean getExpirePasswords() { return expirePasswords; }
    public void setExpirePasswords(boolean expirePasswords) { this.expirePasswords = expirePasswords; }

    @SerializedName("active")
    @Expose
    private boolean active;
    public boolean isActive() { return this.active; }
    public void setActive(boolean active) { this.active = active; }

    @SerializedName("verified")
    @Expose
    private boolean verified;
    public boolean isVerified() { return this.verified; }
    public void setVerified(boolean verified) { this.verified = verified; }

    @SerializedName("deleted")
    @Expose
    private boolean deleted;
    public boolean isDeleted() { return this.deleted; }
    public void setDeleted(boolean deleted) { this.deleted = deleted; }

    @SerializedName("loggedin")
    @Expose
    private boolean loggedin;
    public boolean isLoggedin() { return this.loggedin; }
    public void setLoggedin(boolean loggedin) { this.loggedin = loggedin; }

    @SerializedName("addedOn")
    @Expose
    private String addedOn;
    public String getAddedOn() { return this.addedOn; }
    public void setAddedOn(String addedOn) { this.addedOn = addedOn; }

    @SerializedName("addedBy")
    @Expose
    private String addedBy;
    public String getAddedBy() { return addedBy; }
    public void setAddedBy(String addedBy) { this.addedBy = addedBy; }

    @SerializedName("modifiedOn")
    @Expose
    private String modifiedOn;
    public String getModifiedOn() { return this.modifiedOn; }
    public void setModifiedOn(String modifiedOn) { this.modifiedOn = modifiedOn; }

   @SerializedName("modifiedBy")
   @Expose
    private String modifiedBy;
    public String getModifiedBy() { return modifiedBy; }
    public void setModifiedBy(String modifiedBy) { this.modifiedBy = modifiedBy; }

    @SerializedName("permissions")
    @Expose
    private List<String> permissions;
    public  List<String> getPermissions() { return permissions; }
    public void setPermissions( List<String> permissions) { this.permissions = permissions; }
    
    // Default constructor needed for Gson
    public UserData() {} 
}
