
package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 * @param <T> Role return type
 */
public class RoleListResponse<T> extends RoleResponse<T>  {
    
    @SerializedName("meta")
    @Expose
    private PageMeta meta;
    public PageMeta getMeta() { return meta; }
    public void setMeta(PageMeta meta) { this.meta = meta; }
    
}
