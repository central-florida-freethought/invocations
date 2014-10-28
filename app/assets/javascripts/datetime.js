(function($)
{
  var dateField = $('#user_meeting_meeting_time');
  dateField.datetimepicker({
    dateFormat: 'yy-mm-dd',
    timeFormat: 'HH:mm:ss z',
    timezoneList: [
      { value: -300, label: 'Eastern'},
      { value: -360, label: 'Central' },
      { value: -420, label: 'Mountain' },
      { value: -480, label: 'Pacific' }
    ]
  });
})(jQuery);
