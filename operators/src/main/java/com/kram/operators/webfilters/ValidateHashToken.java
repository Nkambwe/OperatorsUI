package com.kram.operators.webfilters;

import com.google.common.cache.Cache;
import com.kram.operators.helpers.AppConstants;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *Class checks whether a request has a valid hash token
 * @author Macjohnan
 */
public class ValidateHashToken implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
         // Assume its HTTP
        HttpServletRequest httpReq = (HttpServletRequest) request;

        // Get the salt sent with the request
        String salt = (String) httpReq.getParameter("Salt");

        // Validate that the salt is in the cache
        Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>) httpReq.getSession().getAttribute("SaltCache");
        if (httpReq.getSession().getAttribute(AppConstants.KEY_LOGGEDIN) != null) {

            completeDoFilter(httpReq, csrfPreventionSaltCache, salt, request, response, chain);
        } else if (httpReq.getMethod().equalsIgnoreCase("GET") && httpReq.getServletPath().contains("assets")) {
            chain.doFilter(request, response);

        } else if (httpReq.getMethod().equalsIgnoreCase("GET") && httpReq.getServletPath().equalsIgnoreCase("/resetpwd.jsp")) {
            chain.doFilter(request, response);
        } else if (httpReq.getMethod().equalsIgnoreCase("POST") && httpReq.getServletPath().equalsIgnoreCase("/resetpwd.jsp")) {
            chain.doFilter(request, response);

        } else if (httpReq.getMethod().equalsIgnoreCase("GET") && httpReq.getServletPath().equalsIgnoreCase("/login.jsp")) {
            chain.doFilter(request, response);
        } else if (httpReq.getServletPath().equalsIgnoreCase("/login.jsp")) {
            completeDoFilter(httpReq, csrfPreventionSaltCache, salt, request, response, chain);

        } else {
            HttpServletResponse resp = (HttpServletResponse) response;
            resp.sendRedirect("login.jsp");
        }
    }
    
     private void completeDoFilter(HttpServletRequest httpReq, Cache<String, Boolean> saltCache, String salt, ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        if (httpReq.getMethod().equalsIgnoreCase("POST")) {

            if (!AppConstants.ISLIVE) {
                System.out.println(String.format("SALT: %s  URL: %s",salt,httpReq.getServletPath()));
            }

            if (saltCache != null && salt != null && saltCache.getIfPresent(salt) != null) {
                chain.doFilter(request, response);

            } else if (request.getContentType() != null && request.getContentType().toLowerCase().contains("multipart/form-data")) {
                Object saltFromSession = httpReq.getSession().getAttribute("formValidation_");
                if (saltFromSession != null) {
                    if (!AppConstants.ISLIVE) {
                        System.out.println(String.format("Sesssion Salt:: %s URL:: %s",saltFromSession.toString(), httpReq.getServletPath()));
                    }

                    if (saltCache != null && saltCache.getIfPresent(saltFromSession.toString()) != null) {
                        chain.doFilter(request, response);
                    } else {

                        HttpServletResponse resp = (HttpServletResponse) response;
                        resp.sendRedirect("login.jsp");
                    }

                } else {

                    HttpServletResponse resp = (HttpServletResponse) response;
                    resp.sendRedirect("login.jsp");

                }
            } else {
                HttpServletResponse resp = (HttpServletResponse) response;
                resp.sendRedirect("login.jsp");
            }
        } else {
            chain.doFilter(request, response);
        }

    }
     
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}

