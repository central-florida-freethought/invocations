(function($)
{
  var dateField = $('#user_meeting_meeting_time');
  dateField.datetimepicker({
    dateFormat: 'yy-mm-dd',
    timeFormat: 'h:mm tt'
  });
})(jQuery);
