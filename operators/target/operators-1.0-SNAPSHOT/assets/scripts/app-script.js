/* 
    Created on : Jan 30, 2025, 7:05:30 AM
    Author     : Macjohnan
*/

document.addEventListener('DOMContentLoaded', function() {
    // Get the elements
    const lightButton = document.querySelector('.btn-light-theme');
    const darkButton = document.querySelector('.btn-black-theme');
    const themeSelected = document.querySelector('.theme-selected');
    
    const buttonGreen  = document.querySelector('.btn-green-clr');
    const buttonGreenConts  = document.querySelector('.theme-button-color-green');
    const buttonRed  = document.querySelector('.btn-red-clr');
    const buttonRedConts  = document.querySelector('.theme-button-color-red');
    const buttonPurple  = document.querySelector('.btn-purple-clr');
    const buttonPurpleConts  = document.querySelector('.theme-button-color-purple');
    const buttonYellow  = document.querySelector('.btn-yellow-clr');
    const buttonYellowConts  = document.querySelector('.theme-button-color-yellow');
    const buttonAqua  = document.querySelector('.btn-aqua-clr');
    const buttonAquaConts  = document.querySelector('.theme-button-color-aqua');
    
    
    // Select the first non-empty container
    const container = $(".ops-base-container").length 
        ? $(".ops-base-container") 
        : $(".ops-dashboard-container");
    
    const sidebarToggle = $(".ops-side-bar-expand");
    const savedState = localStorage.getItem("sidebarState");
    
    // Apply saved state from localStorage
    if (savedState) {
        container.attr("data-sidebar-state", savedState);
    }
    
    // Add click event for light theme button
    lightButton.addEventListener('click', function() {
      updateTheme('light');
    });

    // Add click event for dark theme button
    darkButton.addEventListener('click', function() {
      updateTheme('dark');
    });
    
     // Add click event for green color button
    buttonGreen.addEventListener('click', function() {
        updateColor('green');
        
        //update logo
        updateThemeImages('green');
    });
    
     // Add click event for red color button
    buttonRed.addEventListener('click', function() {
        updateColor('red');
        
        //update logo
        updateThemeImages('red');
    });
    
     // Add click event for purple color button
    buttonPurple.addEventListener('click', function() {
        updateColor('purple');
        
        //update logo
        updateThemeImages('purple');
    });
    
     // Add click event for purple color button
    buttonYellow.addEventListener('click', function() {
        updateColor('yellow');
        
        //update logo
        updateThemeImages('yellow'); 
    });
    
     // Add click event for purple color button
    buttonAqua.addEventListener('click', function() {
        updateColor('aqua');
        
        //update logo
        updateThemeImages('aqua'); 
        
    });
    
    // Toggle sidebar on click
    sidebarToggle.on("click", function () {
        // Only proceed if a container exists
        if (container.length > 0) {
            const currentState = container.attr("data-sidebar-state");
            const newState = currentState === "expanded" ? "collapsed" : "expanded";

            container.attr("data-sidebar-state", newState);

            // Debugging: Log state change
            console.log("Toggling sidebar:", currentState, "→", newState);

            // Save new state in localStorage
            localStorage.setItem("sidebarState", newState);
        } else {
            console.warn("Cannot toggle sidebar: No container found");
        }
    });

    function updateColor(color){
        switch(color){
            case 'red':
                buttonRedConts.classList.add('active-color');
                buttonGreenConts.classList.remove('active-color');
                buttonPurpleConts.classList.remove('active-color');
                buttonYellowConts.classList.remove('active-color');
                buttonAquaConts.classList.remove('active-color');
                break;
            case 'purple':
                buttonPurpleConts.classList.add('active-color');
                buttonRedConts.classList.remove('active-color');
                buttonGreenConts.classList.remove('active-color');
                buttonYellowConts.classList.remove('active-color');
                buttonAquaConts.classList.remove('active-color');
                break;
            case 'yellow':
                buttonYellowConts.classList.add('active-color');
                buttonRedConts.classList.remove('active-color');
                buttonGreenConts.classList.remove('active-color');
                buttonPurpleConts.classList.remove('active-color');
                buttonAquaConts.classList.remove('active-color');
                break;
            case 'aqua':
                buttonAquaConts.classList.add('active-color');
                buttonRedConts.classList.remove('active-color');
                buttonGreenConts.classList.remove('active-color');
                buttonPurpleConts.classList.remove('active-color');
                buttonYellowConts.classList.remove('active-color');
                break;
            default:
                buttonGreenConts.classList.add('active-color');
                buttonRedConts.classList.remove('active-color');
                buttonAquaConts.classList.remove('active-color');
                buttonPurpleConts.classList.remove('active-color');
                buttonYellowConts.classList.remove('active-color');
                break;
        }
        
        // Update CSS links
        const styleLinks = document.querySelectorAll('link[rel="stylesheet"][href*="app-styles.css"], link[rel="stylesheet"][href*="sidebar-style.css"]');

        styleLinks.forEach(link => {
          const currentHref = link.getAttribute('href');
          // Replace light- or dark- with the new theme prefix
          const newHref = currentHref.replace(/(green-|red-|yellow-|purple-|aqua-)/, color + '-');
          link.setAttribute('href', newHref);
        });
        
        // Save theme preference to database via AJAX
        saveThemeColor(color);
        
    }

    // Function to update theme
    function updateTheme(theme) {
        // Update button styles
        if (theme === 'light') {
          darkButton.classList.remove('active-theme');
          lightButton.classList.add('active-theme');
          themeSelected.textContent = 'Light mode';
        } else {
          lightButton.classList.remove('active-theme');
          darkButton.classList.add('active-theme');
          themeSelected.textContent = 'Dark mode';
        }

        // Update CSS links
        const styleLinks = document.querySelectorAll('link[rel="stylesheet"][href*="app-styles.css"], link[rel="stylesheet"][href*="sidebar-style.css"]');

        styleLinks.forEach(link => {
          const currentHref = link.getAttribute('href');
          // Replace light- or dark- with the new theme prefix
          const newHref = currentHref.replace(/(light-|dark-)/, theme + '-');
          link.setAttribute('href', newHref);
        });
        
        // Save theme preference to database via AJAX
        saveThemePreference(theme);
    }
    
    // Function to save theme color
    function saveThemeColor(color) {
        // Create XMLHttpRequest
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'updateThemeColor.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up callback
        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4) {
            if (xhr.status === 200) {
              const response = JSON.parse(xhr.responseText);
              if (response.responseCode === 200) {
                console.log(response.responseMessage);
              } else {
                console.error('Failed to update theme color:', response.responseMessage);
              }
            } else {
              console.error('Error saving theme color');
            }
          }
        };

        // Send the request with the theme color
        xhr.send('color=' + encodeURIComponent(color));
    }
  
    // Function to save theme preference
    function saveThemePreference(theme) {
        // Create XMLHttpRequest
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'updateTheme.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up callback
        xhr.onreadystatechange = function() {
          if (xhr.readyState === 4) {
            if (xhr.status === 200) {
              const response = JSON.parse(xhr.responseText);
              if (response.responseCode === 200) {
                console.log(response.responseMessage);
              } else {
                console.error('Failed to update theme:', response.responseMessage);
              }
            } else {
              console.error('Error saving theme preference');
            }
          }
        };

        // Send the request with the theme parameter
        xhr.send('theme=' + encodeURIComponent(theme));
    }
  });

