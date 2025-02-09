/* 
    Created on : Jan 30, 2025, 7:05:30 AM
    Author     : Macjohnan
*/

$(document).ready(function () {
    hideLoading();
    
    //handle menu state
    const sidebarState = localStorage.getItem('sidebarState');
    console.log("Sidebar State: " + sidebarState);
    
    // If the stored state is 'collapsed', add the class to body on page load
    if (sidebarState === 'expanded') {
        $('body').addClass('menu-expanded');
        $(window).trigger('resize');
    } else {
        $('body').removeClass('menu-expanded');
    }
    
    // Retrieve the active item from localStorage
    const activeItem = localStorage.getItem('activeItem');
    console.log("Active Menu Item: " + activeItem);
    if (activeItem) {
        // Remove active from all
        $('.menu-item > a').removeClass('active'); 
        
        // Set active to saved item
        $('#' + activeItem).addClass('active'); 
    } 

    // Toggle menu on slide button click
    $('.slide-button').click(function() {
         if ($('body').hasClass('menu-expanded')) {
            localStorage.setItem('sidebarState', 'collapsed');
            $('body').toggleClass('menu-expanded');
        } else {
            localStorage.setItem('sidebarState', 'expanded');
            $('body').toggleClass('menu-expanded');
        }
    });

    // Close menu when clicking outside
    $('.main-content-container').click(function() {
        if ($('body').hasClass('menu-expanded')) {
            $('body').removeClass('menu-expanded');
        }
    });
    
     // Handle menu item clicks
    $('.menu-item > a').click(function(e) {
        // Remove active class from all
        $('.menu-item > a').removeClass('active'); 
        
        // Add active class to clicked item
        $(this).addClass('active'); 

        // Store the clicked item's id in localStorage
        localStorage.setItem('activeItem', $(this).attr('id'));
    });
    
    // Handle submenu item clicks
    $('.menu-list-item').click(function() {
        // Remove active class from all items
        $('.menu-list-item').removeClass('active');
        $('.menu-item').removeClass('has-active-child');
        
        // Add active class to clicked item
        $(this).addClass('active');
    });
});

function showLoading() {
    $('#loading').css("display", "block");
}

function hideLoading() {
    $('#loading').css("display", "none");
}


