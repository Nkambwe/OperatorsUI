package com.kram.operators.helpers;
import java.text.SimpleDateFormat;
import java.util.Date;

/**Class manages application constants
 * @version 1.0

 * @author Macjohnan
 */
public class AppConstants {
    public static final String BASE_URL = "https://localhost:7134/middleware";
    public final static boolean ISLIVE = false; 
    public final static String APP_TITLE = "OPERATOR";
    public final static String KEY_LOGGEDIN = "logged_in";
    public final static String KEY_ACTIVE = "active";
    public final static String KEY_VERIFIED = "verified";
    public final static String KEY_DELETED = "deleted";   
    public final static String KEY_USER = "logged_user";
    public final static String KEY_ID = "logged_user_id";
    public final static String KEY_LEVEL = "logged_user_level";
    public final static String USER_ID = "userID";
    public final static String KEY_USERNAME = "username";
    public final static String USER_ROLEID = "role_id";
    public final static String USER_ROLE = "role";
    public final static String EMPLOYEE_NO = "employee_no";
    public final static String EMPLOYEE_NAME = "employee_name";
    public final static String BRANCH_ID = "branch_id";
    public final static String BRANCH_CODE = "branch_code";
    public final static String KEY_PASSWORD = "Key_password";
    public final static int CODE_SUCCESS = 200;
    public final static String PERMISSIONS = "permissions";
    public static String KEY_PASSWORD_EXPIRY = "passwordEXpryDate";
    public final static String USER_EMAIL = "email";
    public final static String KEY_PASSWORDID="pwd_id";
    public final static String KEY_EXPIRRPWD="pwd_exp";
    public final static String KEY_EXPIRESINDAYS="pwd_days"; 
    public final static String CURRENT_PAGE="current_page";
    public final static String DRVATRIB = "DRVATRIB";
    public final static String EMPATRIB = "EMPATRIB";
    public final static String MEMATRIB = "MEMATRIB";
    public final static String USEATRIB = "USEATRIB";
    public final static String PWDATRIB = "PWDATRIB";
    
    public final static String APP_FOOTER = String.format("Operactor 1.0 &copy 2024 - %s. Kram Software",new SimpleDateFormat("yyyy").format(new Date()));

}
