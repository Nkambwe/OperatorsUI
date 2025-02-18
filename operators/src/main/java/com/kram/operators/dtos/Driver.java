package com.kram.operators.dtos;

import java.time.LocalDateTime;

/**
 *
 * @author Macjohnan
 */
public class Driver {
    private String firstName;
    private String middleName;
    private String surname;
    private String whatsapp;
    private String facebook;
    private String otherSocialMedia;
    private String favoriteSocialMedia;
    private String primaryContact;
    private String alternativeContact;
    private String districtOfOrigin;
    private String residentialDistrict;
    private boolean isActive;
    private boolean isDeleted;
    private LocalDateTime createdOn;
    private String createdBy;
    private LocalDateTime lastModifiedOn;
    private String lastModifiedBy;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getWhatsapp() {
        return whatsapp;
    }

    public void setWhatsapp(String whatsapp) {
        this.whatsapp = whatsapp;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getOtherSocialMedia() {
        return otherSocialMedia;
    }

    public void setOtherSocialMedia(String otherSocialMedia) {
        this.otherSocialMedia = otherSocialMedia;
    }

    public String getFavoriteSocialMedia() {
        return favoriteSocialMedia;
    }

    public void setFavoriteSocialMedia(String favoriteSocialMedia) {
        this.favoriteSocialMedia = favoriteSocialMedia;
    }

    public String getPrimaryContact() {
        return primaryContact;
    }

    public void setPrimaryContact(String primaryContact) {
        this.primaryContact = primaryContact;
    }

    public String getAlternativeContact() {
        return alternativeContact;
    }

    public void setAlternativeContact(String alternativeContact) {
        this.alternativeContact = alternativeContact;
    }

    public String getDistrictOfOrigin() {
        return districtOfOrigin;
    }

    public void setDistrictOfOrigin(String districtOfOrigin) {
        this.districtOfOrigin = districtOfOrigin;
    }

    public String getResidentialDistrict() {
        return residentialDistrict;
    }

    public void setResidentialDistrict(String residentialDistrict) {
        this.residentialDistrict = residentialDistrict;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public LocalDateTime getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(LocalDateTime createdOn) {
        this.createdOn = createdOn;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDateTime getLastModifiedOn() {
        return lastModifiedOn;
    }

    public void setLastModifiedOn(LocalDateTime lastModifiedOn) {
        this.lastModifiedOn = lastModifiedOn;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }
    
}
