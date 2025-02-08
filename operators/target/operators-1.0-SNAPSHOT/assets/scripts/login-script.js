/* 
    Created on : Jan 30, 2025, 7:05:30 AM
    Author     : Macjohnan
*/

$(document).ready(function () {
    //prevent back navigation
    noBack();
    
    //hide loader
    hideLoading();
    
    //prevent pasting in text field
    detectPastePrevention();
    
    $("#passwordeye").click(function (){
        let element = $("#password");
        if(element){
            element[0].type = element[0].type === "text" ? 'password' : 'text';
        }
     });

});

function noBack() {
    window.history.forward();
}

window.onload = noBack;
window.onpageshow = function (event) {
    if (event.persisted) {
        noBack();
    }
};

function showLoading() {
    $('#loading').addClass("progress"); 
}

function hideLoading() {
    $('#loading').removeClass("progress"); 
}

// Encapsulated function to detect and prevent pasting
function detectPastePrevention() {
    const fields = [...document.querySelectorAll("input, textarea")];

    fields.forEach((field) => {
        // Convert inline onpaste attributes to actual event handlers
        if (!field.onpaste && field.getAttribute("onpaste")) {
            field.onpaste = new Function(field.getAttribute("onpaste"));
        }

        if (typeof field.onpaste === "function") {
            const prevOnInput = field.oninput;

            field.previousValue = field.value;

            field.oninput = function (e) {
                if (typeof prevOnInput === "function") {
                    prevOnInput.apply(this, arguments);
                }

                const pasted = Math.abs(this.previousValue.length - this.value.length) > 1 && this.value !== "";

                if (pasted && this.onpaste() === false) {
                    this.value = this.previousValue;
                }

                this.previousValue = this.value;
            };

            field.addEventListener("input", field.oninput, false);
        }
    });
}


