// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages': ['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(drawChart);

function fetchData()
{
  $.ajaxSetup({
    async: false
  });
  var data = [];
  var id = $('h1').data('id');
  //todo needs to account for main page report
  //todo populate population data separate from invocation data
  $.getJSON('/localities/' + id + '/report.json', function (resp)
  {
    $.each(resp, function (index, value)
    {
      data.push([value.Religion, value.count]);
    });
  console.log(data);
  });
  return data;
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
  //data.addRows([
  //  ['Catholic', 10],
  //  ['Orthodox Christian', 9],
  //  ['Buddhist', 5],
  //  ['Jewish', 4],
  //  ['Protestant', 4],
  //  ['Mormon', 2],
  //  ['None', 2],
  //  ['Other Religion', 2],
  //  ['Hindu', 1],
  //  ["Jehovah's Witness", 1],
  //  ['Muslim', 1]
  //]);

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