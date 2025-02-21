package com.kram.operators.helpers;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.kram.operators.dtos.CurrentUser;
import com.kram.operators.models.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/** Application utilities class
 * Class holds utility methods for general functionalities
 * @author Macjohnan
 */
public class ApplicationUtilities {
    
    public static String getClientIP(HttpServletRequest request) {
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip != null) {
            System.out.println("USING X-FORWARDED-FOR");
            return ip;
        } else {
            return request.getRemoteAddr();
        }
    }
    
    public static boolean isPasswordComplex(String password) {

        boolean hasLetter = false;
        boolean hasDigit = false, hasNonAlphan = false;

        if (password.length() >= 8) {
            for (int i = 0; i < password.length(); i++) {
                char x = password.charAt(i);
                if (Character.isLetter(x)) {

                    hasLetter = true;
                } else if (Character.isDigit(x)) {

                    hasDigit = true;
                } else if (!Character.isLetterOrDigit(x)) {
                    hasNonAlphan = true;
                }

                // no need to check further, break the loop
                if (hasLetter && hasDigit && hasNonAlphan) {

                    return true;
                }

            }
            if (hasLetter && hasDigit && hasNonAlphan) {
                return true;
            } else {
                System.out.println("NOT STRONG");
            }
        } else {
            System.out.println("HAVE AT LEAST 8 CHARACTERS");
        }

        return false;
    }
    
    public static String getLoggedUserId(HttpSession session) {
        return getUserIdComplete(session);
    }

    public static String getUserId(HttpSession session) {
        return getUserIdComplete(session);
    }

    private static String getUserIdComplete(HttpSession session) {
        String Id = String.valueOf(session.getAttribute(AppConstants.USER_ID));
        return Id != null ? Id : "0";
    }
    
    public static String getBranchId(HttpSession session) {
        String Id = String.valueOf(session.getAttribute(AppConstants.BRANCH_ID));
        return Id != null ? Id : "0";
    }

    
    public static String getBranchCode(HttpSession session) {
        String code = (String) session.getAttribute(AppConstants.BRANCH_CODE); 
        return code != null ? code : "";
    }

    public static String injectSaltValue(HttpServletRequest request) {
        return "<input type=\"hidden\" value=\"" + getSalt(request) + "\" name=\"salt\"/>";
    }

    public static String getSalt(HttpServletRequest request) {
        return request.getAttribute("Salt").toString();
    }

    public static String getDBDateFormat(String ddmmmYYY) {
        //2017-06-30
        String[] tokens = ddmmmYYY.trim().split("/");
        return String.format("%s-%s-%s",tokens[2],tokens[1],tokens[0]); 

    }
    
    public static CurrentUser generateUser(User user) {
        if (user == null || user.getData() == null) {
            return null; // Handle null cases
        }
        return new CurrentUser(user);
    }
    
   public static boolean canPerformAction(String pageRole, String actionStr) {
        try {
            ArrayList<String> actions = new Gson().fromJson(actionStr, ArrayList.class);
            for (String action : actions) {
                if (action.equalsIgnoreCase(pageRole)) {
                    return true;
                }
            }
        } catch (JsonSyntaxException ex) {
            ex.printStackTrace();
        } catch (Exception ee) {
            ee.printStackTrace();
        }

        return false;
    }

}
