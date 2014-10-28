(function($)
{
  var currentDate = '';
  var dateField = $('#user_meeting_meeting_time');
  if (dateField.val() != '')
  {
    currentDate = dateField.val();
  }
  dateField.datetimepicker({
    dateFormat: 'yy-mm-dd',
    timeFormat: 'HH:mm:ss z',
    defaultValue: currentDate,
    timezoneList: [
      { value: -300, label: 'Eastern'},
      { value: -360, label: 'Central' },
      { value: -420, label: 'Mountain' },
      { value: -480, label: 'Pacific' }
    ]
  });
})(jQuery);
