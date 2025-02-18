<%-- 
    Document   : login
    Created on : Jan 31, 2025, 7:05:11 PM
    Author     : Macjohnan
--%>

<%@page import="com.kram.operators.models.User"%>
<%@page import="com.kram.operators.controllers.LoginController"%>
<%@page import="com.kram.operators.middleware.MiddlewareService"%>
<%@page import="com.kram.operators.helpers.ApplicationUtilities"%>
<%@page import="com.kram.operators.helpers.StringValidator"%>
<%@page import="com.kram.operators.helpers.ApplicationLog"%>
<%@page import="com.kram.operators.helpers.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = null, alertClass = "alert-success", msg_type="Success";
    boolean invalidName = false;
    boolean invalidPassword = false;
    String username,password; 
    String class_validateName = "", validateNameMsg = "",class_validatepassword="",validatepasswordMsg="";

    if (session.getAttribute(AppConstants.KEY_LOGGEDIN) != null) {
        response.sendRedirect("index.jsp");
    } else {
    
        try{
            String ipAddress = ApplicationUtilities.getClientIP(request);
            System.out.println(String.format("IP Address :: %s",ipAddress));
            System.out.println(String.format("Method :: %s",request.getMethod()));
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                System.out.println("Posting request");
                username = request.getParameter("username"); 
                //validate username
                invalidName = StringValidator.isNullOrWhitespace(username);
                System.out.println(String.format("Username:: %s",username));
                if(!invalidName){
                    ApplicationLog.saveLog(String.format("Username:: %s", username), "USERNAME");
                    password = request.getParameter("password");
                    System.out.println(String.format("Password:: %s",password));
                    class_validateName ="valid-field";
                    ApplicationLog.saveLog(String.format("Password:: %s", password), "USERNAME");
                    //validate password
                    invalidPassword = StringValidator.isNullOrWhitespace(password);
                    if(!invalidPassword){
                        class_validatepassword ="valid-field";
                        //try logging
                        LoginController controller = new LoginController(session,ipAddress);

                        System.out.println("Calling doLogin method");
                        User user = controller.doLogin(username, password);
                        boolean checkExpiredPwd = user.getExpirePasswords();
                        ApplicationLog.saveLog(String.format("Success:: %s", user.getResponseCode()), "LOGINS");
                        if(user.getResponseCode() == AppConstants.CODE_SUCCESS){
                           
                            if(user.getPassword().trim().equals(password.trim())){
                                if(checkExpiredPwd){
                                    //check days remaining
                                    var remainders = (int)session.getAttribute(AppConstants.KEY_EXPIRESINDAYS); 
                                    System.out.println(String.format("%s Days left for password to expire", remainders));
                                    if(remainders == 0){
                                        msg ="Password expired";
                                        alertClass = "alert-danger";
                                        session.setAttribute(AppConstants.USER_ID, user.getId());
                                        session.setAttribute(AppConstants.KEY_PASSWORD, password);
                                        response.sendRedirect("reset_password.jsp");
                                    }

                                }
                                response.sendRedirect("index.jsp");
                            } else {
                                    msg_type = "Info!";
                                    alertClass = "alert-danger";
                                    msg = "Password is not correct. Please check your password and try again";
                                    validatepasswordMsg = "Your password is not correct";
                                    class_validatepassword ="invalid-field";
                            }
  
                        } else {
                            msg_type = "Error!";
                            alertClass = "alert-danger";
                            msg = user.getResponseMessage();
                        }
                    } else {
                        msg_type = "Error!";
                        msg = "Password id required";
                        alertClass = "alert-danger";
                        validatepasswordMsg = "Please enter password to login";
                        class_validatepassword ="invalid-field";
                    }
                } else {
                    msg_type = "Error!";
                    msg = "Username is not correct. Please check your username and try again";
                    alertClass = "alert-danger";
                    validateNameMsg = "Please enter correct username";
                    class_validateName ="invalid-field";
                }
            }
        } catch(Exception ex){
            msg_type = "System Error!";
            msg = "Possible connection error. Please try again later";
            ApplicationLog.saveLog(String.format("System Error! %s", ex.getMessage()), "LOGIN");
            ApplicationLog.saveLog(String.format("System Error! %s", ex), "STACKTRACE");
            alertClass = "alert-danger";
        }
        
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=AppConstants.APP_TITLE%> | LOGIN</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png"/>
        <link href="${pageContext.request.contextPath}/assets/styles/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/icons/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/styles/login-style.css" rel="stylesheet" type="text/css"/>
    </head>
    </head>
    <body onload="noBack();" onpageshow="if(event.persisted)noBack();">
       
        <section class="login-section"> 
            
            <% if (msg != null) {%>
                <div class="message-container">
                    
                    <div class="alert <%=alertClass%>">
                        <span><strong><%=msg_type%></strong> <%=msg%></span>
                    </div>
                        
                </div>
            <% }%>
            
            <div class="over-lay"></div>
            <div class="login-container">
                
                <form class="login-form" role="form" action="" method="POST" autocomplete="off" novalidate>
                    <% String ud1 = ApplicationUtilities.injectSaltValue(request);
                        System.out.println(ud1);
                        out.println(ud1);
                    %>
                    
                    <div class="login-header">
                        <span>Login</span>
                    </div>
  
                    <div class="login-input-box">
                        <!-- Username Input -->
                        <div class="input-group name-input">
                            
                            <div class="input_box">
                                <input id="username" type="text" class="username-input-field"
                                required name="username" readonly onfocus="this.removeAttribute('readonly');" 
                                onpaste="return false;" ondragstart="return false" onselectstart="return false">
                                <label class="label" for="username">Username</label>
                            </div>
                            <div class="<%=class_validateName%>"><%=validateNameMsg%></div>
                        </div>

                        <!-- Password Input -->
                        <div class="input-group password-input">
                            <div class="input_box">
                                <input id="password" type="password" class="password-input-field"
                                required name="password" readonly onfocus="this.removeAttribute('readonly');"  
                                onpaste="return false;" ondragstart="return false" onselectstart="return false">
                                <span id="passwordeye" class="passwsord-eye">
                                    <i class="mdi mdi-eye-outline"></i>
                                </span>
                                <label class="label" for="password">Password</label>
                            </div>
                            
                            <div class="<%=class_validatepassword%>"><%=validatepasswordMsg%></div>
                            
                        </div>
                        <div id="loading" class="row">
                            <img src="${pageContext.request.contextPath}/assets/images/loading1.gif" alt="loader"/>
                         </div>    
                        <!-- Submit Button -->
                        <div class="submit-box">
                            <button id="btn-login" class="btn-submit" type="submit" onsubmit="showLoading()">Login</button>
                        </div>
                    </div>
                </form>

            </div>
        </section>
        
        <div class="footer shadow-text">
            <%=AppConstants.APP_FOOTER%>
        </div>

        <script src="${pageContext.request.contextPath}/assets/scripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/login-script.js" type="text/javascript"></script>
        
    </body>
</html>
