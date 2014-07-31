// Survey scripts
$('#eventDate').datetimepicker({
  timeFormat: 'HH:mm z',
  timezoneList: [
    { value: -300, label: 'Eastern'},
    { value: -360, label: 'Central' },
    { value: -420, label: 'Mountain' },
    { value: -480, label: 'Pacific' }
  ]
});

// show/hide meeting text field
$('#meeting_type').change(function()
{
  if (this.value === 'Other')
  {
    $('#meeting_type_explaination').parent().parent().removeClass('hide');
  }
  else
  {
    $('#meeting_type_explaination').parent().parent().addClass('hide');
    $('#meeting_type_explaination').val('');
  }
});