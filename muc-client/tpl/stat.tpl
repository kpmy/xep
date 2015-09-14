<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>стата :: golang@c.j.r</title>
		<link rel="stylesheet" href="/static/css/default.css"/>

		<script src="http://code.highcharts.com/adapters/standalone-framework.js"></script>
		<script src="http://code.highcharts.com/highcharts.js"></script>
	</head>
	<body>
		<a href="/">логи</a>
		<h1>стата</h1>
		<p><em>всего</em>: {{.Total}}</p>
		{{range .Stat}}<em>{{.User}}</em>: {{printf "%.2f" .Count}}%<br/>{{else}}ничего ._.{{end}}
		<div id="chart-container">
		</div>
	</body>
	<script type="text/javascript">
		var data = [];
		{{range .Stat}}
			data.push({
				name: "{{.User}}",
				y: parseFloat({{printf "%.2f" .Count}})
				});
		{{end}}
		var chart = new Highcharts.Chart({
			chart: {
				renderTo: 'chart-container',
				type: 'pie'
			},
			title: {
				text: "Стата"
			},
			series: [{
				name: "Пиздливость",
				data: data
				}]
			});
	</script>
</html>
