package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.dtos.CurrentUser;
import com.kram.operators.dtos.UserData;
import com.kram.operators.helpers.AppConstants;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.helpers.ApplicationUtilities;
import com.kram.operators.middleware.MiddlewareService;
import com.kram.operators.models.ErrorResponse;
import com.kram.operators.models.User;
import com.kram.operators.models.UserRequest;
import com.kram.operators.models.UserResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import static java.lang.reflect.Modifier.TRANSIENT;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/** Login Controller
 * Class handles login
 * @author Macjohnan
 */
public class LoginController {
    public static String ErrorMessage;
    private final HttpSession session;
    private final MiddlewareService apiMiddleware = new MiddlewareService();
    private final String clientIP;

    public LoginController(HttpSession session, String cleintip) {
        this.session = session;
        this.clientIP = cleintip;
        AppSingleton.getInstance().setClientIP(clientIP);

    }
    
    public CurrentUser doLogin(String username, String password) {
        ApplicationLog.saveLog("Attempting to login user", "LOGINCONTROLLER");
        CurrentUser cUser = null;

        try {
            //create request object
            UserRequest userRequest = new UserRequest();
            userRequest.setUsername(username);

            //create columns to decrypt
            String[] dycrypt = {"employeeNo", "email", "password", "employeeName", "addedBy", "modifiedBy"};
            userRequest.setDecrypt(dycrypt);

            UserResponse<Object> response;
            System.out.println("Decrypt Coloumsn :: %" + Arrays.toString(dycrypt));
            response = apiMiddleware.retrieveUser(userRequest);
            
            if (response.isSuccess()) {
                 User user = (User)response.getData();
                cUser = ApplicationUtilities.generateUser(user);
                ApplicationLog.saveLog("User account retrieved successfully", "LOGINCONTROLLER");
                ApplicationLog.saveLog("SUCCESS CODE:: " + cUser.getResponseCode(), "LOGINCONTROLLER");
                if(cUser.getResponseCode() == AppConstants.CODE_SUCCESS){
                    ApplicationLog.saveLog("Record retrieved scuccessfully", "LOGINCONTROLLER");
                    this.session.setAttribute(AppConstants.USER_ID, cUser.getId());
                    this.session.setAttribute(AppConstants.KEY_LOGGEDIN, true);
                    this.session.setAttribute(AppConstants.KEY_ACTIVE, cUser.isActive());
                    this.session.setAttribute(AppConstants.KEY_VERIFIED, cUser.isVerified());
                    this.session.setAttribute(AppConstants.KEY_DELETED, cUser.isDeleted());
                    this.session.setAttribute(AppConstants.KEY_USER, cUser);
                    this.session.setAttribute(AppConstants.KEY_USERNAME, cUser.getUsername());
                    this.session.setAttribute(AppConstants.KEY_PASSWORD, cUser.getPassword());
                    this.session.setAttribute(AppConstants.EMPLOYEE_NAME, cUser.getEmployeeName());
                    this.session.setAttribute(AppConstants.EMPLOYEE_NO, cUser.getEmployeeNo());
                    this.session.setAttribute(AppConstants.PERMISSIONS, cUser.getPermissions());
                    this.session.setAttribute(AppConstants.USER_ROLEID, cUser.getRoleId());
                    this.session.setAttribute(AppConstants.USER_ROLE, cUser.getRole());
                    this.session.setAttribute(AppConstants.BRANCH_ID, cUser.getBranchId());
                    this.session.setAttribute(AppConstants.BRANCH_CODE, cUser.getBranchCode());
                    this.session.setAttribute(AppConstants.BRANCH_NAME, cUser.getBranchName());
                    this.session.setAttribute(AppConstants.USER_EMAIL, cUser.getEmail());
                    this.session.setAttribute(AppConstants.KEY_PASSWORDID, cUser.getPasswordId());
                    this.session.setAttribute(AppConstants.KEY_EXPIRRPWD, cUser.getExpirePasswords());
                     ApplicationLog.saveLog(String.format("EXPIRED PASSWORD :: %s", cUser.getExpirePasswords()), "LOGINCONTROLLER");
                    this.session.setAttribute(AppConstants.KEY_EXPIRESINDAYS, cUser.getExpiresIn());
                    
                    System.out.println("Employee Name: " + cUser.getEmployeeName());
                    ApplicationLog.saveLog("ERROR :: " + user.getResponseMessage(), "LOGINCONTROLLER");
                    if (!AppConstants.ISLIVE) {
                            try{
                            System.out.println(String.format("SESSION :: %s",new Gson().toJson(session))); 
                            }catch(UnsupportedOperationException cc){
                                System.err.println("Error Printing session data:: "+cc.getMessage());
                                final Gson gson = new GsonBuilder()
                                    .excludeFieldsWithoutExposeAnnotation()
                                    .excludeFieldsWithModifiers(TRANSIENT)
                                    .create();
                            final String json = gson.toJson(session);
                            System.out.println(json);
                            }
                        }
                }
            } else {
                ErrorResponse error = (ErrorResponse) response.getData();
                User user = new User();
                user.setResponseCode(error.getResponseCode());
                user.setResponseMessage(error.getResponseMessage());
                user.setResponseDescription(error.getResponseDescription());
                user.setData(new UserData());
                
                cUser = ApplicationUtilities.generateUser(user);
                ApplicationLog.saveLog("ERROR :: " + error.getResponseMessage(), "LOGINCONTROLLER");
            }
            
        } catch (IOException | InterruptedException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            ApplicationLog.saveLog(ex.toString(), "LOGINCONTROLLER");
        }
            
        
        return cUser;
    }
}
