function fetchData(){var o=[],t=$("h1").data("id"),i="";i=""==t?"/localities/report_all.json":"/localities/"+t+"/report.json",getReligionColor=function(o){var t={Protestant:"#3669C9",Catholic:"#DA3B21",None:"#FD9827",Jewish:"#1D9524","Other Religion":"#921487","Orthodox Christian":"#189AC4","Jehovah's Witness":"#DB4778",Muslim:"#68A81E",Mormon:"#B63032",Buddhist:"#346493",Hindu:"#984797"};return t[o]},getReligionColorArray=function(o){for(var t=o.getNumberOfRows(),i=[],e=0;t>e;e++)i.push(getReligionColor(o.getValue(e,0)));return i},$.getJSON(i,function(t){$.each(t,function(t,i){o.push([i.religion,i.count])});var i=new google.visualization.DataTable;i.addColumn("string","Religion"),i.addColumn("number","Invocations"),i.addRows([["Protestant",48],["Catholic",26],["None",17],["Jewish",3],["Other Religion",1.5],["Orthodox Christian",1],["Jehovah's Witness",1],["Muslim",1],["Mormon",.5],["Buddhist",.5],["Hindu",.5]]);var e=new google.visualization.DataTable;e.addColumn("string","Religion"),e.addColumn("number","Invocations"),e.addRows(o);var a={title:"Religious Population",width:500,height:350,colors:getReligionColorArray(i)},n={title:"Invocations Conducted",width:500,height:350,colors:getReligionColorArray(e)};try{var l=new google.visualization.PieChart(document.getElementById("population_chart")),r=new google.visualization.PieChart(document.getElementById("invocations_chart"));r.draw(e,n),l.draw(i,a)}catch(s){}})}google.load("visualization","1.0",{packages:["corechart"]}),google.setOnLoadCallback(fetchData);