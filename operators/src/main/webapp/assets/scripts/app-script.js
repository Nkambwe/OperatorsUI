/* 
    Created on : Jan 30, 2025, 7:05:30 AM
    Author     : Macjohnan
*/

$(document).ready(function () {
    hideLoading();
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
