$('.toggleable').hide();
$('.btn-primary').click(function(event){
  event.preventDefault();
  event.stopPropagation();
  $(this).closest('tr').next().toggle();
});
