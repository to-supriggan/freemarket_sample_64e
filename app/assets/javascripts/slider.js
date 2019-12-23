// "use strict";
$(document).on('turbolinks:load', function(){
  $('.slick__slide').slick({
    autoplay:true,
    dots:true,
    arrows:true,
    prevArrow: '<img src="/assets/icons8-arrow-50.png" class="slide-arrow">',
    nextArrow: '<img src="/assets/icons8-arrow-50.png" class="next-arrow">',
    dotsClass: 'slide-dots',
  });
});