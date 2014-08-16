// Ajax-y/livesearch for speaker names.
var searchBox = $('#user_meeting_speaker_attributes_name');
var searchResults = $('#searchResults');
var speakerName = $('a.result');


searchBox.bind('keypress focus', function (e)
{
  var searchVal = $(this).val();
  searchResults.empty().removeClass('hide');

  $.ajax({
    type: 'get',
    url: '/speaker/search.json',
    datatype: 'json',
    data: {name: searchVal },
    success: function (resp)
    {
      var output = '<ul>';
      $.each(resp, function (index, value)
      {
        output += '<li>' + value.name + '</li>';
      });
      output += "</ul>";
      searchResults.append(output);
    },
    complete: function ()
    {
      speakerName.click(function (e)
      {
        e.preventDefault();
        console.log(speakerName);
      });
    }
  });
});

// Close live-search when clicking outside it
$(document.body).click(function (e)
{
  var clicked = jQuery(e.target);

  if (!(clicked.is(searchBox) || clicked.is(searchResults) || clicked.is('input')))
  {
    searchResults.addClass('hide');
  }
});