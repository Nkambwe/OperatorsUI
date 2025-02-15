package com.kram.operators.dtos;

/**
 *
 * @author Macjohnan
 */
public class AppUser {
     private int id;
    public int getId() { return this.id; }
    public void setId(int id) { this.id = id; }
    
    private String fullName;
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    private String employeeNo;
    public String getEmployeeNo() { return employeeNo; }
    public void setEmployeeNo(String employeeNo) { this.employeeNo = employeeNo; }
    
    private String firstName;
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    
    private String middleName;
    public String getMiddleName() { return middleName; }
    public void setMiddleName(String middleName) { this.middleName = middleName; }
    
    private String lastName;
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    
    private int branchId;
    public int getBranchId() { return this.branchId; }
    public void setBranchId(int branchId) { this.branchId = branchId; }

    private String branchName;
    public String getBranchName() { return branchName; }
    public void setBranchName(String branchName) { this.branchName = branchName; }
    
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
    
    private String lastLogin;
    public String getLastLogin() { return this.lastLogin; }
    public void setLastLogin(String lastLogin) { this.lastLogin = lastLogin; }
    
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
}
