/* 
    Created on : Jan 30, 2025, 7:05:30 AM
    Author     : Macjohnan
*/

document.addEventListener('DOMContentLoaded', function() {
    // Get the elements
    const lightButton = document.querySelector('.btn-light-theme');
    const darkButton = document.querySelector('.btn-black-theme');
    const themeSelected = document.querySelector('.theme-selected');

    // Add click event for light theme button
    lightButton.addEventListener('click', function() {
      updateTheme('light');
    });

    // Add click event for dark theme button
    darkButton.addEventListener('click', function() {
      updateTheme('dark');
    });

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
  
    // Function to save theme preference using your controller
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
