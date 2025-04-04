package com.kram.operators.dtos;

/**
 *
 * @author Macjohnan
 */
public class AppRole {
    private int id;
    public int getId() { return this.id; }
    public void setId(int id) { this.id = id; }
    
    private String roleName;
    public String getRoleName() { return roleName; }
    public void setRoleName(String roleName) { this.roleName = roleName; }
    
    private String description;
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    private boolean active;
    public boolean isActive() { return active; }
    public void setIsActive(boolean active) { this.active = active; }
    
    private String addedOn;
    public String getAddedOn() { return this.addedOn; }
    public void setAddedOn(String addedOn) { this.addedOn = addedOn; }
    
    private String addedBy;
    public String getAddedBy() { return addedBy; }
    public void setAddedBy(String addedBy) { this.addedBy = addedBy; }
    
    private String modifiedOn;
    public String getModifiedOn() { return this.modifiedOn; }
    public void setModifiedOn(String modifiedOn) { this.modifiedOn = modifiedOn; }
    
    private String modifiedBy;
    public String getModifiedBy() { return modifiedBy; }
    public void setModifiedBy(String modifiedBy) { this.modifiedBy = modifiedBy; }
}
