// "use strict";
$(document).on('turbolinks:load', function(){
  $('.item-detail__wrap__left__look__slide__box').slick({
    dots:true,
    prevArrow: '<class="slide-text">',
    nextArrow: '<class="next-text">',
    dotsClass: 'owl-dots',
    customPaging: function(slick,item_detail) {
      var targetImage = slick.$slides.eq(item_detail).find('img').attr('src');
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
});