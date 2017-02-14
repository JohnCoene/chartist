HTMLWidgets.widget({

  name: 'chartist',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        var data = {
          labels: x.labels,
          series: x.series
        };

        var options = x.options;
        var responsiveOptions = x.responsiveOptions;

        if (x.type == "line")
          new Chartist.Line('#' + el.id, data, options);
        else if (x.type == "bar")
          new Chartist.Bar('#' + el.id, data, options);
        else if (x.type == "pie")
          new Chartist.Pie('#' + el.id, data, options);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
