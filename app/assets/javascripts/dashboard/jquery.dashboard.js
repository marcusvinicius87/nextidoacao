$( document ).ready(function() {

    var meses;
    var dias;

    $.get("/api/cadastros_mes", function (data){
        meses = [data.janeiro, data.fevereiro, data.marco, data.abril, data.maio, data.junho, data.julho, data.agosto, data.setembro, data.outubro, data.novembro, data.dezembro];
    });

    $.get("/api/cadastros_semana", function (dia){
        dias = [dia.domingo, dia.segunda, dia.terca, dia.quarta, dia.quinta, dia.sexta, dia.sabado];
    });


    var DrawSparkline = function() {
            $('#sparkline1').sparkline(dias, {
                type: 'bar',
                tooltipFormat: '{{offset:offset}}: {{value}}',
                tooltipValueLookups: {
                    'offset': {
                        0: '<strong style="color: #3bafda;"> Domingo </strong>',
                        1: '<strong style="color: #3bafda;"> Segunda </strong>',
                        2: '<strong style="color: #3bafda;"> Terca </strong>',
                        3: '<strong style="color: #3bafda;"> Quarta </strong>',
                        4: '<strong style="color: #3bafda;"> Quinta </strong>',
                        5: '<strong style="color: #3bafda;"> Sexta </strong>',
                        6: '<strong style="color: #3bafda;"> Sabado </strong>'
                    }
                },
                height: '200',
                barWidth: '10',
                barSpacing: '5',
                barColor: '#ffffff'
            });

            $('#sparkline2').sparkline(meses, {
                type: 'bar',
                height: '200',
                barWidth: '10',
                barSpacing: '5',
                barColor: '#3bafda',
                tooltipFormat: '{{offset:offset}}: {{value}}',
                tooltipValueLookups: {
                    'offset': {
                        0: '<strong style="color: #3bafda;">Janeiro</strong> ',
                        1: '<strong style="color: #3bafda;">Fevereiro</strong> ',
                        2: '<strong style="color: #3bafda;">Março</strong> ',
                        3: '<strong style="color: #3bafda;">Abril</strong> ',
                        4: '<strong style="color: #3bafda;">Maio</strong> ',
                        5: '<strong style="color: #3bafda;">Junho</strong> ',
                        6: '<strong style="color: #3bafda;">Julho</strong> ',
                        7: '<strong style="color: #3bafda;">Agosto</strong> ',
                        8: '<strong style="color: #3bafda;">Setembro</strong> ',
                        9: '<strong style="color: #3bafda;">Outubro</strong> ',
                        10: '<strong style="color: #3bafda;">Novembro</strong> ',
                        11: '<strong style="color: #3bafda;">Dezembro</strong> '
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