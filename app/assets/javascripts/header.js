$(function(){
  document.getElementById("category-top").addEventListener("mouseover", function(){
    document.getElementById("ex_menu").style.display = 'block';
  }, false);
  document.getElementById("category-top").addEventListener("mouseout", function(){
    document.getElementById("ex_menu").style.display = 'none';
  }, false);
  
  document.getElementById("brand-top").addEventListener("mouseover", function(){
    document.getElementById("ex_menu2").style.display = 'block';
  }, false);
  document.getElementById("brand-top").addEventListener("mouseout", function(){
    document.getElementById("ex_menu2").style.display = 'none';
  }, false); 

  document.getElementById("content__box__bottom__right__like").addEventListener("mouseover", function(){
    document.getElementById("ex_menu3").style.display = 'block';
  }, false);
  document.getElementById("content__box__bottom__right__like").addEventListener("mouseout", function(){
    document.getElementById("ex_menu3").style.display = 'none';
  }, false); 

  document.getElementById("content__box__bottom__right__notice").addEventListener("mouseover", function(){
    document.getElementById("ex_menu4").style.display = 'block';
  }, false);
  document.getElementById("content__box__bottom__right__notice").addEventListener("mouseout", function(){
    document.getElementById("ex_menu4").style.display = 'none';
  }, false); 

  document.getElementById("content__box__bottom__right__todo").addEventListener("mouseover", function(){
    document.getElementById("ex_menu5").style.display = 'block';
  }, false);
  document.getElementById("content__box__bottom__right__todo").addEventListener("mouseout", function(){
    document.getElementById("ex_menu5").style.display = 'none';
  }, false); 

  document.getElementById("content__box__bottom__right__my-page").addEventListener("mouseover", function(){
    document.getElementById("ex_menu6").style.display = 'block';
  }, false);
  document.getElementById("content__box__bottom__right__my-page").addEventListener("mouseout", function(){
    document.getElementById("ex_menu6").style.display = 'none';
  }, false); 
}); 
