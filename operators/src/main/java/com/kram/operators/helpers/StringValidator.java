package com.kram.operators.helpers;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.util.ArrayList;

/** String Extension class
 * Class used to validate string variables
 * @author Macjohnan
 */
public class StringValidator {
    
    public static boolean isNullOrEmpty(String s) {
        return s == null || s.length() == 0;
    }

    public static boolean isNullOrWhitespace(String s) {
        return s == null || s.isBlank();

    }
    
    public static boolean isNullOrWhitespace(String[] s) {
        return s == null;

    }

    public static boolean hasSpace(String s) {
        
        if(s == null){
            throw new IllegalArgumentException("Invalid argument");
        }
        
        int length = s.length();
        if (length > 0) {
            for (int i = 0; i < length; i++) {
                if (!Character.isWhitespace(s.charAt(i))) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }
    
    /*Validate a numeric integer string*/
    public static String validateIntegerString(String value) throws NumberFormatException {
        
        if(value == null || value.isEmpty()){
           return "0";
        }
         
        int amtint=Integer.parseInt(value);
        return String.valueOf(amtint);
    }
    
    public static double convertToDouble(String value) throws NumberFormatException{
        if(value == null || value.isEmpty()){
           return 0;
        }
        
        return Double.parseDouble(value);
    }
    
    public static ArrayList<String> getActionsArray(String jsonArray) {

        try {

            ArrayList<String> result = new Gson().fromJson(jsonArray, new TypeToken<ArrayList<String>>() {
            }.getType());
            return result;
        } catch (JsonSyntaxException ex) {
            ex.printStackTrace();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        
        return new ArrayList<>();
    }
    
    public static String arrayToString(String[] list) {
        String result = "";
        for (String list1 : list) {
            result += String.format("%s,",list1);
        }
        return result.substring(0,(result.lastIndexOf(",")));
    }
    
    public static boolean isAlphaNumeric(String str) {
 
        // check for null & empty
        if(str == null || str.isEmpty() || str.length() == 0) {
 
            // return false
            return false;
        }
 
        // iterate through String - reading one character at a time
        for(int index = 0; index < str.length(); index++) {
            // get one character at a time
            char ch = str.charAt(index);
            // check passed character is alphanumeric
            if(!Character.isLetterOrDigit(ch)) {
                // return false
                return false;
            }
        }
 
        // otherwise, return true
        return true;
    }

   public static boolean isDigits(String input) {
        return input != null && !input.isEmpty() && input.chars().allMatch(Character::isDigit);
    }
   
}

