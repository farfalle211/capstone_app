/* ===================================================  
1. Loader
2. Scrolling to top
3. Youtube Background
4. Smoky Background
5. Backstretch Background
6. Kenburned Background
7. Polygon Background
8. Countdown
9. Subscription Form Submit
10. Contact Form Submit
11. Section Close
 =================================================== */
 

$(function() {
    "use strict";  
    
    /* =================================================== */
    /*      1. Loader
	/* =================================================== */

    $(window).load(function() {
        $(".loader").fadeOut("slow");
    }); 
    
    /* =================================================== */
    /*      2. Scrolling to top
	/* =================================================== */    
   
    $(document).on('shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
        $('html, body').scrollTop(0);
    });
    
    /* =================================================== */
    /*      3. Youtube Background
	/* =================================================== */
     
    var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    };
    
    if(isMobile.any()) {  
       var bg2 = $('#background2');
       if($.fn.backstretch && bg2.length){
            bg2.backstretch("images/image-background2.jpg");
       }  
    } else {
       var videobg = $('#video-background');
       if(videobg.length){
            videobg.YTPlayer({
                 fitToBackground: true,
                 videoId: 'jKCyFB5LmPo'
             }); 
       }   
    } 
    
    /* =================================================== */
    /*      4. Smoky Background
	/* =================================================== */
    var smokybg = $('#smoky-background');
    if(smokybg.length){
        var smokyBG = smokybg.waterpipe({            
            gradientStart: '#ffffff',
            gradientEnd: '#02aef0',
            smokeOpacity: 0.1,
            numCircles: 1,
            maxMaxRad: 'auto',
            minMaxRad: 'auto',
            minRadFactor: 0,
            iterations: 8,
            drawsPerFrame: 5,
            lineWidth: 3,
            speed: 1,
            bgColorInner: "#333333",
            bgColorOuter: "#333333"
        });
    }
    
    /* =================================================== */
    /*      5. Backstretch Background
	/* =================================================== */
    var bg = $('#background');
    if($.fn.backstretch && bg.length){
         bg.backstretch("images/image-background.jpg");
    }
    
    var slidesbg = $('#slides');
    if($.fn.backstretch && slidesbg.length){
        slidesbg.backstretch([
            "images/background1.jpg",
            "images/background2.jpg", 
            "images/background3.jpg"        
        ],  {duration: 3000, fade: 1200});
    }
    
    /* =================================================== */
    /*      6. Kenburned Background
	/* =================================================== */
    var kbg = $('#kenburned-background');    
    if(kbg.length){
        var $canvas = kbg;

        $canvas.attr('width', $(window).width());
        $canvas.attr('height', $(window).height());

        var kb = $canvas.kenburned({
                images : [
                    "images/kenburned-background1.jpg",
                    "images/kenburned-background2.jpg", 
                    "images/kenburned-background3.jpg"    
                ]
        });
    }  
    
    /* =================================================== */
    /*      7. Polygon Background
	/* =================================================== */
    var polygonsbg = $('#polygons');
    if(polygonsbg.length){
        polygonsbg.particleground({
            dotColor: 'rgba(255,255,255,.6)',
            lineColor: 'rgba(255,255,255,.6)',
            proximity: 150,
            density: 8000       
        });
    }    
    
    /* =================================================== */
    /*      8. Countdown
	/* =================================================== */
    
    $('body').countdown('2016/12/31', function(event) {
        var offset = event.offset;
        $('#cday').text(offset.totalDays);
        $('#chours').text(''.concat(offset.hours < 10 ? '0' : '', offset.hours));
        $('#cminutes').text(''.concat(offset.minutes < 10 ? '0' : '', offset.minutes));
        $('#cseconds').text(''.concat(offset.seconds < 10 ? '0' : '', offset.seconds));
    });
    
    /* =================================================== */
    /*      9. Subscription Form Submit
	/* =================================================== */
    var newsletterform = $('#newsletter-form');
    var newsletteralert = $('#newsletter-form .alert-message');    
    newsletterform.validate({
        rules: {
            newsletter_email: {
                required: true,
                email: true
            }
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('form-error');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('form-error');
        },
        errorPlacement: function(error, element) {

        },
        submitHandler: function(form) {
            newsletteralert.html('<i class="fa fa-refresh fa-spin"></i> Please wait');
            $.post("subscription.php", newsletterform.serialize(),
                function(data) {
                    var obj = jQuery.parseJSON(data);
                    newsletteralert.html("<span class='" + obj.error + "'>" + obj.flash + "</span>");                    
                    if(obj.error != "error"){                       
                        newsletterform.trigger("reset");
                    }
                    
                    setTimeout(function(){
                        newsletteralert.fadeOut("slow", function(){
                            newsletteralert.html('').show();                         
                        });                       
                    }, 2000);
                });
            return false;
        }
    });
    
    /* =================================================== */
    /*      10. Contact Form Submit
	/* =================================================== */
    var contactform = $('#contact-form'); 
    var contactalert = $('#contact-form .alert-message');    
    contactform.validate({
        rules: {
            subject: {
                required: true
            },
            email: {
                required: true,
                email: true
            },
            name: {
                required: true
            },
            message: {
                required: true
            }
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('form-error');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('form-error');
        },
        errorPlacement: function(error, element) {
            
        },
        submitHandler: function(form) {
            contactalert.html('<i class="fa fa-refresh fa-spin"></i> Please wait');
            $.post("contact.php", contactform.serialize(),
                function(data) {
                    var obj = jQuery.parseJSON(data);
                    if(obj.error != "error"){
                        contactform.find("input[type=text], input[type=email], textarea").val("");
                    }
                    contactalert.html("<span class='" + obj.error + "'>" + obj.flash + "</span>");
                    if(obj.error != "error"){                       
                        contactform.trigger("reset");
                    }
                    
                    setTimeout(function(){
                        contactalert.fadeOut("slow", function(){
                            contactalert.html('').show();                           
                        });                       
                    }, 3000);
                });

            return false;
        }
    });
        
    /* =================================================== */
    /*      11. Section Close
	/* =================================================== */
    
    $(".section-close").click (function(e){
        e.preventDefault();
        $(".navigation li").removeClass('active')
    });
});    