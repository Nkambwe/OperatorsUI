package com.kram.operators.helpers;

import com.kram.operators.dtos.Attribute;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Macjohnan
 */
public class AttributeList {
    
    //drivers
     public static ArrayList<Attribute> getAttributes(String identifier) {
        return getAttributes().stream()
            .filter(a -> a.getIdentifier().equals(identifier))
            .collect(Collectors.toCollection(ArrayList::new));
    }
     
    public static List<String> getDriverSettings() {
        return List.of(
            "surnameNameRequired",
            "firstNameRequired",
            "otherNameRequired",
            "dobRequired",
            "idRequired",
            "idRequiredAtRegistration",
            "homeDistrict",
            "residenceDistrict",
            "emailAddress",
            "phoneNumber",
            "socialMedia",
            "academicInfo",
            "academicDocumentsRequired",
            "licenceRequired",
            "copyOfLicenceRequired",
            "refereesRequired",
            "copyOfReferenceRequired",
            "experience",
            "expireDays"
        );
    }
    
    public static List<String> getEmployerSettings() {
        return List.of(
            "surnameNameRequired",
            "firstNameRequired",
            "otherNameRequired",
            "dobRequired",
            "idRequired",
            "idRequiredAtRegistration",
            "homeDistrict",
            "residenceDistrict",
            "emailAddress",
            "phoneNumber",
            "socialMedia",
            "academicInfo",
            "academicDocumentsRequired",
            "licenceRequired",
            "copyOfLicenceRequired",
            "refereesRequired",
            "copyOfReferenceRequired",
            "experience",
            "expireDays"
        );
    }
    
    public static List<String> getMemberSettings() {
        return List.of(
            "surnameNameRequired",
            "firstNameRequired",
            "otherNameRequired",
            "dobRequired",
            "idRequired",
            "idRequiredAtRegistration",
            "homeDistrict",
            "residenceDistrict",
            "emailAddress",
            "phoneNumber",
            "socialMedia",
            "academicInfo",
            "academicDocumentsRequired",
            "licenceRequired",
            "copyOfLicenceRequired",
            "refereesRequired",
            "copyOfReferenceRequired",
            "experience",
            "expireDays"
        );
    }
    public static List<String> getUserSettings() {
        return List.of(
            "surnameNameRequired",
            "firstNameRequired",
            "otherNameRequired",
            "dobRequired",
            "idRequired",
            "idRequiredAtRegistration",
            "homeDistrict",
            "residenceDistrict",
            "emailAddress",
            "phoneNumber",
            "socialMedia",
            "academicInfo",
            "academicDocumentsRequired",
            "licenceRequired",
            "copyOfLicenceRequired",
            "refereesRequired",
            "copyOfReferenceRequired",
            "experience",
            "expireDays"
        );
    }
    
