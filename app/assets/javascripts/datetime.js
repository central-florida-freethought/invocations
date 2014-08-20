// Survey scripts
$('#user_meeting_meeting_time').datetimepicker({
  dateFormat: 'D dd M yy',
  timeFormat: 'HH:mm:ss z',
  timezoneList: [
    { value: -300, label: 'Eastern'},
    { value: -360, label: 'Central' },
    { value: -420, label: 'Mountain' },
    { value: -480, label: 'Pacific' }
  ]
});