<%-- 
    Document   : roles_page
    Created on : Apr 5, 2025, 7:42:35 AM
    Author     : Macjohnan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <div class="section-main-content">  
                        
    <!--container for child pages-->
    <div id="overlay">
        <div id="parent-container" class="page-container" data-child="no-child"></div>
    </div>

    <div class="page-content">
        <div class="role-container">   
            
            <div class="role-list-container">
                <div class="role-list-add-container">
                    <form id="role-form">

                        <div class="mb-3">
                            <label for="roleName" class="form-label">Role</label>
                            <input id="roleName" name="roleName" class="form-control form-control-sm" type="text" placeholder="Role Name" aria-label="Role Name">
                        </div>
                        <div class="mb-3">
                            <label for="roleDecription" class="form-label">Description</label>
                            <input id="roleDecription" name="roleDecription" class="form-control form-control-sm" type="text" placeholder="Description" aria-label="Description">
                        </div>
                        <div class="mb-3">
                            <button id="roleBtn" type="button" class="btn btn-primary">Add</button>
                        </div>
                    </form>

                    <div class="role-list-box">
                         <ul id="roleList" class="role-list"></ul>
                    </div>

                </div>
            </div>

            <div class="role-details-container"></div>
        </div>
    </div>

</div>
