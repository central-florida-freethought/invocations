// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages': ['corechart']});

fetchData()


function fetchData()
{
  $.ajaxSetup({
    //async: false
  });
  var fetchedData = [];
  var id = $('h1').data('id');
  var url = '';
  if (id == '')
    url = '/localities/report_all.json';
  else
    url = '/localities/' + id + '/report.json';

  //todo populate population data separate from invocation data
  $.getJSON(url, function (resp)
  {
    $.each(resp, function (index, value)
    {
      fetchedData.push([value.religion, value.count]);
    });
    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Religion');
    data.addColumn('number', 'Invocations');
    data.addRows(fetchedData);

    // Set chart options
    var popOptions = {'title': 'Religious Population',
      'width': 500,
      'height': 300};

    var invocOptions = {'title': 'Invocations Conducted',
      'width': 500,
      'height': 300};

    try
    {
      // Instantiate and draw our chart, passing in some options.
      var pop = new google.visualization.PieChart(document.getElementById('population_chart'));
      var invoc = new google.visualization.PieChart(document.getElementById('invocations_chart'));
      invoc.draw(data, invocOptions);
      pop.draw(data, popOptions);
    }
    catch (exception)
    {
      //ignore "container not found" error for google apis on pages where the charts won't be loaded.
    }
  });
  //return fetchedData;
}
// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart()
{

  // Create the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Religion');
  data.addColumn('number', 'Invocations');
  data.addRows(fetchData());

  // Set chart options
  var popOptions = {'title': 'Religious Population',
    'width': 500,
    'height': 300};

  var invocOptions = {'title': 'Invocations Conducted',
    'width': 500,
    'height': 300};

  try
  {
    // Instantiate and draw our chart, passing in some options.
    var pop = new google.visualization.PieChart(document.getElementById('population_chart'));
    var invoc = new google.visualization.PieChart(document.getElementById('invocations_chart'));
    invoc.draw(data, invocOptions);
    pop.draw(data, popOptions);
  }
  catch (exception)
  {
    //ignore "container not found" error for google apis on pages where the charts won't be loaded.
    //todo maybe use requirejs to dynamically load the script instead?
  }
}