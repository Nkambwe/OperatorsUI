function loadRoles(roleList) {
    // Clear existing items to avoid duplicates
    roleList.innerHTML = '';
   
    $.ajax({
        url: '/operators/roles_list.jsp',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            const freshRoles = response.data || [];

            //Sort helper (by roleName, fallback to ID)
            //NOTE: needed for comparison of roles data in case of modifications
            const sortRoles = (roles) =>
                [...roles].sort((a, b) =>
                    (a.roleName || '').localeCompare(b.roleName || '') ||
                    (a.id || 0) - (b.id || 0)
                );

            const storedRolesRaw = JSON.parse(sessionStorage.getItem('roles')) || [];
            
            //..we just need the role data
            const storedRoles = Array.isArray(storedRolesRaw)
                ? storedRolesRaw
                : (storedRolesRaw?.data || []);
            console.log("Roles >> " + freshRoles.length);
             // Handle no roles
            if (freshRoles.length === 0) {
                toggleNoDataLabel(roleList, true);
            } else {
                toggleNoDataLabel(roleList, false);
                const isDifferent = JSON.stringify(sortRoles(freshRoles)) !== JSON.stringify(sortRoles(storedRoles));
                if (isDifferent) {
                    sessionStorage.setItem('roles', JSON.stringify(freshRoles));
                }

                // Render roles (always from freshRoles)
                freshRoles.forEach(role => {
                    createRoleItem(roleList, role.roleName, role.description);
                });
            }
        },
        error: function () {
            console.error("Failed to fetch roles from server.");

            let fallbackRolesRaw = JSON.parse(sessionStorage.getItem('roles')) || [];
            const fallbackRoles = Array.isArray(fallbackRolesRaw)
                ? fallbackRolesRaw
                : (fallbackRolesRaw?.data || []);

             // Handle no roles
            if (fallbackRoles.length === 0) {
                toggleNoDataLabel(roleList, true);
            } else {
                toggleNoDataLabel(roleList, false);
                fallbackRoles.forEach(role => {
                    createRoleItem(roleList, role.roleName, role.description);
                });
            }
            
        }
    });
}

function addRole(roleList){
    let roles = [];
    roleList.querySelectorAll('li').forEach(function(item){
        roles.push({
            roleName: item.dataset.roleName,
            description: item.dataset.description
        });
    });
    
    sessionStorage.setItem('roles', JSON.stringify(roles));
}

function createRoleItem(roleList, roleName, description) {
    const item = document.createElement('li');
    item.textContent = `${roleName} - ${description}`;
    item.dataset.roleName = roleName;
    item.dataset.description = description;
    roleList.appendChild(item);
}

function toggleNoDataLabel(roleList, show) {
    let existing = roleList.querySelector('.no-data-box');
    if (show) {
        if (!existing) {
            const li = document.createElement('li');
            li.className = 'no-data-box';
            li.innerHTML = '<span class="display-4">No Records</span>';
            roleList.appendChild(li);
        }
    } else {
        if (existing) roleList.removeChild(existing);
    }
}

$(document).ready(function () {
    const roleName = document.getElementById('roleName');
    const roleDiscription = document.getElementById('roleDecription');
    const roleButton = document.getElementById('roleBtn');
    const roleList = document.getElementById('roleList');
    
    $('#roleBtn').on('click', function () {
        var role = roleName.value.trim();
        var description = roleDiscription.value.trim();

        if (role !== "" && description !== "") {
            createRoleItem(roleList, role, description);
            addRole(roleList);

            roleName.value = '';
            roleDiscription.value = '';
        } else {
            alert('Please enter a role');
        }
    });
    
    //load roles
    loadRoles(roleList);
});

