package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.dtos.AppRole;
import com.kram.operators.dtos.AppUser;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import com.kram.operators.models.AppUserResponse;
import com.kram.operators.models.UserListResponse;
import com.kram.operators.models.RoleListResponse;
import com.kram.operators.models.RoleResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Macjohnan
 */
public class AccessController {
    
    public static String ErrorMessage;
    private final HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    private final String clientIP;
    
    public AccessController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);
    }
    
    public RoleListResponse<List<AppRole>> getRoles(){
        RoleListResponse<List<AppRole>> response = new RoleListResponse<>();
        Gson gson = new GsonBuilder().create();
        try{
            ApplicationLog.saveLog("Get all roles records", "ACCESSCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("Role accessed by user ID :: %d", userId), "ACCESSCONTROLLER");
            
            List<AppRole> roles = new ArrayList<>();
            AppRole user1 = new AppRole();
            user1.setId(1);
            user1.setRoleName("Administrator");
            user1.setDescription("System Administrator");
            user1.setIsActive(true);
            user1.setAddedOn("2025-01-23");
            user1.setAddedBy("System");
            user1.setModifiedOn("2025-01-25");
            user1.setModifiedBy("Mark");
            roles.add(user1);

            AppRole user2 = new AppRole();
            user2.setId(2);
            user2.setRoleName("Customer care");
            user2.setDescription("Customer Support");
            user2.setIsActive(true);
            user2.setAddedOn("2025-02-12");
            user2.setAddedBy("System");
            user2.setModifiedOn("2025-02-12");
            user2.setModifiedBy("Mark");
            roles.add(user2);

            AppRole user3 = new AppRole();
            user3.setId(3);
            user3.setRoleName("System User");
            user3.setDescription("Super User");
            user3.setIsActive(true);
            user3.setAddedOn("2025-01-20");
            user3.setAddedBy("System");
            user3.setModifiedOn("2025-01-23");
            user3.setModifiedBy("Mark");
            roles.add(user3);          
            
            AppRole user4 = new AppRole();
            user4.setId(4);
            user4.setRoleName("IT Personnel");
            user4.setDescription("IT Department");
            user4.setIsActive(true);
            user4.setAddedOn("2025-01-20");
            user4.setAddedBy("System");
            user4.setModifiedOn("2025-01-23");
            user4.setModifiedBy("Mark");
            roles.add(user4);            
            response.setData(roles);
        } catch(NumberFormatException ex){
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "ACCESSCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "ACCESSCONTROLLER");
        }
        
        return response;
    }
    
    public RoleResponse<AppRole> getRoleById(long roleId){
        RoleResponse<AppRole> response = new RoleResponse<>();
        Gson gson = new GsonBuilder().create();
        
        try{
            ApplicationLog.saveLog("Get role for ID >> " + roleId, "ACCESSCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("Role accessed by user ID :: %d", userId), "ACCESSCONTROLLER");
            
            AppRole role = new AppRole();
            role.setId(1);
            role.setRoleName("Administrator");
            role.setDescription("System Administrator");
            role.setIsActive(true);
            role.setAddedOn("2025-01-23");
            role.setAddedBy("System");
            role.setModifiedOn("2025-01-25");
            role.setModifiedBy("Mark");
            response.setData(role);
        } catch(NumberFormatException ex){
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "ACCESSCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "ACCESSCONTROLLER");
        }
        
        return response;
    }
    
    public RoleResponse<AppRole> getRoleByName(String roleName){
        RoleResponse<AppRole> response = new RoleResponse<>();
        Gson gson = new GsonBuilder().create();
        
        try{
            ApplicationLog.saveLog("Get role for Name >> " + roleName, "ACCESSCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("Role accessed by user ID :: %d", userId), "ACCESSCONTROLLER");
            
            AppRole role = new AppRole();
            role.setId(1);
            role.setRoleName("Administrator");
            role.setDescription("System Administrator");
            role.setIsActive(true);
            role.setAddedOn("2025-01-23");
            role.setAddedBy("System");
            role.setModifiedOn("2025-01-25");
            role.setModifiedBy("Mark");
            response.setData(role);
        } catch(NumberFormatException ex){
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "ACCESSCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "ACCESSCONTROLLER");
        }
        
        return response;
    }
    
     public UserListResponse<List<AppUser>> getUsers(){
        UserListResponse<List<AppUser>> response = new UserListResponse<>();
        Gson gson = new GsonBuilder().create(); 
        try{
         
            ApplicationLog.saveLog("Get all user records", "ACCESSCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User records accessed by user ID :: %d", userId), "ACCESSCONTROLLER");
            
            List<AppUser> users = new ArrayList<>();
            AppUser user1 = new AppUser();
            user1.setId(1);
            user1.setFirstName("Mark");
            user1.setMiddleName("John");
            user1.setLastName("Nkambwe");
            user1.setUsername("mnkambwe");
            user1.setFullName("Nkambwe John Mark");
            user1.setEmail("jo.jomac.mac801@gmail.com");
            user1.setRoleId(1);
            user1.setRole("Administrator");
            user1.setBranchId(1);
            user1.setBranchName("Head Office");
            user1.setIsActive(true);
            user1.setIsVerified(true);
            user1.setIsDeleted(false);
            user1.setAddedOn("2025-01-23");
            user1.setAddedBy("System");
            user1.setModifiedOn("2025-01-25");
            user1.setModifiedBy("Jack");
            user1.setLastLogin("2025-02-15");
            users.add(user1);

            AppUser user2 = new AppUser();
            user2.setId(2);
            user2.setFirstName("Annet");
            user2.setMiddleName("Sophia");
            user2.setLastName("Namala");
            user2.setUsername("anamala");
            user2.setFullName("Namala Sophia Annet");
            user2.setEmail("anamala@gmail.com");
            user2.setRoleId(1);
            user2.setRole("Data Agent");
            user2.setBranchId(1);
            user2.setBranchName("Head Office");
            user2.setIsActive(true);
            user2.setIsVerified(true);
            user2.setIsDeleted(false);
            user2.setAddedOn("2025-02-12");
            user2.setAddedBy("System");
            user2.setModifiedOn("2025-02-12");
            user2.setModifiedBy("Paul");
            user2.setLastLogin("2025-02-14");
            users.add(user2);

            AppUser user3 = new AppUser();
            user3.setId(3);
            user3.setFirstName("Smith");
            user3.setMiddleName("Jack");
            user3.setLastName("Opolot");
            user3.setUsername("jsopolot");
            user3.setFullName("Opolot Jack Smith");
            user3.setEmail("jsopolot@gmail.com");
            user3.setRoleId(1);
            user3.setRole("Accountant");
            user3.setBranchId(1);
            user3.setBranchName("Head Office");
            user3.setIsActive(true);
            user3.setIsVerified(true);
            user3.setIsDeleted(false);
            user3.setAddedOn("2025-01-20");
            user3.setAddedBy("System");
            user3.setModifiedOn("2025-01-23");
            user3.setModifiedBy("Mark");
            user3.setLastLogin("2025-02-15");
            users.add(user3);
    
            response.setData(users);
        } catch(NumberFormatException ex){
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "ACCESSCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "ACCESSCONTROLLER");
        }
        
        return response;
     }
     
     public AppUserResponse<AppUser> getUserById(long id){
        AppUserResponse<AppUser> response = new AppUserResponse<>();
        Gson gson = new GsonBuilder().create(); 
        try{
         
            ApplicationLog.saveLog("Get user record", "ACCESSCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User record accessed by user ID :: %d", userId), "ACCESSCONTROLLER");
            
            AppUser user1 = new AppUser();
            user1.setId(1);
            user1.setFirstName("Mark");
            user1.setMiddleName("John");
            user1.setLastName("Nkambwe");
            user1.setUsername("mnkambwe");
            user1.setFullName("Nkambwe John Mark");
            user1.setEmail("jo.jomac.mac801@gmail.com");
            user1.setRoleId(1);
            user1.setRole("Administrator");
            user1.setBranchId(1);
            user1.setBranchName("Head Office");
            user1.setIsActive(true);
            user1.setIsVerified(true);
            user1.setIsDeleted(false);
            user1.setAddedOn("2025-01-23");
            user1.setAddedBy("System");
            user1.setModifiedOn("2025-01-25");
            user1.setModifiedBy("Jack");
            user1.setLastLogin("2025-02-15");
            
            response.setData(user1);
        } catch(NumberFormatException ex){
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "ACCESSCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "ACCESSCONTROLLER");
        }
        
        return response;
     }
     
     public AppUserResponse<AppUser> getRoleByUsername(String username){
        AppUserResponse<AppUser> response = new AppUserResponse<>();
        Gson gson = new GsonBuilder().create(); 
        try{
            
            ApplicationLog.saveLog("Get user record", "ACCESSCONTROLLER");
            int userId = Integer.parseInt(ApplicationUtilities.getUserId(session));
            ApplicationLog.saveLog(String.format("User record accessed by user ID :: %d", userId), "ACCESSCONTROLLER");
            
            AppUser user1 = new AppUser();
            user1.setId(1);
            user1.setFirstName("Mark");
            user1.setMiddleName("John");
            user1.setLastName("Nkambwe");
            user1.setUsername("mnkambwe");
            user1.setFullName("Nkambwe John Mark");
            user1.setEmail("jo.jomac.mac801@gmail.com");
            user1.setRoleId(1);
            user1.setRole("Administrator");
            user1.setBranchId(1);
            user1.setBranchName("Head Office");
            user1.setIsActive(true);
            user1.setIsVerified(true);
            user1.setIsDeleted(false);
            user1.setAddedOn("2025-01-23");
            user1.setAddedBy("System");
            user1.setModifiedOn("2025-01-25");
            user1.setModifiedBy("Jack");
            user1.setLastLogin("2025-02-15");
            
            response.setData(user1);
        } catch(NumberFormatException ex){
            response.setResponseCode(400);
            response.setResponseDescription("An error occurred.");
            response.setResponseMessage(ex.getMessage());
            String responseBody = gson.toJson(response);
            ApplicationLog.saveLog(String.format("RESPONSE ERROR :: %s", responseBody), "ACCESSCONTROLLER");
            ApplicationLog.saveLog(ApplicationLog.getStackTraceAsString(ex), "ACCESSCONTROLLER");
        }
        
        return response;
     }
     
}
