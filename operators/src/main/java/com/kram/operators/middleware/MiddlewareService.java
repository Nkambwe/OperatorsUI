package com.kram.operators.middleware;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kram.operators.helpers.AppConstants;
import com.kram.operators.helpers.ApplicationLog;
import com.kram.operators.models.ErrorResponse;
import com.kram.operators.models.User;
import com.kram.operators.models.UserRequest;
import com.kram.operators.models.UserResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
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
    
    public UserResponse<Object> retrieveUser(UserRequest userRequest) throws IOException, InterruptedException {
        String API_URL = AppConstants.BASE_URL + "/RetrieveUser";
        Gson gson = new Gson();

        HttpClient client = createInsecureHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(API_URL))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(gson.toJson(userRequest)))
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        try {
            ApplicationLog.saveLog("Processing login request", "MISDLEWARESERVICE");
            JsonObject jsonObject = JsonParser.parseString(response.body()).getAsJsonObject();
            ApplicationLog.saveLog("Request body :: " + response.body(), "MISDLEWARESERVICE");
            
            // Check if response contains error properties
            if (jsonObject.has("statusCode") && jsonObject.has("responseMessage")) {
                int statusCode = jsonObject.get("statusCode").getAsInt();
                ApplicationLog.saveLog("Request status code :: " + statusCode, "MISDLEWARESERVICE");
                // If status code is not 200, treat it as an ErrorResponse
                if (statusCode != 200) {
                    ErrorResponse errorResponse = gson.fromJson(jsonObject, ErrorResponse.class);
                    return new UserResponse<>(errorResponse, false);
                }
            }
            ApplicationLog.saveLog("Processing login request", "MISDLEWARESERVICE");
            // Deserialize as User
            User user = gson.fromJson(jsonObject, User.class);
            return new UserResponse<>(user, true);

        } catch (JsonSyntaxException e) {
            ErrorResponse errorResponse = new ErrorResponse();
            errorResponse.setStatusCode(500);
            errorResponse.setResponseMessage("Error parsing response");
            
            String msg = e.getMessage();
            errorResponse.setResponseDescription(msg);
            ApplicationLog.saveLog("System Error :: " + msg, "MISDLEWARESERVICE");
            return new UserResponse<>(errorResponse, false);
        }
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
    
    public boolean logout(String userId, String clientIP) {
        String action="Logged Out";
        //throw new UnsupportedOperationException("Inside Logout in API Service. Not implemented");
        return true;
    }
    
}
