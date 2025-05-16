package com.kram.operators.dtos;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class IndividualEmployer {
    @SerializedName("id")
    @Expose
    private long id;
    public long getId() { return id; }
    public void setId(long id) { this.id = id; }
    
    @SerializedName("firstName")
    @Expose
    private String firstName;
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    
    @SerializedName("middleName")
    @Expose
    private String middleName;
    public String getMiddleName() { return middleName; }
    public void setMiddleName(String middleName) { this.middleName = middleName; }

    @SerializedName("lastName")
    @Expose
    private String lastName;
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    
    @SerializedName("fullName")
    @Expose
    private String fullName;
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    @SerializedName("dateOfBirth")
    @Expose
    private String dateOfBirth;
    public String getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(String dateOfBirth) { this.dateOfBirth = dateOfBirth; }
    
    @SerializedName("categoryId")
    @Expose
    private long categoryId;
    public long getCategoryId() { return categoryId; }
    public void setCategoryI(long categoryId) { this.categoryId = categoryId; }
    
    @SerializedName("categoryName")
    @Expose
    private String categoryName;
    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
    
    @SerializedName("email")
    @Expose
    private String email;
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    @SerializedName("employerType")
    @Expose
    private int employerType;
    public int getEmployerType() { return employerType; }
    public void setEmployerType(int employerType) { this.employerType = employerType; }
    
    @SerializedName("residentialDistrictId")
    @Expose
    private long residentialDistrictId;
    public long getResidentialDistrictId() { return residentialDistrictId; }
    public void setResidentialDistrictId(long residentialDistrictId) { this.residentialDistrictId = residentialDistrictId; }
    
    @SerializedName("residentialDistrict")
    @Expose
    private String residentialDistrict;
    public String getResidentialDistrict() { return residentialDistrict; }
    public void setResidentialDistrict(String residentialDistrict) { this.residentialDistrict = residentialDistrict; }
    
    @SerializedName("workDistrictId")
    @Expose
    private long workDistrictId;
    public long getWorkDistrictId() { return workDistrictId; }
    public void setWorkDistrictId(long workDistrictId) { this.workDistrictId = workDistrictId; }
    
    @SerializedName("workDistrict")
    @Expose
    private String workDistrict;
    public String getWorkDistrict() { return workDistrict; }
    public void setWorkDistrict(String workDistrict) { this.workDistrict = workDistrict; }
    
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
    
    @SerializedName("contactId")
    @Expose
    private long contactId;
    public long getContactId() { return contactId; }
    public void setContactId(long contactId) { this.contactId = contactId; }
    
    @SerializedName("contact")
    @Expose
    private String contact;
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
    
    @SerializedName("whatsapp")
    @Expose
    private String whatsapp;
    public String getWhatsapp() { return whatsapp; }
    public void setWhatsapp(String whatsapp) { this.whatsapp = whatsapp; }
    
    @SerializedName("facebook")
    @Expose
    private String facebook;
    public String getFacebook() { return facebook; }
    public void setFacebook(String facebook) { this.facebook = facebook; }
    
    @SerializedName("tweeter")
    @Expose
    private String tweeter;
    public String getTweeter() { return tweeter; }
    public void setTweeter(String tweeter) { this.tweeter = tweeter; }
    
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
