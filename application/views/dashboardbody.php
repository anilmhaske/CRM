<style>
	.center{
		text-align: center;
	}
</style>
<div id="wrapper" class="home-page">
	<div class="panel panel-default">		
		<div class="panel-body">
			<div class="row" style="padding: 0% 4% 0% 4%;">
				<div class="col-sm-3">
					<div class="panel panel-info">
				  		<div class="panel-heading">
				    		<h3 class="panel-title center"><label>customers</label></h3>
				  		</div>
		  		 		<div class="panel-body center" style="padding:5px;">
		  					440
		  				</div>
			 		</div>
				</div>
				<div class="col-sm-3">
					<div class="panel panel-info">
				 		 <div class="panel-heading">
				   			 <h3 class="panel-title center"><label>Presale Enquery</label></h3>
				 		 </div>
				  		<div class="panel-body center"  style="padding:5px;">
				  			31
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="panel panel-info">
				 		<div class="panel-heading">
				    		<h3 class="panel-title center"><label>Total Orders</label></h3>
				  		</div>
				  		<div class="panel-body center" style="padding:5px;">
				   			30
				  		</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="panel panel-info">
				 		<div class="panel-heading">
				    		<h3 class="panel-title center"><label>Post Sale</label></h3>
				  		</div>
				  		<div class="panel-body center" style="padding:5px;">
				   			230
				  		</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-primary">
					  	<div class="panel-heading">
					    	<h3 class="panel-title"><label>Report</label></h3>
					  	</div>
					  	<div class="panel-body" style="padding:1px;">
							<!-- <div id="chartContainer" style="height: 100%; width: 100%;"></div> -->
							<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		   				</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
						   	<h3 class="panel-title" id="panelc"><label>Report</label></h3>
						</div>
						<div class="panel-body" style="padding: 1px;">
						    <!-- <div id="chartContainer1" style="height: 100%; width: 100%;"></div> -->
						    <div id="chartContainer1" style="height: 370px; width: 100%;"></div>
						</div>
		 			</div>
	  			</div>
			</div>
   		</div>
   	</div>
</div>
<script>
	window.onload = function () {
	 CHART();
	var options = {
		title: {
			text: ""
		},

		data: [{
			type: "bar",
			yValueFormatString: "#,###",
			indexLabel: "{y}",
	      	color: "#9ACD32",
			dataPoints: [
				{ label: "PHP", y: 196 },
				{ label: ".NET", y: 263 },
				{ label: "IONIC", y: 134 },
				{ label: "JAVA", y: 216 },
				{ label: "VB", y: 174 },
				{ label: "C", y: 122 },
				{ label: "JQUERY", y: 182 }
			]
		}]
	};
	$("#chartContainer").CanvasJSChart(options);

	function updateChart() {
		var performance, deltaY, yVal;
		var dps = options.data[0].dataPoints;
		for (var i = 0; i < dps.length; i++) {
			deltaY = Math.round(2 + Math.random() * (-2 - 2));
			yVal = deltaY + dps[i].y > 0 ? dps[i].y + deltaY : 0;
			dps[i].y = yVal;
		}
		options.data[0].dataPoints = dps;
		$("#chartContainer").CanvasJSChart().render();
	};
	updateChart();

	setInterval(function () { updateChart() }, 500);

	}

	function CHART() 
	{
		var options = {
			title: {
				text: ""
			},
		data: [{
				type: "pie",
				yValueFormatString: "#,###",
				indexLabel: "{y}",
		      	color: "#FF6347",
				dataPoints: [
					{ label: "PHP", y: 196 },
					{ label: ".NET", y: 263 },
					{ label: "IONIC", y: 134 },
					{ label: "JAVA", y: 216 },
					{ label: "VB", y: 174 },
					{ label: "C", y: 122 },
					{ label: "JQUERY", y: 182 }
				]
			}]
	};
		$("#chartContainer1").CanvasJSChart(options);
	function updateChart() 
	{
		var performance, deltaY, yVal;
		var dps = options.data[0].dataPoints;
		for (var i = 0; i < dps.length; i++) {
			deltaY = Math.round(2 + Math.random() * (-2 - 2));
			yVal = deltaY + dps[i].y > 0 ? dps[i].y + deltaY : 0;
			dps[i].y = yVal;
		}
		options.data[0].dataPoints = dps;
		$("#chartContainer1").CanvasJSChart().render();
	};
		updateChart();
		setInterval(function () { updateChart() }, 500);
	}
	$(document).ready(function()
	{
		$('.dropdown-submenu a.test').on("click", function(e)
		{
			$(this).next('ul').toggle();
			e.stopPropagation();
			e.preventDefault();
		});
	});
</script>