package com.kram.operators.dtos;

import java.time.LocalDateTime;

/**
 *
 * @author Macjohnan
 */
public class Driver {
    
    private long id;
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
    private String firstName;
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    private String middleName;
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    private String surname;
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    private String fullName;
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    private LocalDateTime dateOfBirth;
    public LocalDateTime getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDateTime dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    private int experience;
    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }
    private long categoryId;
    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryI(long categoryId) {
        this.categoryId = categoryId;
    }

    private String categoryName;
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    private String whatsapp;
    public String getWhatsapp() {
        return whatsapp;
    }

    public void setWhatsapp(String whatsapp) {
        this.whatsapp = whatsapp;
    }

    private String facebook;
    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    private String tweeter;
    public String getTweeter() {
        return tweeter;
    }

    public void setTweeter(String tweeter) {
        this.tweeter = tweeter;
    }

    private String email;
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    private String primaryContact;
    public String getPrimaryContact() {
        return primaryContact;
    }

    public void setPrimaryContact(String primaryContact) {
        this.primaryContact = primaryContact;
    }

    private String alternativeContact;
    public String getAlternativeContact() {
        return alternativeContact;
    }

    public void setAlternativeContact(String alternativeContact) {
        this.alternativeContact = alternativeContact;
    }
    
    private long DistrictOfOriginId;
    public long getDistrictOfOriginId() {
        return DistrictOfOriginId;
    }

    public void setDistrictOfOriginId(long DistrictOfOriginId) {
        this.DistrictOfOriginId = DistrictOfOriginId;
    }
    
    private String districtOfOrigin;
    public String getDistrictOfOrigin() {
        return districtOfOrigin;
    }

    public void setDistrictOfOrigin(String districtOfOrigin) {
        this.districtOfOrigin = districtOfOrigin;
    }
    
    private long residentialDistrictId;
    public long getResidentialDistrictId() {
        return residentialDistrictId;
    }

    public void setResidentialDistrictId(long residentialDistrictId) {
        this.residentialDistrictId = residentialDistrictId;
    }
    
    private String residentialDistrict;
    public String getResidentialDistrict() {
        return residentialDistrict;
    }

    public void setResidentialDistrict(String residentialDistrict) {
        this.residentialDistrict = residentialDistrict;
    }

    private boolean isActive;
    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    private boolean isDeleted;
    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    private LocalDateTime createdOn;
    public LocalDateTime getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(LocalDateTime createdOn) {
        this.createdOn = createdOn;
    }

    private String createdBy;
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    private LocalDateTime lastModifiedOn;
    public LocalDateTime getLastModifiedOn() {
        return lastModifiedOn;
    }

    public void setLastModifiedOn(LocalDateTime lastModifiedOn) {
        this.lastModifiedOn = lastModifiedOn;
    }

    private String lastModifiedBy;
    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }
    
}
