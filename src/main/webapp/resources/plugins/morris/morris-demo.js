$(function() {
    createDonut("data.json", "morris-donut-chart1");
    createDonut("data.json", "morris-donut-chart2");
    createDonut("data.json", "morris-donut-chart3");
    createDonut("data.json", "morris-donut-chart4");
    createDonut("data.json", "morris-donut-chart5");
    createDonut("data.json", "morris-donut-chart6");
    createDonut("data.json", "morris-donut-chart7");
    createDonut("data.json", "morris-donut-chart8");
    createDonut("data.json", "morris-donut-chart9");

    function createDonut(url, element) {
        $.getJSON(url, function(ab) {
            Morris.Donut({
                element: element,
                data: ab,
                //backgroundColor: '#ccc',
                labelColor: '#449D45',
                colors: ['#31B0D5', '#EC971F', '#3071A9','#449D44'],
                formatter: function(x) {
                    return x;
                }
            }).on('click', function(i, row) {
                //  console.log(i, row[1]);
                alert(i, row[1]);
            });
        });
    }



    createBar("bar.json", "morris-bar-chart");

    function createBar(url, element) {
        $.getJSON(url, function(ab) {
            Morris.Bar({
                element: element,
                data: ab,
                xkey: 'EntDate',
                ykeys: ['New', 'Opend', 'Completed', 'Closed'],
                labels: ['New', 'Opend', 'Completed', 'Closed'],
                hideHover: 'auto',
                resize: true,
                barColors: ['#31B0D5', '#EC971F', '#3071A9','#000']

            });
        });
    }





});
