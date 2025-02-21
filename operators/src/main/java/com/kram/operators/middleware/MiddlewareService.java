package com.kram.operators.middleware;

import com.google.gson.FieldNamingPolicy;
import com.kram.operators.helpers.AppConstants;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.models.ErrorResponse;
import com.kram.operators.models.User;
import com.kram.operators.models.UserRequest;
import com.kram.operators.models.UserResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.kram.operators.dtos.SettingsRequest;
import com.kram.operators.dtos.UserData;
import com.kram.operators.models.AppResponse;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * Class connects application to API
 * @author Macjohnan
 */
public class MiddlewareService {
    private final String API_URL; 

    public MiddlewareService(){
        API_URL = AppConstants.BASE_URL; 
    }
    
    public UserResponse<Object> retrieveUser(UserRequest userRequest) throws IOException, InterruptedException {
        String url = String.format("%s/RetrieveUser", API_URL);

        // Create Gson with custom type adapter
        Gson gson = new GsonBuilder()
            .setLenient()
            // Ensures Gson only serializes annotated fields
            .excludeFieldsWithoutExposeAnnotation() 
            // Ensure Gson includes null fields instead of skipping them
            .serializeNulls()  
            // Preserve field names exactly
            .setFieldNamingPolicy(FieldNamingPolicy.IDENTITY) 
            .create();

        HttpClient client = createInsecureHttpClient();
        
        // Log the request body for debugging
        ApplicationLog.saveLog("RAW USEROBJECT : " + userRequest, "MIDDLEWARESERVICE");

        String requestBody = gson.toJson(userRequest);
        ApplicationLog.saveLog("Request body :: " + requestBody, "MIDDLEWARESERVICE");
        
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                .build();
                
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        
        try {
            ApplicationLog.saveLog("Processing login request", "MIDDLEWARESERVICE");
            
            // Log raw response for debugging
            String responseBody = response.body();
            ApplicationLog.saveLog("Raw response :: " + responseBody, "MIDDLEWARESERVICE");
            
            // Pre-process the response body to remove any invalid characters
            responseBody = responseBody.trim().replaceAll("[\\x00-\\x1F\\x7F]", "");
            
            JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
            
            // Check HTTP response code first
            if (response.statusCode() != 200) {
                ErrorResponse errorResponse = new ErrorResponse();
                errorResponse.setResponseCode(response.statusCode());
                errorResponse.setResponseMessage("HTTP Error: " + response.statusCode());
                errorResponse.setResponseDescription("Something went wrong");
                return new UserResponse<>(errorResponse, false);
            }
            
            // Check if response contains error properties
            if (jsonObject.has("responseCode")) {
                int statusCode = jsonObject.get("responseCode").getAsInt();
                ApplicationLog.saveLog("Response code :: " + statusCode, "MIDDLEWARESERVICE");
                String responseMessage = jsonObject.get("responseMessage").getAsString();
                ApplicationLog.saveLog("Response Message :: " + responseMessage, "MIDDLEWARESERVICE");
                String responseDescription = jsonObject.get("responseDescription").getAsString();
                ApplicationLog.saveLog("Response Descr :: " + responseDescription, "MIDDLEWARESERVICE");
                if (statusCode != 200) {
                    ErrorResponse errorResponse = gson.fromJson(jsonObject, ErrorResponse.class);
                    return new UserResponse<>(errorResponse, false);
                }
            }
            
            // Attempt to deserialize as User with detailed error handling
            try {
                //deserialize User object
                User user = gson.fromJson(jsonObject, User.class);
                if (user == null) {
                    throw new JsonSyntaxException("Failed to retrieve user record");
                }
                
                // Validate essential fields
                UserData data = user.getData();
                if(data == null){
                    throw new JsonSyntaxException("Missing 'data' object in response");
                } else {
                    // Extract the "data" object that contains user details
                    JsonObject dataObject = jsonObject.getAsJsonObject("data");

                    String jsonData = dataObject.toString();
                    ApplicationLog.saveLog("Extracted JSON Data: " + jsonData, "MIDDLEWARESERVICE");
                    
                    // Log deserialized object to verify
                    ApplicationLog.saveLog("Deserialized User: " + gson.toJson(user), "MIDDLEWARESERVICE");
                    
                }
                if (data.getUsername() == null || data.getEmployeeNo() == null) {
                    throw new JsonSyntaxException("Missing required user fields");
                }
                
                return new UserResponse<>(user, true);
            } catch (JsonSyntaxException e) {
                ApplicationLog.saveLog("User deserialization error :: " + e.getMessage(), "MIDDLEWARESERVICE");
                throw e; // Re-throw to be caught by outer catch block
            }
            
        } catch (JsonSyntaxException | JsonIOException e) {
            ErrorResponse errorResponse = new ErrorResponse();
            errorResponse.setResponseCode(500);
            errorResponse.setResponseMessage("Error parsing response");
            errorResponse.setResponseDescription(e.getMessage());
            
            ApplicationLog.saveLog("JSON parsing error :: " + e.getMessage(), "MIDDLEWARESERVICE");
            return new UserResponse<>(errorResponse, false);
        } catch (Exception e) {
            ErrorResponse errorResponse = new ErrorResponse();
            errorResponse.setResponseCode(500);
            errorResponse.setResponseMessage("Unexpected error");
            errorResponse.setResponseDescription(e.getMessage());
            
            ApplicationLog.saveLog("Unexpected error :: " + e.getMessage(), "MIDDLEWARESERVICE");
            return new UserResponse<>(errorResponse, false);
        }
    }
    
