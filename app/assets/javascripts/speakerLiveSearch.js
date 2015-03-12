(function($)
{
// Ajax-y/livesearch for speaker names.
  var searchBox = $('#user_meeting_speaker_attributes_name');
  var searchResults = $('#searchResults');
  var religion = $('#user_meeting_speaker_attributes_religion_id');
  var honorific = $('#user_meeting_speaker_attributes_honorific');
  var org = $('#user_meeting_speaker_attributes_organization_attributes_name');

  searchBox.autocomplete({
    source: '/speakers/search.json',
    term: 'name',
    select: function(event, ui)
    {
      console.log(ui);
      religion.val(ui.item.religion_id);
      religion.prop('disabled', true);

      honorific.val(ui.item.honorific);
      honorific.prop('disabled', true);

      org.val('');
      $.getJSON('/org/' + ui.item.org_id + '.json', function(resp)
      {
        org.val(resp.name);
      });
      org.prop('disabled', true);
    },
    change: function(event, ui)
    {
      console.log('change event');
    },
    open: function()
    {
      console.log("open event");
      religion.prop('disabled', false);
      honorific.prop('disabled', false);
      org.prop('disabled', false);
    }
  });
})(jQuery);