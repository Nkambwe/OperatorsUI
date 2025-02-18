package com.kram.operators.models;

/**
 * Class handles user response
 * @author Macjohnan
 * @param <T> Class of type response
 */
public class UserResponse<T> {
    private T data;
    private boolean success;
    
    public UserResponse(T data, boolean success) {
        this.data = data;
        this.success = success;
    }
    
    public T getData() {
        return data;
    }
    
    public void setData(T data) {
        this.data = data;
    }
    
    public boolean isSuccess() {
        return success;
    }
    
    public void setSuccess(boolean success) {
        this.success = success;
    }
}

