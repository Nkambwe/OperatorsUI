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
    
});

function showLoading() {
    $('#loading').css("display", "block");
}

function hideLoading() {
    $('#loading').css("display", "none");
}


