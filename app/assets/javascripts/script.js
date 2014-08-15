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

/*
 * Helper function to make hiding/showing/clear more DRY
 * 
 * @param changeNode The jquery object node to watch for changes
 * @param hideNode the jquery object node to hide
 * @param checkVal the string value to check for (if true, hide)
 * @param clearField the jquery object to clear the value of
 */
hideShowClear = function (changeNode, hideNode, checkVal, clearField)
{
  changeNode.change(function ()
  {
    if (this.value === checkVal)
    {
      hideNode.removeClass('hide');
    }
    else
    {
      hideNode.addClass('hide');

      if (clearField !== false) clearField.val('');
    }
  });
};

// show/hide invocation-related fields
hideShowClear($('#user_meeting_invocation_conducted'), $('.invocation_only'),
  'Yes', false );

// show/hide speaker preaching explanation
var preached = $('#user_meeting_speaker_preached');
hideShowClear(preached, preached.next(),
  'Yes, Explain', preached.next() );

// show/hide praised fields
var praised = $('#user_meeting_speaker_praised');
hideShowClear(praised, praised.next(),
  'Yes, Explain', praised.next());

// submit validation
$('#submit').click(function(e)
{
  if ($('#policy:checked').val() !== 'on')
  {
    alert('Please review and agree to the policy before submission.');
    e.preventDefault();
  }
  else
  {// todo remove alert and preventDefaul() when the form can actually post
    alert("Submitted! Well, not really. This is just a placeholder. ")
    e.preventDefault();
  }
});

