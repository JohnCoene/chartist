HTMLWidgets.widget({

  name: 'chartist',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        var d = document.getElementById(el.id);
        d.className += x.ratio;

        if(x.hasOwnProperty('revTresh')){
          var d = document.getElementById(el.id).style.cssText = x.revTresh;
        }

        var data = x.cdat;

        if (x.hasOwnProperty('plugins')){
          var plugins = x.plugins;
        }

        var options = x.options;
        var resOpts = x.responsiveOptions;

        if(x.type == "line"){

          if (x.hasOwnProperty('plugins')){
            var chart = new Chartist.Line('#' + el.id, data, plugins, options, resOpts);
          } else {
            var chart = new Chartist.Line('#' + el.id, data, options, resOpts);
          }

        } else if (x.type == "bar"){

          if (x.hasOwnProperty('plugins')){
            var chart = new Chartist.Bar('#' + el.id, data, plugins, options, resOpts);
          } else {
            var chart = new Chartist.Bar('#' + el.id, data, options, resOpts);
          }

        } else if (x.type == "pie") {

          if (x.hasOwnProperty('plugins')){
            var chart = new Chartist.Pie('#' + el.id, data, plugins, options, resOpts);
          } else {
            var chart = new Chartist.Pie('#' + el.id, data, options, resOpts);
          }
        }
        
        if (x.hasOwnProperty('anim')){
        
        chart.on('draw', x.anim.FUN);
        
        chart.on('created', function() {
          if(window.__anim21278907124) {
            clearTimeout(window.__anim21278907124);
            window.__anim21278907124 = null;
          }
          window.__anim21278907124 = setTimeout(chart.update.bind(chart), 10000);
        });
        
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
