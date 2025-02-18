package com.kram.operators.dtos;

import com.kram.operators.models.User;
import java.util.List;

/**
 *
 * @author Macjohnan
 */
public class CurrentUser {

    private final int id;
    public int getId() { return this.id; }

    private final int branchId;
    public int getBranchId() { return this.branchId; }

    private final String branchCode;
    public String getBranchCode() { return branchCode; }

    private final String branchName;
    public String getBranchName() { return branchName; }

    private final int roleId;
    public int getRoleId() { return this.roleId; }

    private final String role;
    public String getRole() { return this.role; }

    private final String username;
    public String getUsername() { return this.username; }

    private final String employeeNo;
    public String getEmployeeNo() { return employeeNo; }

    private final String employeeName;
    public String getEmployeeName() { return employeeName; }

    private final String email;
    public String getEmail() { return email; }

    private final long passwordId;
    public long getPasswordId() { return passwordId; }

    private final String password;
    public String getPassword() { return password; }

    private final int expiresIn;
    public int getExpiresIn() { return expiresIn; }

    private final boolean expirePasswords;
    public boolean getExpirePasswords() { return expirePasswords; }

    private final boolean active;
    public boolean isActive() { return this.active; }

    private final boolean verified;
    public boolean isVerified() { return this.verified; }

    private final boolean deleted;
    public boolean isDeleted() { return this.deleted; }

    private final boolean loggedin;
    public boolean isLoggedin() { return this.loggedin; }

    private final String addedOn;
    public String getAddedOn() { return this.addedOn; }

    private final String addedBy;
    public String getAddedBy() { return addedBy; }

    private final String modifiedOn;
    public String getModifiedOn() { return this.modifiedOn; }

    private final String modifiedBy;
    public String getModifiedBy() { return modifiedBy; }

    private final List<String> permissions;
    public  List<String> getPermissions() { return permissions; }
    
    private final int responseCode;
    public int getResponseCode() { return this.responseCode; }
    
    private final String responseMessage;
    public String getResponseMessage() { return responseMessage; }

    private final String responseDescription;
    public String getResponseDescription() { return responseDescription; }
    
    
    public CurrentUser(User user) {
        UserData userData = user.getData();
        this.id = userData.getId();
        this.branchId = userData.getBranchId();
        this.branchCode = userData.getBranchCode();
        this.branchName = userData.getBranchName();
        this.roleId = userData.getRoleId();
        this.role = userData.getRole();
        this.username = userData.getUsername();
        this.employeeNo = userData.getEmployeeNo();
        this.employeeName = userData.getEmployeeName();
        this.email = userData.getEmail();
        this.passwordId = userData.getPasswordId();
        this.password = userData.getPassword();
        this.expiresIn = userData.getExpiresIn();
        this.expirePasswords = userData.getExpirePasswords();
        this.active = userData.isActive();
        this.verified = userData.isVerified();
        this.deleted = userData.isDeleted();
        this.loggedin = userData.isLoggedin();
        this.addedOn = userData.getAddedOn();
        this.addedBy = userData.getAddedBy();
        this.modifiedOn = userData.getModifiedOn();
        this.modifiedBy = userData.getModifiedBy();
        this.permissions = userData.getPermissions();
        this.responseCode = user.getResponseCode();
        this.responseMessage = user.getResponseMessage();
        this.responseDescription = user.getResponseDescription();
    }

}
