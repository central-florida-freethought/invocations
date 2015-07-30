$('.toggleable').hide();
$('.slide-panel').slideUp();
$('.btn-primary').removeClass('hide').click(function (event)
{
  var $this = $(this);
  var mainTr = $this.closest('tr');
  var hiding = $this.hasClass('hide-panel');

  event.preventDefault();
  event.stopPropagation();

  if (hiding)
  {
    mainTr.next().show().find('.slide-panel').slideDown();
    $this.removeClass('hide-panel');
  }

  if (! hiding)
  {
    mainTr.next().find('.slide-panel').slideUp(function()
    {
      mainTr.next().hide();
    });
    $this.addClass('hide-panel');
  }
});
