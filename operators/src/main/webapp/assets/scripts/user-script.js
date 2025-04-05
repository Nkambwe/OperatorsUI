function loadUsers(userList) {
    // Clear existing items to avoid duplicates
    userList.innerHTML = '';
   
    $.ajax({
        url: '/operators/user_list.jsp',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            const freshUsers = response.data || [];

            //Sort helper (by username, fallback to ID)
            //NOTE: needed for comparison of user data in case of modifications
            const sortUsers = (users) =>
                [...users].sort((a, b) =>
                    (a.username || '').localeCompare(b.username || '') ||
                    (a.id || 0) - (b.id || 0)
                );

            const storedUserRaw = JSON.parse(sessionStorage.getItem('users')) || [];
            
            //..we just need the user data
            const storedUsers = Array.isArray(storedUserRaw)
                ? storedUserRaw
                : (storedUserRaw?.data || []);

            console.log("Users >> " + freshUsers.length);
             // Handle no user data
            if (freshUsers.length === 0) {
                toggleNoDataLabel(userList, true);
            } else {
                toggleNoDataLabel(userList, false);
                const isDifferent = JSON.stringify(sortUsers(freshUsers)) !== JSON.stringify(sortUsers(storedUsers));
                if (isDifferent) {
                    sessionStorage.setItem('users', JSON.stringify(freshUsers));
                }

                // Render users (always from freshUsers)
                freshUsers.forEach(user => {
                    createUserItem(userList, user.username, user.fullName);
                });
            }
        },
        error: function () {
            console.error("Failed to fetch users from server.");

            let fallbackUsersRaw = JSON.parse(sessionStorage.getItem('users')) || [];
            const fallbackUsers = Array.isArray(fallbackUsersRaw)
                ? fallbackUsersRaw
                : (fallbackUsersRaw?.data || []);

             // Handle no user data
            if (fallbackUsers.length === 0) {
                toggleNoDataLabel(userList, true);
            } else {
                toggleNoDataLabel(userList, false);
                fallbackUsers.forEach(user => {
                    createUserItem(userList, user.username, user.fullName);
                });
            }
            
        }
    });
}

function addUser(userList){
    let users = [];
    userList.querySelectorAll('li').forEach(function(item){
        users.push({
            username: item.dataset.username,
            fullName: item.dataset.fullName
        });
    });
    
    sessionStorage.setItem('users', JSON.stringify(users));
}

function createUserItem(userList, username, fullname) {
    const item = document.createElement('li');
    item.classList.add('list-group-item');
    item.textContent = `${fullname} (${username})`;
    item.dataset.username = username;
    item.dataset.fullname = fullname;
    userList.appendChild(item);
}

function toggleNoDataLabel(userList, show) {
    let existing = userList.querySelector('.no-data-box');
    if (show) {
        if (!existing) {
            const li = document.createElement('li');
            li.className = 'no-data-box';
            li.innerHTML = '<span class="display-4">No Records</span>';
            userList.appendChild(li);
        }
    } else {
        if (existing) userList.removeChild(existing);
    }
}

$(document).ready(function () {
    const userList = document.getElementById('userList');
    loadUsers(userList);
    
    $("#usercreated").datetimepicker({
        "allowInputToggle": true,
        "showClose": true,
        "showClear": true,
        "showTodayButton": true,
        "format": "MM/DD/YYYY",
        "minDate": 3
    });
    
    $("#usermodified").datetimepicker({
        "allowInputToggle": true,
        "showClose": true,
        "showClear": true,
        "showTodayButton": true,
        "format": "MM/DD/YYYY",
        "minDate": 3
    });
            
});

