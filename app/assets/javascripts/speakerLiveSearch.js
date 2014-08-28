// Ajax-y/livesearch for speaker names.
var searchBox = $('#user_meeting_speaker_attributes_name');
var searchResults = $('#searchResults');
var speakerNames;


searchBox.bind('keypress focus', function (e)
{
  var searchVal = $(this).val();
  searchResults.empty().removeClass('hide');

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
        output += '<li>' + value.name + '</li>';
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