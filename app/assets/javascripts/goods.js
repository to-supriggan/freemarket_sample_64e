document.addEventListener('turbolinks:load',function(){
  function good(triger,target,onclass,offclass){
    triger.on("ajax:success",function(e){
      let index = triger.index(this);
      if (target.eq(index).hasClass(offclass)){
        target.eq(index).removeClass(offclass).addClass(onclass)
      } else{
        target.eq(index).removeClass(onclass).addClass(offclass)
      }
    })
  }

  good($(".item-detail__status__container__left__like__text"),$(".good-btn"),'icon-heart-border-on','icon-heart-border')

})
