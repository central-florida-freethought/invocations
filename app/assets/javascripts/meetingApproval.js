$('.toggleable').slideUp();
$('.btn-primary').click(function(){
  $(this).closest('tr').next().slideToggle();
});
