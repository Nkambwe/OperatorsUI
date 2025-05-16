package com.kram.operators.dtos;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class BusinessEmployer {
    @SerializedName("id")
    @Expose
    private long id;
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }
    
    @SerializedName("businessName")
    @Expose
    private String businessName;
    public String getBusinessName() { return businessName; }
    public void setBusinessName(String businessName) { this.businessName = businessName; }
    
    @SerializedName("city")
    @Expose
    private String city;
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    
    @SerializedName("businessAddress")
    @Expose
    private String businessAddress;
    public String getBusinessAddress() { return businessAddress; }
    public void setBusinessAddress(String businessAddress) { this.businessAddress = businessAddress; }
    
    @SerializedName("businessNumber")
    @Expose
    private String businessNumber;
    public String getBusinessNumber() { return businessNumber; }
    public void setBusinessNumber(String businessNumber) { this.businessNumber = businessNumber; }
    
    @SerializedName("businessIndustryId")
    @Expose
    private long businessIndustryId;
    public long getBusinessIndustryId() { return businessIndustryId; }
    public void setBusinessIndustryId(long businessIndustryId) { this.businessIndustryId = businessIndustryId; }
    
    @SerializedName("businessIndustry")
    @Expose
    private String businessIndustry;
    public String getBusinessIndustry() { return businessIndustry; }
    public void setBusinessIndustry(String businessIndustry) { this.businessIndustry = businessIndustry; }
    
    @SerializedName("contactFirstName")
    @Expose
    private String contactFirstName;
    public String getContactFirstName() { return contactFirstName; }
    public void setContactFirstName(String contactFirstName) { this.contactFirstName = contactFirstName; }
    
    @SerializedName("contactMiddleName")
    @Expose
    private String contactMiddleName;
    public String getContactMiddleName() { return contactMiddleName; }
    public void setContactMiddleName(String contactMiddleName) { this.contactMiddleName = contactMiddleName; }

    @SerializedName("contactLastName")
    @Expose
    private String contactLastName;
    public String getContactLastName() { return contactLastName; }
    public void setContactLastName(String contactLastName) { this.contactLastName = contactLastName; }
    
    @SerializedName("contactFullName")
    @Expose
    private String contactFullName;
    public String getContactFullName() { return contactFullName; }
    public void setContactFullName(String contactFullName) { this.contactFullName = contactFullName; }
    
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
