// "use strict";
// 一覧のみ実装（ブランド、カテゴリー実装時は要編集）
$(document).on('turbolinks:load', function(){
  if (window.location.pathname == "/" | window.location.pathname == "/products")
    $('.slick__slide').slick({
      autoplay:true,
      dots:true,
      arrows:true,
      prevArrow: '<img src="icons8-arrow-50.png" class="slide-arrow">',
      nextArrow: '<img src="icons8-arrow-50.png" class="next-arrow">',
      dotsClass: 'slide-dots',
    });
});