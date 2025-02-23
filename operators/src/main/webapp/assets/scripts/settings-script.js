$(document).ready(function () {
    //set active tab
    setActiveTab();
    
    //set checked state for general attributes
    $(document).on('change', '.general-attribute', function() {
        $(this).val($(this).prop('checked') ? 'YES' : 'NO');
    });
    
    //set checked state for driver attributes
    $(document).on('change', '.driver-attribute', function() {
        $(this).val($(this).prop('checked') ? 'YES' : 'NO');
    });
});

function setActiveTab(){
    //handle settings tab state
    let tabHeaderState = localStorage.getItem('activeTabHeader');
    if(tabHeaderState === null || tabHeaderState === ""){
        tabHeaderState = "generalTab";
    }
    console.log("Active tabheader: " + tabHeaderState);
    if (tabHeaderState) {
        // Remove active from all
        $('.tablinks').removeClass('tab-active'); 
        
        // Set active to saved item
        $('#' + tabHeaderState).addClass('tab-active'); 
    } 
    
    
    // Retrieve the active content from localStorage
    let activeTabContent = localStorage.getItem('activeTabContent');
    if(activeTabContent === null || activeTabContent === ""){
        activeTabContent = "general";
    }
    console.log("Active tabcontent: " + activeTabContent);
    if (activeTabContent) {
        // Remove active from all
        $('.tabcontent').removeClass('tabContent-active'); 
        
        // Set active to saved item
        $('#' + activeTabContent).addClass('tabContent-active'); 
    } 
}

function openTab(e, tabId) {
    // Hide all tab content and remove active class
    $(".tabcontent").removeClass("tabContent-active");
    
    // Remove active class from all tabs
    $(".tablinks").removeClass("tab-active");
    
    // Show the selected tab content by adding active class
    $("#" + tabId).addClass("tabContent-active");
    localStorage.setItem('activeTabContent', tabId);

    // Add active class to the clicked tab
    $(e.currentTarget).addClass("tab-active");
    
    // Capture the ID of the clicked element
    let tabHeader = $(e.currentTarget).attr("id");

    // Save the ID to localStorage
    localStorage.setItem("activeTabHeader", tabHeader);
}