$(document).ready(function () {
    hideLoading();
    const lightButton = document.querySelector('.btn-light-theme');
    const darkButton = document.querySelector('.btn-black-theme');
    const themeSelected = document.querySelector('.theme-selected');
    
    // Make theme values available to JavaScript

    console.log("Active Theme " + themeName);

    // Update button styles based on theme name
    if (themeName === 'light') {
      darkButton.classList.remove('active-theme');
      lightButton.classList.add('active-theme');
      themeSelected.textContent = 'Light mode';
    } else if (themeName === 'dark') {
      lightButton.classList.remove('active-theme');
      darkButton.classList.add('active-theme');
      themeSelected.textContent = 'Dark mode';
    }
    
    
    // setting current color
    $('.color-buttons-container [class*="theme-button-color-"]').removeClass('active-color');
    $(`.color-buttons-container .theme-button-color-${themeColor}`).addClass('active-color');
  
     // Retrieve the active item from localStorage
    const activeItem = localStorage.getItem('activeItem');
    console.log("Active Menu Item: " + activeItem);
    if (activeItem) {
        // Remove active from all
        $('.ops-side-bar-menu-item > a').removeClass('active-menu-item'); 
        
        // Set active to saved item
        $('#' + activeItem).addClass('active-menu-item'); 
        
        //redirect to active page
        redirectToPage(activeItem);
    } 
    
     // Handle menu item clicks
    $('.ops-side-bar-menu-item > a').click(function() {
        //e.preventDefault();
        // Remove active class from all
        $('.ops-side-bar-menu-item > a').removeClass('active-menu-item'); 
        
        // Add active class to clicked item
        $(this).addClass('active-menu-item'); 
        
        // Store the clicked item's id in localStorage
        localStorage.setItem('activeItem', $(this).attr('id'));
    });
    
    // Handle submenu item clicks
    $('.menu-list-item').click(function(e) {
        e.preventDefault();
        // Remove active class from all items
        $('.menu-list-item').removeClass('active-menu-item');
        $('.ops-side-bar-menu-item').removeClass('has-active-child');
        
        // Add active class to clicked item
        $(this).addClass('active-menu-item');
        
    });
    
    $('#btn-user').on('click', function() {
        $(".user-settings-slide")
            .removeClass('hide-user-settings') 
            .addClass('show-user-settings');
    });

    $('.btn-settings-close').on('click', function() {
        $(".user-settings-slide")
            .removeClass('show-user-settings')
            .addClass('hide-user-settings');
    });   
});

