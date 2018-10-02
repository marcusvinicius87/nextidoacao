$( document ).ready(function() {

    var foo = $.get("/api/cadastros", function(data){
        var meses = [data.janeiro, data.fevereiro, data.marco, data.abril, data.maio, data.junho, data.julho, data.agosto, data.setembro, data.outubro, data.novembro, data.dezembro]

        var DrawSparkline = function() {
            $('#sparkline1').sparkline([0, 23, 43, 35, 44, 45, 56, 37, 40], {
                type: 'line',
                width:'100%',
                height: '200',
                chartRangeMax: 50,
                lineColor: '#3bafda',
                fillColor: 'rgba(59,175,218,0.3)',
                highlightLineColor: 'rgba(0,0,0,.1)',
                highlightSpotColor: 'rgba(0,0,0,.2)'
            });

            $('#sparkline1').sparkline([25, 23, 26, 24, 25, 32, 30, 24, 19], {
                type: 'line',
                width:'100%',
                height: '200',
                chartRangeMax: 40,
                lineColor: '#00b19d',
                fillColor: 'rgba(0, 177, 157, 0.3)',
                composite: true,
                highlightLineColor: 'rgba(0,0,0,.1)',
                highlightSpotColor: 'rgba(0,0,0,.2)'
            });

            $('#sparkline2').sparkline(meses, {
                type: 'bar',
                height: '200',
                barWidth: '10',
                barSpacing: '5',
                barColor: '#3bafda',
                tooltipFormat: '{{offset:offset}} {{value}}',
                tooltipValueLookups: {
                    'offset': {
                        0: '<strong>Janeiro:</strong> ',
                        1: '<strong>Fevereiro:</strong> ',
                        2: '<strong>Março:</strong> ',
                        3: '<strong>Abril:</strong> ',
                        4: '<strong>Maio:</strong> ',
                        5: '<strong>Junho:</strong> ',
                        6: '<strong>Julho:</strong> ',
                        7: '<strong>Agosto:</strong> ',
                        8: '<strong>Setembro:</strong> ',
                        9: '<strong>Outubro:</strong> ',
                        10: '<strong>Novembro:</strong> ',
                        11: '<strong>Dezembro:</strong> '
                    }
                }
                });


            $('#sparkline3').sparkline([20, 40, 30, 10], {
                type: 'pie',
                width: '200',
                height: '200',
                sliceColors: ['#dcdcdc', '#3bafda', '#333333', '#00b19d']
            });
        };


        DrawSparkline();
        var resizeChart;

        $(window).resize(function(e) {
            clearTimeout(resizeChart);
            resizeChart = setTimeout(function() {
                DrawSparkline();
            }, 300);
        });
    });
});