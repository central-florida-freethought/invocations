// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages': ['corechart']});
google.setOnLoadCallback(fetchData);

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
    // Create the popData table.
    // Data supplied by http://religions.pewforum.org/pdf/report-religious-landscape-study-full.pdf
    var popData = new google.visualization.DataTable();
    popData.addColumn('string', 'Religion');
    popData.addColumn('number', 'Invocations');
    popData.addRows([
      ['Protestant', 48],
      ['Catholic', 26],
      ['None', 17],
      ['Jewish', 3],
      ['Other Religion', 1.5],
      ['Orthodox Christian', 1],
      ["Jehovah's Witness", 1],
      ['Muslim', 1],
      ['Morman', 0.5],
      ['Buddhist', 0.5],
      ['Hindu', 0.5]
    ]);

    // Create the invocData table.
    var invocData = new google.visualization.DataTable();
    invocData.addColumn('string', 'Religion');
    invocData.addColumn('number', 'Invocations');
    invocData.addRows(fetchedData);

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
      invoc.draw(invocData, invocOptions);
      pop.draw(popData, popOptions);
    }
    catch (exception)
    {
      //ignore "container not found" error for google apis on pages where the charts won't be loaded.
    }
  });
}