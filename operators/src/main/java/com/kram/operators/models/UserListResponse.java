package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 * @param <T> App user data object
 */
public class UserListResponse<T> extends AppUserResponse<T> {
    @SerializedName("meta")
    @Expose
    private PageMeta meta;
    public PageMeta getMeta() { return meta; }
    public void setMeta(PageMeta meta) { this.meta = meta; }
}