function on(){
    $("#overlay").css('display', 'block');
}

// Back button functionality
function back() {
    $("#overlay").css('display', 'none');
    $('.page-container').removeClass('show-page');
}
    
function childBack() {
    $("#page-overlay").css('display', 'none');
};

 // Function to show overlay
function showOverlay() {
    $("#overlay").css("display", "block");
}

// Function to hide overlay
function hideOverlay() {
    $("#overlay").css("display", "none");
    $('.page-container').removeClass('show-page');
}

function showLoading() {
    $('#loading').css("display", "block");
}

function hideLoading() {
    $('#loading').css("display", "none");
}

function redirectToPage(activeItem){
    // Define page mappings
    const pageMappings = {
        "menu_dashboard_link": "index.jsp",
        "menu_drivers_link": "drivers.jsp",
        "menu_employers_link": "employer.jsp",
        "menu_members_link": "members.jsp",
        "menu_analytics_link": "analytics.jsp",
        "menu_branches_link": "access_branches.jsp",
        "menu_users_link": "access_users.jsp",
        "menu_roles_link": "access_roles.jsp",
        "menu_permissions_link": "access_permissions.jsp",
        "menu_settings_link": "settings.jsp"
    };
    
    // Get the current page filename
    const currentPage = window.location.pathname.split('/').pop();
    
    // Only redirect if we're not already on the correct page
    if (pageMappings[activeItem] && currentPage !== pageMappings[activeItem]) {
        console.log("Redirecting to: " + pageMappings[activeItem]);
        window.location.href = pageMappings[activeItem];
    }
}

function updateThemeImages(theme) {
    // Target specifically the image with id img-logo
    const logoImage = document.getElementById('img-logo');
    
    if (logoImage) {
        // Get the current image source
        const currentSrc = logoImage.getAttribute('src');
        
        // Extract the path and filename
        const pathParts = currentSrc.split('/');
        const filename = pathParts[pathParts.length - 1];
        
        // Replace the color/theme prefix in the filename
        const newFilename = theme + '.png';
        
        // Reconstruct the full path
        pathParts[pathParts.length - 1] = newFilename;
        const newSrc = pathParts.join('/');
        
        // Update the image source
        logoImage.setAttribute('src', newSrc);
    }
}
