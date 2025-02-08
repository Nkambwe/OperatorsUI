package com.kram.operators.webfilters;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;
import org.apache.commons.lang3.RandomStringUtils;

/**
 * Class used to load salt dor hashing passwords, security tokens, or session protection
 * @author Macjohnan
 */
public class HashingFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
          // Assume its HTTP
        HttpServletRequest httpReq = (HttpServletRequest) request;

        // Check the user session for the salt cache, if none is present we create one
        Cache<String, Boolean> saltCache = (Cache<String, Boolean>) httpReq.getSession().getAttribute("SaltCache");

        if (saltCache == null){
            saltCache = CacheBuilder.newBuilder()
                .maximumSize(5000)
                .expireAfterWrite(30, TimeUnit.MINUTES)
                .build();
            httpReq.getSession().setAttribute("SaltCache", saltCache);
        }

        // Generate the salt and store it in the users cache
        String salt = RandomStringUtils.random(10, 0, 0, true, true, null, new SecureRandom());
        saltCache.put(salt, Boolean.TRUE);

        // Add the salt to the current request so it can be used by the page rendered in this request
        httpReq.setAttribute("Salt", salt);
        System.out.println(String.format("Applying Filters Salt :: %s",salt));

        chain.doFilter(request, response);
    }
    
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}

