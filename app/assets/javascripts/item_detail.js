// "use strict";
$(document).on('turbolinks:load', function(){
  $('.item-detail__wrap__left__look__slide__box').slick({
    // slidesToShow: 1,
    // slidesToScroll: 1,
    dots:true,
    prevArrow: '<class="slide-text">',
    nextArrow: '<class="next-text">',
    dotsClass: 'owl-dots',
    // asNavFor: 'owl-dots',
    customPaging: function(slick,item_detail) {
      var targetImage = slick.$slides.eq(item_detail).find('img').attr('src');
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
  // $('owl-dots').slick({
  //   slidesToShow: 3,
  //   slidesToScroll: 1,
  //   asNavFor: '.item-detail__wrap__left__look__slide__box',
  //   centerMode: true,
  //   focusOnSelect: true
  // });
});