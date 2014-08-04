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

// show/hide meeting text field
hideShowClear($('#meeting_type'), $('#meeting_type_explaination').parent().parent(),
  'Other', $('#meeting_type_explaination') );

// show/hide invocation-related fields
hideShowClear($('#invocation_conducted'), $('.invocation_only'),
  'Yes', false );

// show/hide speaker preaching explanation
hideShowClear($('#speaker_preached'), $('#preached_explain').parent().parent(),
  'Yes', $('preached_explain') );

// show/hide religion fields
hideShowClear($('#religion'), $('#other_religion').parent().parent(),
  'Other', $('#other_religion'));

// show/hide denomination fields
hideShowClear($('#denomination'), $('#other_denomination').parent().parent(),
  'Other', $('#other_denomination'));

// show/hide praised fields
hideShowClear($('#speaker_praised'), $('#praised_explain').parent().parent(),
  'Yes', $('#praised_explain'));

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

