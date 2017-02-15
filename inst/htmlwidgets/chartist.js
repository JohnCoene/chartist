HTMLWidgets.widget({

  name: 'chartist',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        var d = document.getElementById(el.id);
        d.className += x.ratio;

        var data = x.cdat;

        var seq = 0,
          delays = 80,
          durations = 500;

        var options = x.options;
        var responsiveOptions = x.responsiveOptions;

        if (x.type == "line")
          var chart = new Chartist.Line('#' + el.id, data, options);
        else if (x.type == "bar")
          var chart = new Chartist.Bar('#' + el.id, data, options);
        else if (x.type == "pie")
          var chart = new Chartist.Pie('#' + el.id, data, options);

        if (x.hasOwnProperty('created')){
          chart.on('created', x.created);
        }

        if (x.hasOwnProperty('draw')){
          chart.on('draw', x.draw);
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
