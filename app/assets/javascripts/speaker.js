var searchBox = $('#user_meeting_speaker_attributes_name');
var searchResults = $('#searchResults');

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
      $.each(resp, function(index, value)
      {
        output += '<li><a href="#">' + value.name + '</a></li>';
      });
      output += "</ul>";
      searchResults.append(output);
    }
  });
});


