window.onload = init;
function init() {

	var extent = [ 0, 0, 1920, 1080 ];

	var projection = new ol.proj.Projection({
		code : 'xkcd-image',
		units : 'pixels',
		extent : extent
	// extent : JBMap.extent
	});

	var sensor_Cd = $("#sensor_Cd").val();
	var sensor_Nm = $("#sensor_Nm").val();
	var coordinates = $("#coordinates").val();
	var alarm_Yn = $("#alarm_Yn").val();

	var array = coordinates.split(",");
	var x = array[0];
	var y = array[1];
	$("#X").val(x);
	$("#Y").val(y);

	var iconFeature = new ol.Feature({
		geometry : new ol.geom.Point([ x, y ]),
		name : 'test'
	});

	var iconStyle = new ol.style.Style({
		image : new ol.style.Icon({
			anchor : [ 0.5, 46 ],
			anchorXUnits : 'fraction',
			anchorYUnits : 'pixels',
			src : '/images/circle2.png',
		}),
	});

	iconFeature.setStyle(iconStyle);
	/* iconFeature3.setStyle(iconStyle); */

	var vectorSource = new ol.source.Vector({
		features : [ iconFeature ],
	});

	var vectorLayer = new ol.layer.Vector({
		source : vectorSource,
	});

	var map = new ol.Map({
		layers : [ new ol.layer.Image({
			source : new ol.source.ImageStatic({
				// 워터마크
				// attributions: '© <a
				// href="http://xkcd.com/license.html">xkcd</a>',
				url : '/images/images.png',
				projection : projection,
				imageExtent : extent,
			}),
		}), vectorLayer ],
		target : 'map',
		view : new ol.View({
			projection : projection,
			// projection: JBMap.projection,
			// center : [0,0],
			center : new ol.extent.getCenter(extent),
			zoom : 2,
			maxZoom : 8
		})
	})

	var element = document.getElementById('popup');

	var popup = new ol.Overlay({
		element : element,
		positioning : 'bottom-center',
		stopEvent : false,
		offset : [ 0, -50 ],
	});

	map.addOverlay(popup);

	// display popup on click
	map.on('click', function(evt) {
		var feature = map.forEachFeatureAtPixel(evt.pixel, function(feature) {
			return feature;
		});
		console.log(feature);

		if (feature) {
			var name = "toggle";
			var option = "width = 400, height = 200, top = 100, left = 200";
			var selectData = {};


			window.open("/grid/toggleScreen", name, option);
		} else {
			$(element).popover('dispose');
		}
	});
	var selected = null;
	map.on('pointermove', function(e) {
		var feature = map.forEachFeatureAtPixel(e.pixel, function(feature) {
			return feature;
		});

		if (feature) {
			var coordinates = feature.getGeometry().getCoordinates();
			popup.setPosition(coordinates);
			$(element).popover(
					{
						placement : 'top',
						content : "sensorCD : " + sensor_Cd + " / sensorNM : "
								+ sensor_Nm
					});

			$(element).popover('show');

		} else {
			$(element).popover('dispose');
		}
	});

	// 더블클륵시 좌표 등록
	map.on('dblclick', function(e) {
		var xy = e.coordinate;
		xy.toString().split(",");
		var x = xy[0];
		var y = xy[1];
		$("#X").val(x);
		$("#Y").val(y);
	});

	// 저장버튼 클릭시
	$('#saveCoordinates').click(
			function() {
				var saveCoordinates = {};
				var loca_Cd = $("#loca_Cd").val();
				saveCoordinates.COORDINATE = $("#X").val().toString() + ","
						+ $("#Y").val().toString();
				saveCoordinates.LOCA_CD = loca_Cd;

				$.ajax({
					method : "POST",
					url : "/grid/saveCoordinates",
					data : JSON.stringify(saveCoordinates),
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						alert("save complete");
						opener.location.reload();
						self.close();
						/*alert("succuess :" + data);*/
					},
					error : function(xhr, status, error) {
						alert(error);
					}
				});
			});
};