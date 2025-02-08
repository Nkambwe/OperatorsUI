package com.kram.operators.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kram.operators.helpers.AppConstants;
import com.kram.operators.helpers.AppSingleton;
import com.kram.operators.helpers.ApplicationLog;
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
    
    public User doLogin(String username, String password) {
        ApplicationLog.saveLog("Attempting to login user", "LOGINCONTROLLER");
        User user = null;
        //String userId = ApplicationUtilities.getUserId(session);
        
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
                user = (User) response.getData();
                ApplicationLog.saveLog("User account retrieved successfully", "LOGINCONTROLLER");
                if(user.getStatusCode() == AppConstants.CODE_SUCCESS){
                    ApplicationLog.saveLog("Record retrieved scuccessfully", "LOGINCONTROLLER");
                    this.session.setAttribute(AppConstants.USER_ID, user.getId());
                    this.session.setAttribute(AppConstants.KEY_LOGGEDIN, true);
                    this.session.setAttribute(AppConstants.KEY_ACTIVE, user.isActive());
                    this.session.setAttribute(AppConstants.KEY_VERIFIED, user.isVerified());
                    this.session.setAttribute(AppConstants.KEY_DELETED, user.isDeleted());
                    this.session.setAttribute(AppConstants.KEY_USER, user);
                    this.session.setAttribute(AppConstants.KEY_USERNAME, username);
                    this.session.setAttribute(AppConstants.KEY_PASSWORD, password);
                    this.session.setAttribute(AppConstants.EMPLOYEE_NAME, user.getEmployeeName());
                    this.session.setAttribute(AppConstants.EMPLOYEE_NO, user.getEmployeeNo());
                    this.session.setAttribute(AppConstants.PERMISSIONS, user.getPermissions());
                    this.session.setAttribute(AppConstants.USER_ROLEID, user.getRoleId());
                    this.session.setAttribute(AppConstants.USER_ROLE, user.getRole());
                    this.session.setAttribute(AppConstants.BRANCH_ID, user.getBranchId());
                    this.session.setAttribute(AppConstants.BRANCH_CODE, user.getBranchCode());
                    this.session.setAttribute(AppConstants.USER_EMAIL, user.getEmail());
                    this.session.setAttribute(AppConstants.KEY_PASSWORDID, user.getPasswordId());
                    this.session.setAttribute(AppConstants.KEY_EXPIRRPWD, user.getExpirePasswords());
                    this.session.setAttribute(AppConstants.KEY_EXPIRESINDAYS, user.getExpiresIn());
                    ApplicationLog.saveLog("ERROR :: " + user.getResponseMessage(), "LOGINCONTROLLER");
                    if (!AppConstants.ISLIVE) {
                            try{
                            System.out.println("SESSION :: " + new Gson().toJson(session)); 
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
                user = new User();
                user.setStatusCode(error.getStatusCode());
                user.setResponseMessage(error.getResponseMessage());
                user.setResponseDescription(error.getResponseDescription());
                ApplicationLog.saveLog("ERROR :: " + error.getResponseMessage(), "LOGINCONTROLLER");
            }
            
        } catch (IOException | InterruptedException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            ApplicationLog.saveLog(ex.toString(), "LOGINCONTROLLER");
        }
            
        
        return user;
    }
}
