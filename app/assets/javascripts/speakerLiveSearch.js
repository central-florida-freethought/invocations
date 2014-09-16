// Ajax-y/livesearch for speaker names.
var searchBox = $('#user_meeting_speaker_attributes_name');
var searchResults = $('#searchResults');
var religion = $('#user_meeting_speaker_attributes_religion_id');
var honorific = $('#user_meeting_speaker_attributes_honorific');
var org = $('#user_meeting_speaker_attributes_organization_attributes_name');
var speakerNames;

searchBox.bind('keypress focus', function (e)
{
  var searchVal = $(this).val();
  searchResults.empty().removeClass('hide');
  religion.prop('disabled', false);
  honorific.prop('disabled', false);
  org.prop('disabled', false);

  $.ajax({
    type: 'get',
    url: '/speakers/search.json',
    datatype: 'json',
    data: {name: searchVal },
    success: function (resp)
    {
      var output = '<ul>';
      $.each(resp, function (index, value)
      {
        output += '<li data-religion_id="' + value.religion_id +
          '" data-honorific="' + value.honorific +
          '" data-ororganization_id="' + value.organization_id + '">' + value.name + '</li>';
      });
      output += "</ul>";
      searchResults.append(output);
    },
    complete: function ()
    {
      speakerNames = searchResults.find('li');
      speakerNames.click(function()
      {
        searchBox.val(this.innerHTML);
        religion.get(0).selectedIndex = $(this).data('religion_id');
        religion.prop('disabled', true);

        honorific.val($(this).data('honorific'));
        honorific.prop('disabled', true);

        org.val($(this).data('organization_id'));
        org.prop('disabled', true);
      });
    }
  });
});

// Close live-search when clicking outside it
$(document.body).click(function (e)
{
  var clicked = $(e.target);

  if (!(clicked.is(searchBox) || clicked.is(searchResults) || clicked.is('input')))
  {
    searchResults.addClass('hide');
  }
});