<!DOCTYPE html>
<html lang="ko">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>Static Image</title>
<!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
<script src="https://cdn.polyfill.io/v3/polyfill.min.js?features=fetch,requestAnimationFrame,Element.prototype.classList,URL,TextDecoder"></script>
<link rel="stylesheet" href="/resources/css/styles.css">
<link rel="stylesheet" href="/resources/css/ol.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script src="http://maps.stamen.com/js/tile.stamen.js?v1.3.0"></script>
<script src="/resources/js/ol.js"></script>
<script type="text/javascript" src="/resources/js/JBMap.js"></script>
<script src="/resources/js/main.js"></script>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />




</head>
<body>

	<input type="hidden" id="coordinates" value="${coordinates}">
	<input type="hidden" id="sensor_Cd" value="${sensor_Cd}">
	<input type="hidden" id="sensor_Nm" value="${sensor_Nm}">
	<input type="hidden" id="alarm_Yn" value="${alarm_Yn}">
	<input type="hidden" id="loca_Cd" value="${loca_Cd}">
	<div id="map" class="map">
		X : <input type="text" id="X"> Y : <input type="text" id="Y">
		<input type="button" id="saveCoordinates" value="save">
		<div id="popup"></div>
	</div>

	<div>
		<div id="grid"></div>
	</div>

</body>
</html>