    public static List<String> getPasswordSettings() {
        return List.of(
            "surnameNameRequired",
            "firstNameRequired",
            "otherNameRequired",
            "dobRequired",
            "idRequired",
            "idRequiredAtRegistration",
            "homeDistrict",
            "residenceDistrict",
            "emailAddress",
            "phoneNumber",
            "socialMedia",
            "academicInfo",
            "academicDocumentsRequired",
            "licenceRequired",
            "copyOfLicenceRequired",
            "refereesRequired",
            "copyOfReferenceRequired",
            "experience",
            "expireDays"
        );
    }
    private static ArrayList<Attribute> getAttributes(){
        ArrayList<Attribute> list = new ArrayList<>();
        var surnameNameRequired = new Attribute();
        surnameNameRequired.setIdentifier(AppConstants.DRVATRIB);
        surnameNameRequired.setParameterName("surnameNameRequired");
        surnameNameRequired.setParameterValue(true);
        list.add(surnameNameRequired);
        
        var firstNameRequired = new Attribute();
        firstNameRequired.setIdentifier(AppConstants.DRVATRIB);
        firstNameRequired.setParameterName("firstNameRequired");
        firstNameRequired.setParameterValue(true);
        list.add(firstNameRequired);
        
        var otherNameRequired = new Attribute();
        otherNameRequired.setIdentifier(AppConstants.DRVATRIB);
        otherNameRequired.setParameterName("otherNameRequired");
        otherNameRequired.setParameterValue(true);
        list.add(otherNameRequired);
        
        var dobRequired = new Attribute();
        dobRequired.setIdentifier(AppConstants.DRVATRIB);
        dobRequired.setParameterName("dobRequired");
        dobRequired.setParameterValue(true);
        list.add(dobRequired);
        
        var idRequired = new Attribute();
        idRequired.setIdentifier(AppConstants.DRVATRIB);
        idRequired.setParameterName("idRequired");
        idRequired.setParameterValue(true);
        list.add(idRequired);
        
        var idRequiredAtReqgistration = new Attribute();
        idRequiredAtReqgistration.setIdentifier(AppConstants.DRVATRIB);
        idRequiredAtReqgistration.setParameterName("idRequiredAtReqgistration");
        idRequiredAtReqgistration.setParameterValue(true);
        list.add(idRequiredAtReqgistration);
        
        var homeDistrict = new Attribute();
        homeDistrict.setIdentifier(AppConstants.DRVATRIB);
        homeDistrict.setParameterName("homeDistrict");
        homeDistrict.setParameterValue(true);
        list.add(homeDistrict);
        
        var residenceDistrict = new Attribute();
        residenceDistrict.setIdentifier(AppConstants.DRVATRIB);
        residenceDistrict.setParameterName("residenceDistrict");
        residenceDistrict.setParameterValue(true);
        list.add(residenceDistrict);
        
        var emailAddress = new Attribute();
        emailAddress.setIdentifier(AppConstants.DRVATRIB);
        emailAddress.setParameterName("emailAddress");
        emailAddress.setParameterValue(true);
        list.add(emailAddress);
        
        var phoneNumber = new Attribute();
        phoneNumber.setIdentifier(AppConstants.DRVATRIB);
        phoneNumber.setParameterName("phoneNumber");
        phoneNumber.setParameterValue(true);
        list.add(phoneNumber);
        
        var socialMedia = new Attribute();
        socialMedia.setIdentifier(AppConstants.DRVATRIB);
        socialMedia.setParameterName("socialMedia");
        socialMedia.setParameterValue(true);
        list.add(socialMedia);
        
        var academicInfo = new Attribute();
        academicInfo.setIdentifier(AppConstants.DRVATRIB);
        academicInfo.setParameterName("academicInfo");
        academicInfo.setParameterValue(true);
        list.add(academicInfo);
        
        var academicDocumentsRequired = new Attribute();
        academicDocumentsRequired.setIdentifier(AppConstants.DRVATRIB);
        academicDocumentsRequired.setParameterName("academicDocumentsRequired");
        academicDocumentsRequired.setParameterValue(true);
        list.add(academicDocumentsRequired);
        
        var licienceRequired = new Attribute();
        licienceRequired.setIdentifier(AppConstants.DRVATRIB);
        licienceRequired.setParameterName("licienceRequired");
        licienceRequired.setParameterValue(true);
        list.add(licienceRequired);
        
        var copyOfLicienceRequired = new Attribute();
        copyOfLicienceRequired.setIdentifier(AppConstants.DRVATRIB);
        copyOfLicienceRequired.setParameterName("copyOfLicienceRequired");
        copyOfLicienceRequired.setParameterValue(true);
        list.add(copyOfLicienceRequired);
        
        var refereesRequired = new Attribute();
        refereesRequired.setIdentifier(AppConstants.DRVATRIB);
        refereesRequired.setParameterName("refereesRequired");
        refereesRequired.setParameterValue(true);
        list.add(refereesRequired);
        
        var copyOfReferenceRequired = new Attribute();
        copyOfReferenceRequired.setIdentifier(AppConstants.DRVATRIB);
        copyOfReferenceRequired.setParameterName("copyOfReferenceRequired");
        copyOfReferenceRequired.setParameterValue(true);
        list.add(copyOfReferenceRequired);
        
        var experience = new Attribute();
        experience.setIdentifier(AppConstants.DRVATRIB);
        experience.setParameterName("experience");
        experience.setParameterValue(true);
        list.add(experience);
        
        var expireDays = new Attribute();
        expireDays.setIdentifier(AppConstants.DRVATRIB);
        expireDays.setParameterName("expireDays");
        expireDays.setParameterValue(true);
        list.add(expireDays);
        
        return list;
    }
}
