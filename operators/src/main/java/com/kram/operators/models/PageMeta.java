package com.kram.operators.models;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Macjohnan
 */
public class PageMeta {
    @SerializedName("count")
    @Expose
    private int count;
    public int getCount() { return this.count; }
    public void seCount(int count) { this.count = count; }
    
    @SerializedName("pageSize")
    @Expose
    private int pageSize;
    public int getPageSize() { return this.pageSize; }
    public void setPageSize(int pageSize) { this.pageSize = pageSize; }
    
    @SerializedName("pageNumber")
    @Expose
    private int pageNumber;
    public int getPageNumber() { return this.pageNumber; }
    public void setPageNumber(int pageNumber) { this.pageNumber = pageNumber; }

    @SerializedName("totalPages")
    @Expose
    private int totalPages;
    public int getTotalPages() { return this.totalPages; }
    public void setTotalPages(int totalPages) { this.totalPages = totalPages; }
}
