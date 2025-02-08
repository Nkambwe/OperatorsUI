/* 
    Created on : Jan 30, 2025, 7:05:30 AM
    Author     : Macjohnan
*/

$(document).ready(function () {
    hideLoading();
    
    // Toggle menu on slide button click
    $('.slide-button').click(function() {
        $('body').toggleClass('menu-expanded');
    });

    // Close menu when clicking outside
    $('.main-content-container').click(function() {
        if ($('body').hasClass('menu-expanded')) {
            $('body').removeClass('menu-expanded');
        }
    });
    
     // Handle menu item clicks
    $('.menu-item > a').click(function(e) {
        e.preventDefault();
        
        const menuItem = $(this).parent();
        const subMenu = menuItem.find('.menu-sub-menu');
        
        if (subMenu.length) {
            // Toggle submenu
            subMenu.toggleClass('expanded');
            menuItem.toggleClass('expanded');
        } else {
            // Handle click on items without submenu
            $('.menu-item > a').removeClass('active');
            $(this).addClass('active');
        }
    });
    
    // Handle submenu item clicks
    $('.menu-list-item').click(function() {
        // Remove active class from all items
        $('.menu-list-item').removeClass('active');
        $('.menu-item').removeClass('has-active-child');
        
        // Add active class to clicked item
        $(this).addClass('active');
        
        // Add active class to parent menu item
        $(this).closest('.menu-item').addClass('has-active-child');
    });
    
    // Optional: Expand menu item if it contains active submenu item
    if ($('.menu-list-item.active').length) {
        $('.menu-list-item.active')
            .closest('.menu-sub-menu')
            .addClass('expanded')
            .closest('.menu-item')
            .addClass('expanded has-active-child');
    }
    
});

function showLoading() {
    $('#loading').css("display", "block");
}

function hideLoading() {
    $('#loading').css("display", "none");
}


