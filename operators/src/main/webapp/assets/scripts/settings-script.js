$(document).ready(function () {
    // Get the element with id="defaultTab" and click on it
    $("#defaultTab").trigger('click');
    
    // Option 2: Using the specific input class (more direct)
    $(document).on('change', '.driver-attribute', function() {
        $(this).val($(this).prop('checked') ? 'YES' : 'NO');
    });
});

function openTab(e, tabId) {
    // Hide all tab content and remove active class
    $(".tabcontent").removeClass("tabContent-active");
    
    // Remove active class from all tabs
    $(".tablinks").removeClass("tab-active");
    
    // Show the selected tab content by adding active class
    $("#" + tabId).addClass("tabContent-active");
    
    // Add active class to the clicked tab
    $(e.currentTarget).addClass("tab-active");
}


