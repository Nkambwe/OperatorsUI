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
    });
    
     // Add click event for red color button
    buttonRed.addEventListener('click', function() {
        updateColor('red');
    });
    
     // Add click event for purple color button
    buttonPurple.addEventListener('click', function() {
        updateColor('purple');
    });
    
     // Add click event for purple color button
    buttonYellow.addEventListener('click', function() {
        updateColor('yellow');
    });
    
     // Add click event for purple color button
    buttonAqua.addEventListener('click', function() {
        updateColor('aqua');
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
     // Retrieve the active item from localStorage
    const activeItem = localStorage.getItem('activeItem');
    console.log("Active Menu Item: " + activeItem);
    if (activeItem) {
        // Remove active from all
        $('.ops-side-bar-menu-item > a').removeClass('active-menu-item'); 
        
        // Set active to saved item
        $('#' + activeItem).addClass('active-menu-item'); 
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
