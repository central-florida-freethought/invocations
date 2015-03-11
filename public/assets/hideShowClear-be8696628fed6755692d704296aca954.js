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
var invocation = $('#user_meeting_invocation_conducted');
var invoc_only = $('.invocation_only');
hideShowClear(invocation, invoc_only,
  'Yes', false);

// show/hide speaker preaching explanation
var preached = $('#user_meeting_speaker_preached');
hideShowClear(preached, preached.next(),
  'Yes, Explain', preached.next());

// show/hide praised fields
var praised = $('#user_meeting_speaker_praised');
hideShowClear(praised, praised.next(),
  'Yes, Explain', praised.next());

// Show hidden fields for edit page
if (invocation.val() == 'Yes')
  invoc_only.removeClass('hide');

if (preached.val() == 'Yes, Explain')
  preached.next().removeClass('hide');

if (praised.val() == 'Yes, Explain')
  praised.next().removeClass('hide');
