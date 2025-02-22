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
     
    public static List<String> getGeneralSettings() {
         return List.of(
            "includeDeletedObjects"
         );
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
            "workExperienceRequired",
            "markDriverAsDeleted"
        );
    }
    
    public static List<String> getEmployerSettings() {
        return List.of(
            "companyNameRequired",
            "companyAddressRequired",
            "contactPersonRequired",
            "contactPersonNumberRequired",
            "contactPersonIdCopyRequired",
            "idRequiredAtRegistration",
            "employerNameRequired",
            "employerAddressRequired",
            "employerContactNumberRequired",
            "employerIdRequired",
            "employerIdCopyRequired",
            "employerDistrictRequired",
            "employerEmailRequired",
            "employerAlternativeNumberRequired",
            "markEmployerAsDeleted"
        );
    }
    
    public static List<String> getMemberSettings() {
        return List.of(
            "memberFirstNameRequired",
            "memberIdRequired",
            "memberAddressRequired",
            "memberSurameRequired",
            "memberContactRequired",
            "memberIdCopyRequired",
            "memberDistrictRequired",
            "memberEmailRequired",
            "memberAlternativeNumberRequired",
            "markMemberAsDeleted"
        );
    }
    public static List<String> getUserSettings() {
        return List.of(
            "userFirstNameRequired",
            "userLastNameRequired",
            "userMiddleNameRequired",
            "uniqueUsername",
            "userEmailRequired",
            "uniqueUserEmail",
            "cannotVerifySame",
            "markUserAsDeleted",
            "lockUserAccount"
        );
    }
    
    public static List<String> getPasswordSettings() {
        return List.of(
            "expirePasswords",
            "reusePasswords",
            "strongPasswords"
        );
    }
    private static ArrayList<Attribute> getAttributes(){
        ArrayList<Attribute> list = new ArrayList<>();
        
        var includeDeletedObjects = new Attribute();
        includeDeletedObjects.setIdentifier(AppConstants.GENATRIB);
        includeDeletedObjects.setParameterName("includeDeletedObjects");
        includeDeletedObjects.setParameterValue(false);
        list.add(includeDeletedObjects);
        
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
        experience.setParameterName("workExperienceRequired");
        experience.setParameterValue(true);
        list.add(experience);
        
        var expireDays = new Attribute();
        expireDays.setIdentifier(AppConstants.DRVATRIB);
        expireDays.setParameterName("markDriverAsDeleted");
        expireDays.setParameterValue(true);
        list.add(expireDays);
        
        var companyNameRequired = new Attribute();
        companyNameRequired.setIdentifier(AppConstants.EMPATRIB);
        companyNameRequired.setParameterName("companyNameRequired");
        companyNameRequired.setParameterValue(true);
        list.add(companyNameRequired);
        
        var companyAddressRequired = new Attribute();
        companyAddressRequired.setIdentifier(AppConstants.EMPATRIB);
        companyAddressRequired.setParameterName("companyAddressRequired");
        companyAddressRequired.setParameterValue(true);
        list.add(companyAddressRequired);

        var contactPersonRequired = new Attribute();
        contactPersonRequired.setIdentifier(AppConstants.EMPATRIB);
        contactPersonRequired.setParameterName("contactPersonRequired");
        contactPersonRequired.setParameterValue(true);
        list.add(contactPersonRequired);
         
        var contactPersonNumberRequired = new Attribute();
        contactPersonNumberRequired.setIdentifier(AppConstants.EMPATRIB);
        contactPersonNumberRequired.setParameterName("contactPersonNumberRequired");
        contactPersonNumberRequired.setParameterValue(true);
        list.add(contactPersonNumberRequired);

        var contactPersonIdCopyRequired = new Attribute();
        contactPersonIdCopyRequired.setIdentifier(AppConstants.EMPATRIB);
        contactPersonIdCopyRequired.setParameterName("contactPersonIdCopyRequired");
        contactPersonIdCopyRequired.setParameterValue(true);
        list.add(contactPersonIdCopyRequired);

        var idRequiredAtRegistration = new Attribute();
        idRequiredAtRegistration.setIdentifier(AppConstants.EMPATRIB);
        idRequiredAtRegistration.setParameterName("idRequiredAtRegistration");
        idRequiredAtRegistration.setParameterValue(true);
        list.add(idRequiredAtRegistration);

        var employerNameRequired = new Attribute();
        employerNameRequired.setIdentifier(AppConstants.EMPATRIB);
        employerNameRequired.setParameterName("employerNameRequired");
        employerNameRequired.setParameterValue(true);
        list.add(employerNameRequired);

        var employerAddressRequired = new Attribute();
        employerAddressRequired.setIdentifier(AppConstants.EMPATRIB);
        employerAddressRequired.setParameterName("employerAddressRequired");
        employerAddressRequired.setParameterValue(true);
        list.add(employerAddressRequired);

        var employerContactNumberRequired = new Attribute();
        employerContactNumberRequired.setIdentifier(AppConstants.EMPATRIB);
        employerContactNumberRequired.setParameterName("employerContactNumberRequired");
        employerContactNumberRequired.setParameterValue(true);
        list.add(employerContactNumberRequired);

        var employerIdRequired = new Attribute();
        employerIdRequired.setIdentifier(AppConstants.EMPATRIB);
        employerIdRequired.setParameterName("employerIdRequired");
        employerIdRequired.setParameterValue(true);
        list.add(employerIdRequired);

        var employerIdCopyRequired = new Attribute();
        employerIdCopyRequired.setIdentifier(AppConstants.EMPATRIB);
        employerIdCopyRequired.setParameterName("employerIdCopyRequired");
        employerIdCopyRequired.setParameterValue(true);
        list.add(employerIdCopyRequired);

        var employerDistrictRequired = new Attribute();
        employerDistrictRequired.setIdentifier(AppConstants.EMPATRIB);
        employerDistrictRequired.setParameterName("employerDistrictRequired");
        employerDistrictRequired.setParameterValue(true);
        list.add(employerDistrictRequired);

        var employerEmailRequired = new Attribute();
        employerEmailRequired.setIdentifier(AppConstants.EMPATRIB);
        employerEmailRequired.setParameterName("employerEmailRequired");
        employerEmailRequired.setParameterValue(true);
        list.add(employerEmailRequired);

        var employerAlternativeNumberRequired = new Attribute();
        employerAlternativeNumberRequired.setIdentifier(AppConstants.EMPATRIB);
        employerAlternativeNumberRequired.setParameterName("employerAlternativeNumberRequired");
        employerAlternativeNumberRequired.setParameterValue(true);
        list.add(employerAlternativeNumberRequired);

        var markEmployerAsDeleted = new Attribute();
        markEmployerAsDeleted.setIdentifier(AppConstants.EMPATRIB);
        markEmployerAsDeleted.setParameterName("markEmployerAsDeleted");
        markEmployerAsDeleted.setParameterValue(true);
        list.add(markEmployerAsDeleted);
        
        var memberFirstNameRequired = new Attribute();
        memberFirstNameRequired.setIdentifier(AppConstants.MEMATRIB);
        memberFirstNameRequired.setParameterName("memberFirstNameRequired");
        memberFirstNameRequired.setParameterValue(true);
        list.add(memberFirstNameRequired);
       
        var memberIdRequired = new Attribute();
        memberIdRequired.setIdentifier(AppConstants.MEMATRIB);
        memberIdRequired.setParameterName("memberIdRequired");
        memberIdRequired.setParameterValue(true);
        list.add(memberIdRequired);
        
        var memberAddressRequired = new Attribute();
        memberAddressRequired.setIdentifier(AppConstants.MEMATRIB);
        memberAddressRequired.setParameterName("memberAddressRequired");
        memberAddressRequired.setParameterValue(true);
        list.add(memberAddressRequired);

        var memberSurameRequired = new Attribute();
        memberSurameRequired.setIdentifier(AppConstants.MEMATRIB);
        memberSurameRequired.setParameterName("memberSurameRequired");
        memberSurameRequired.setParameterValue(true);
        list.add(memberSurameRequired);

        var memberContactRequired = new Attribute();
        memberContactRequired.setIdentifier(AppConstants.MEMATRIB);
        memberContactRequired.setParameterName("memberContactRequired");
        memberContactRequired.setParameterValue(true);
        list.add(memberContactRequired);
        
        var memberIdCopyRequired = new Attribute();
        memberIdCopyRequired.setIdentifier(AppConstants.MEMATRIB);
        memberIdCopyRequired.setParameterName("memberIdCopyRequired");
        memberIdCopyRequired.setParameterValue(true);
        list.add(memberIdCopyRequired);

        var memberDistrictRequired = new Attribute();
        memberDistrictRequired.setIdentifier(AppConstants.MEMATRIB);
        memberDistrictRequired.setParameterName("memberDistrictRequired");
        memberDistrictRequired.setParameterValue(true);
        list.add(memberDistrictRequired);

        var memberEmailRequired = new Attribute();
        memberEmailRequired.setIdentifier(AppConstants.MEMATRIB);
        memberEmailRequired.setParameterName("memberEmailRequired");
        memberEmailRequired.setParameterValue(true);
        list.add(memberEmailRequired);

        var memberAlternativeNumberRequired = new Attribute();
        memberAlternativeNumberRequired.setIdentifier(AppConstants.MEMATRIB);
        memberAlternativeNumberRequired.setParameterName("memberAlternativeNumberRequired");
        memberAlternativeNumberRequired.setParameterValue(true);
        list.add(memberAlternativeNumberRequired);

        var markMemberAsDeleted = new Attribute();
        markMemberAsDeleted.setIdentifier(AppConstants.MEMATRIB);
        markMemberAsDeleted.setParameterName("markMemberAsDeleted");
        markMemberAsDeleted.setParameterValue(true);
        list.add(markMemberAsDeleted);
        
        var userFirstNameRequired = new Attribute();
        userFirstNameRequired.setIdentifier(AppConstants.USEATRIB);
        userFirstNameRequired.setParameterName("userFirstNameRequired");
        userFirstNameRequired.setParameterValue(true);
        list.add(userFirstNameRequired);
        
        var userLastNameRequired = new Attribute();
        userLastNameRequired.setIdentifier(AppConstants.USEATRIB);
        userLastNameRequired.setParameterName("userLastNameRequired");
        userLastNameRequired.setParameterValue(true);
        list.add(userLastNameRequired);
        
        var userMiddleNameRequired = new Attribute();
        userMiddleNameRequired.setIdentifier(AppConstants.USEATRIB);
        userMiddleNameRequired.setParameterName("userMiddleNameRequired");
        userMiddleNameRequired.setParameterValue(true);
        list.add(userMiddleNameRequired);
        
        var uniqueUsername = new Attribute();
        uniqueUsername.setIdentifier(AppConstants.USEATRIB);
        uniqueUsername.setParameterName("uniqueUsername");
        uniqueUsername.setParameterValue(true);
        list.add(uniqueUsername);
        
        var userEmailRequired = new Attribute();
        userEmailRequired.setIdentifier(AppConstants.USEATRIB);
        userEmailRequired.setParameterName("userEmailRequired");
        userEmailRequired.setParameterValue(true);
        list.add(userEmailRequired);
        
        var uniqueUserEmail = new Attribute();
        uniqueUserEmail.setIdentifier(AppConstants.USEATRIB);
        uniqueUserEmail.setParameterName("uniqueUserEmail");
        uniqueUserEmail.setParameterValue(true);
        list.add(uniqueUserEmail);
        
        var cannotVerifySame = new Attribute();
        cannotVerifySame.setIdentifier(AppConstants.USEATRIB);
        cannotVerifySame.setParameterName("cannotVerifySame");
        cannotVerifySame.setParameterValue(true);
        list.add(cannotVerifySame);
        
        var markUserAsDeleted = new Attribute();
        markUserAsDeleted.setIdentifier(AppConstants.USEATRIB);
        markUserAsDeleted.setParameterName("markUserAsDeleted");
        markUserAsDeleted.setParameterValue(true);
        list.add(markUserAsDeleted);

        var lockUserAccount = new Attribute();
        lockUserAccount.setIdentifier(AppConstants.USEATRIB);
        lockUserAccount.setParameterName("lockUserAccount");
        lockUserAccount.setParameterValue(true);
        list.add(lockUserAccount);
        
        var expirePasswords = new Attribute();
        expirePasswords.setIdentifier(AppConstants.PWDATRIB);
        expirePasswords.setParameterName("expirePasswords");
        expirePasswords.setParameterValue(true);
        list.add(expirePasswords);
        
        var reusePasswords = new Attribute();
        reusePasswords.setIdentifier(AppConstants.PWDATRIB);
        reusePasswords.setParameterName("reusePasswords");
        reusePasswords.setParameterValue(true);
        list.add(reusePasswords);
        
        var strongPasswords = new Attribute();
        strongPasswords.setIdentifier(AppConstants.PWDATRIB);
        strongPasswords.setParameterName("strongPasswords");
        strongPasswords.setParameterValue(true);
        list.add(strongPasswords);
        
        return list;
    }
}
