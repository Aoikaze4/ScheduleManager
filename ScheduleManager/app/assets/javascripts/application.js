// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

 $("document").ready(function() {
    $('.slideBox').slick({
        centerMode: true,
        centerPadding: '25%',
        dots: true,
        variableWidth: true,
        adaptiveHeight: true,
        responsive:[
            {
                breakpoint: 1024,
                settings:{
                    slidesToShow:3,
                }
            },
            {
                breakpoint: 768,
                settings:{
                    slidesToShow:2,
                }
            },
            {
                breakpoint: 480,
                settings:{
                    slidesToShow:1,
                }
            },
        ]
    });
});

 $("document").ready(function () {
    $('.slideBoxOnOff').click(function () {
        $('.slideBox').toggle();
    });
});