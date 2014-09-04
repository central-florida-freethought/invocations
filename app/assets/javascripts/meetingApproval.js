$('.toggleable').hide();
$('.btn-primary').removeClass('hide').click(function(event){
  event.preventDefault();
  event.stopPropagation();
  $(this).closest('tr').next().toggle();
});
