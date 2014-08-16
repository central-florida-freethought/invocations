var searchBox = $('#user_meeting_speaker_attributes_name');
var searchResults = $('#searchResults');
var speakerName = $('a.result');


searchBox.keyup(function ()
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