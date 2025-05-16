package com.kram.operators.dtos;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class Employer {
    @SerializedName("id")
    @Expose
    private long id;
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }
    
    @SerializedName("employerName")
    @Expose
    private String employerName;
    public String getEmployerName() { return employerName; }
    public void getEmployerName(String employerName) { this.employerName = employerName; }
    
    @SerializedName("primaryContact")
    @Expose
    private String primaryContact;
    public String getPrimaryContact() { return primaryContact; }
    public void setPrimaryContact(String primaryContact) { this.primaryContact = primaryContact; }
    
    @SerializedName("secondaryContact")
    @Expose
    private String secondaryContact;
    public String getSecondaryContact() { return secondaryContact; }
    public void setSecondaryContact(String secondaryContact) { this.secondaryContact = secondaryContact; }
    
    @SerializedName("residentialDistrict")
    @Expose
    private String residentialDistrict;
    public String getResidentialDistrict() { return residentialDistrict; }
    public void setResidentialDistrict(String residentialDistrict) { this.residentialDistrict = residentialDistrict; }
    
    @SerializedName("workDistrict")
    @Expose
    private String workDistrict;
    public String getWorkDistrict() { return workDistrict; }
    public void setWorkDistrict(String workDistrict) { this.workDistrict = workDistrict; }
    
    @SerializedName("businessIndustry")
    @Expose
    private String businessIndustry;
    public String getBusinessIndustry() { return businessIndustry; }
    public void setBusinessIndustry(String businessIndustry) { this.businessIndustry = businessIndustry; }
    
    @SerializedName("isActive")
    @Expose
    private boolean isActive;
    public boolean isIsActive() { return isActive; }
    public void setIsActive(boolean isActive) { this.isActive = isActive; }
    
    @SerializedName("isDeleted")
    @Expose
    private boolean isDeleted;
    public boolean isIsDeleted() { return isDeleted; }
    public void setIsDeleted(boolean isDeleted) { this.isDeleted = isDeleted; }
    
    @SerializedName("createdOn")
    @Expose
    private String createdOn;
    public String getCreatedOn() { return createdOn; }
    public void setCreatedOn(String createdOn) { this.createdOn = createdOn; }
    
    @SerializedName("createdBy")
    @Expose
    private String createdBy;
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    
    @SerializedName("lastModifiedOn")
    @Expose
    private String lastModifiedOn;
    public String getLastModifiedOn() { return lastModifiedOn; }
    public void setLastModifiedOn(String lastModifiedOn) { this.lastModifiedOn = lastModifiedOn; }
    
    @SerializedName("lastModifiedBy")
    @Expose
    private String lastModifiedBy;
    public String getLastModifiedBy() { return lastModifiedBy; }
    public void setLastModifiedBy(String lastModifiedBy) { this.lastModifiedBy = lastModifiedBy; }
}
