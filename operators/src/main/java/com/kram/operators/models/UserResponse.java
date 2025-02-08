package com.kram.operators.models;

/**
 * Class handles user response
 * @author Macjohnan
 * @param <T> Class of type response
 */
public class UserResponse<T> {
    private final T data;
    private final boolean isSuccess;

    public UserResponse(T data, boolean isSuccess) {
        this.data = data;
        this.isSuccess = isSuccess;
    }

    public T getData() { return data; }
    public boolean isSuccess() { return isSuccess; }
}

