$(document).ready(function () {
    // Click event for driver rows
    $('.driver-row').click(function () {
        $('.driver-row').removeClass('table-primary');
        $(this).addClass('table-primary');

        var driverId = $(this).data('driver-id');
        sessionStorage.setItem('selectedDriverId', driverId);

        // Show the overlay
        $('#overlay').addClass('show-overlay');
        $('#parent-container').attr('data-child', 'has-child');

        // Load driver_view.jsp first, then fetch driver data
        $('#parent-container').load('/operators/Pages/driver_view.jsp', function () {
            fetchDriverData(driverId);
            bindBackButton();
        });
        
    });

    // Function to fetch driver data via AJAX
    function fetchDriverData(driverId) {
        $.ajax({
            type: 'GET',
            url: '/operators/driver_info.jsp',
            data: { driverId: driverId },
            dataType: 'json',
            success: function (response) {
                console.log("API Response:", response);

                if (response.responseCode === 200 && response.data) {
                    // If API returns success (200), extract driver data
                    console.log(response.data.fullName);
                    populateDriverView(response.data);
                } else {
                    // If API fails, show the actual error message
                    showError(response.responseMessage || response.responseDescription || "Unknown error occurred.");
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", status, error);
                showError("Failed to load driver details. Please try again.");
            }
        });
    }

    // Function to populate driver_view.jsp with extracted data
    function populateDriverView(data) {
        $('#driverDetails').html(`
            <div class="row">
                <div class="col-md-12 mb-4">
                    <h2 class="driver-name">${data.fullName || 'No Name Available'}</h2>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Personal Information</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-borderless">
                                <tr><th>First Name:</th><td>${data.firstName || 'N/A'}</td></tr>
                                <tr><th>Middle Name:</th><td>${data.middleName || 'N/A'}</td></tr>
                                <tr><th>Surname:</th><td>${data.surname || 'N/A'}</td></tr>
                                <tr><th>Date of Birth:</th><td>${data.dateOfBirth || 'N/A'}</td></tr>
                                <tr><th>Experience:</th><td>${data.experience ? data.experience + ' years' : 'N/A'}</td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Contact Information</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-borderless">
                                <tr><th>Email:</th><td>${data.email || 'N/A'}</td></tr>
                                <tr><th>Primary Contact:</th><td>${data.primaryContact || 'N/A'}</td></tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Status</h5>
                        </div>
                        <div class="card-body">
                            <p>
                                <strong>Status:</strong>
                                ${data.isActive ? '<span class="badge bg-success">Active</span>' : '<span class="badge bg-danger">Inactive</span>'}
                                ${data.isDeleted ? '<span class="badge bg-warning text-dark">Deleted</span>' : ''}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        `);
        $('#loadingSpinner').hide();
        $('#driverDetails').show();
    }

    // Function to bind the back button event
    function bindBackButton() {
       $(document).on('click', '.btn-back', function() {
           hideOverlay();
       });

       // Handle expand/collapse button
       $(document).on('click', '.btn-expand', function() {
           $('#parent-container').toggleClass('expanded');
           $(this).find('.mdi-arrow-expand, .mdi-arrow-collapse').toggleClass('hide-icon');
       });
    }

    // Function to hide the overlay
    function hideOverlay() {
        $('#overlay').removeClass('show-overlay');
        $('#parent-container').attr('data-child', 'no-child');
        
        // Clear the content
        $('#parent-container').html('');
        // Remove event handlers to prevent memory leaks
        $(document).off('click', '.btn-back');
        $(document).off('click', '.btn-expand');
    }

    function showError(message) {
        $('#loadingSpinner').hide();
        $('#errorText').text(message);
        $('#errorMessage').show();
    }
});