    /*Save settings*/
    public AppResponse saveSettings(SettingsRequest settings) {
        try {
            String url = String.format("%s/SaveConfigurations", API_URL);

            // Create Gson with custom configuration
            Gson gson = new GsonBuilder()
                .setLenient()
                .excludeFieldsWithoutExposeAnnotation()
                .serializeNulls()
                .setFieldNamingPolicy(FieldNamingPolicy.IDENTITY)
                .create();

            HttpClient client = createInsecureHttpClient();
            
            // Log the request object for debugging
            String requestBody = gson.toJson(settings);
            ApplicationLog.saveLog("SETTINGS REQUEST BODY :: " + requestBody, "MIDDLEWARESERVICE");
            
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                    .build();
                    
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            
            // Log raw response for debugging
            String responseBody = response.body();
            ApplicationLog.saveLog("RAW RESPONSE :: " + responseBody, "MIDDLEWARESERVICE");
            
            // Pre-process the response body to remove any invalid characters
            responseBody = responseBody.trim().replaceAll("[\\x00-\\x1F\\x7F]", "");
            
            JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
            
            // Check HTTP response code first
            if (response.statusCode() != 200) {
                AppResponse errorResponse = new AppResponse();
                errorResponse.setResponseCode(response.statusCode());
                errorResponse.setResponseMessage("HTTP Error: " + response.statusCode());
                errorResponse.setResponseDescription("Something went wrong");
                return errorResponse;
            }
            
            // Attempt to deserialize the response
            AppResponse appResponse = gson.fromJson(jsonObject, AppResponse.class);
            if (appResponse == null) {
                throw new JsonSyntaxException("Failed to parse response");
            }
            
            // Log the response code
            ApplicationLog.saveLog("Response code :: " + appResponse.getResponseCode(), "MIDDLEWARESERVICE");
            ApplicationLog.saveLog("Response Message :: " + appResponse.getResponseMessage(), "MIDDLEWARESERVICE");
            ApplicationLog.saveLog("Response Descr :: " + appResponse.getResponseDescription(), "MIDDLEWARESERVICE");
            
            return appResponse;
            
        } catch (JsonSyntaxException | JsonIOException e) {
            ApplicationLog.saveLog("JSON parsing error :: " + e.getMessage(), "MIDDLEWARESERVICE");
            AppResponse errorResponse = new AppResponse();
            errorResponse.setResponseCode(500);
            errorResponse.setResponseMessage("Error parsing response");
            errorResponse.setResponseDescription(e.getMessage());
            return errorResponse;
        } catch (IOException | InterruptedException e) {
            ApplicationLog.saveLog("Network error :: " + e.getMessage(), "MIDDLEWARESERVICE");
            AppResponse errorResponse = new AppResponse();
            errorResponse.setResponseCode(500);
            errorResponse.setResponseMessage("Network error occurred");
            errorResponse.setResponseDescription(e.getMessage());
            return errorResponse;
        } catch (Exception e) {
            ApplicationLog.saveLog("Unexpected error :: " + e.getMessage(), "MIDDLEWARESERVICE");
            AppResponse errorResponse = new AppResponse();
            errorResponse.setResponseCode(500);
            errorResponse.setResponseMessage("Unexpected error");
            errorResponse.setResponseDescription(e.getMessage());
            return errorResponse;
        }
    }
    
    /*User logout*/
    public boolean logout(String userId, String clientIP) {
        String action="Logged Out";
        //throw new UnsupportedOperationException("Inside Logout in API Service. Not implemented");
        return true;
    }
    
    // ✅ This method disables SSL verification for local development
    private HttpClient createInsecureHttpClient() {
        try {
            TrustManager[] trustAllCertificates = new TrustManager[]{
                new X509TrustManager() {
                    @Override
                    public void checkClientTrusted(X509Certificate[] certs, String authType) {}
                    @Override
                    public void checkServerTrusted(X509Certificate[] certs, String authType) {}
                    @Override
                    public X509Certificate[] getAcceptedIssuers() { return null; }
                }
            };

            SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(null, trustAllCertificates, new java.security.SecureRandom());

            return HttpClient.newBuilder().sslContext(sslContext).build();
        } catch (NoSuchAlgorithmException | KeyManagementException e) {
            throw new RuntimeException("Failed to create insecure SSL client", e);
        }
    }
    
}
