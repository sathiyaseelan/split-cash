$(document).ready(function(){
  $('.member-box').on('mouseenter',function(){
    $(this).find('.member_due').slideDown();
  });
  $('.member-box').on('mouseleave',function(){
    $(this).find('.member_due').slideUp();
  });
});
