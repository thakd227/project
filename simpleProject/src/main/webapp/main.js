//    window.onload = init;
//    function init(){    
//        const map = new ol.Map({
//            view : new ol.View({
//                center : [0,0],
//                zoom : 7,
//                maxZoom : 10,
//                minZoom : 4
//            }),
//             layers : [
//                 new ol.layer.Tile({
//                     source: new ol.source.OSM()
//                 })
//             ],
//            target : 'js-map'
//        })
//        // map.on('click', function(e){
//        //     console.log(e.coordinate);
//        // })
//
//        // const openStreetMapHumanitarian = new ol.layer.Tile({
//        //     source: new ol.source.OSM({
//        //         // url : 'https://{a-c}.title.openstreetmap.fr/hot/{z}/{x}/{y}.png'
//        //         url : 'http://127.0.0.1:5500/asdf.png'
//        //     }),
//        //     visible : true,
//        //     title : 'OSM'
//        // })
//
//        const openStreetMapHumanitariand = new ol.layer.Tile({
//            source: new ol.source.XYZ({
//                // url : 'https://{a-c}.title.openstreetmap.fr/hot/{z}/{x}/{y}.png'
//                url : 'http://127.0.0.1:5500/asdf.png'
//            }),
//            visible : true,
//            title : 'OSM'
//        })
//
//        const image = new ol.ImageTile({
//        src: 'http://127.0.0.1:5500/asdf.png'
//         })
//
//        const fillStyle = new ol.style.Fill({
//            color: [84, 118, 255, 1]
//        })
//        
//        const strokeStyle = new ol.style.Stroke({
//            color: [46, 45, 45, 1],
//            width: 1.2
//        })
//
//        const circleStyle = new ol.style.Circle({
//            fill: new ol.style.Fill({
//                color: [245, 49, 5, 1],
//
//            }),
//            radius: 7,
//            stroke: strokeStyle
//        })
//
//        const korea = new ol.layer.VectorImage({
//            source: new ol.source.Vector({
//               // url: '/libs/data/vector_data/tte.geojson',
//                //url: './libs/tte.geojson',
//                url: 'http://localhost:8080/3342.png',
//                format: new ol.format.GeoJSON()
//            }),
//            visible: true,
//            title: 'KoreaTdsdGeoJSON',
//            style: new ol.style.Style({
//                fill: fillStyle,
//                stroke: strokeStyle,
//                image: circleStyle
//            })
//        })
//        map.addLayer(korea);
//    }
//
//
//
//        const openStreetMapHumanitariand = new ol.layer.Tile({
//            source: new ol.source.XYZ({
//                // url : 'https://{a-c}.title.openstreetmap.fr/hot/{z}/{x}/{y}.png'
//                url : 'http://127.0.0.1:5500/asdf.png'
//            }),
//            visible : true,
//            title : 'OSM'
//        })
//
//        const image = new ol.ImageTile({
//        src: 'http://127.0.0.1:5500/asdf.png'
//         })
//
//        const fillStyle = new ol.style.Fill({
//            color: [84, 118, 255, 1]
//        })
//        
//        const strokeStyle = new ol.style.Stroke({
//            color: [46, 45, 45, 1],
//            width: 1.2
//        })
//
//        const circleStyle = new ol.style.Circle({
//            fill: new ol.style.Fill({
//                color: [245, 49, 5, 1],
//
//            }),
//            radius: 7,
//            stroke: strokeStyle
//        })
//
//        const korea = new ol.layer.VectorImage({
//            source: new ol.source.Vector({
//               // url: '/libs/data/vector_data/tte.geojson',
//                //url: './libs/tte.geojson',
//                url: './libs/3342.geojson',
//                url: 'http://localhost:8080/3342.png',
//                format: new ol.format.GeoJSON()
//            }),
//            visible: true,
//            title: 'KoreaTdsdGeoJSON',
//            style: new ol.style.Style({
//                fill: fillStyle,
//                stroke: strokeStyle,
//                image: circleStyle
//            })
//        }) 
//        map.addLayer(korea);
//    }
//

window.onload = init;
function init() {
	$("#grid").hide();
	
	var extent = [ 0, 0, 1920, 1080 ];

	var projection = new ol.proj.Projection({
		code : 'xkcd-image',
		units : 'pixels',
		extent : extent
	// extent : JBMap.extent
	});
	
	var iconFeature = new ol.Feature({
		  geometry: new ol.geom.Point([1255.8590869879754, 718.7959422805146]),
		  name: '선택 테스트'
		});

	var iconFeature2 = new ol.Feature({
		geometry: new ol.geom.Point([1233.5625457763672, 356.6249656677246]),
		name: '선택 테스트2'
	});
	
	var iconFeature3 = new ol.Feature({
		geometry: new ol.geom.Point([368.0625057220459, 694.1250005364418]),
		name: '선택 테스트3'
	});
	
		var iconStyle = new ol.style.Style({
		  image: new ol.style.Icon({
		    anchor: [0.5, 46],
		    anchorXUnits: 'fraction',
		    anchorYUnits: 'pixels',
		    src: '/image/circle2.png',
		  }),
		});

		iconFeature.setStyle(iconStyle);
		iconFeature2.setStyle(iconStyle);
		iconFeature3.setStyle(iconStyle);

		var vectorSource = new ol.source.Vector({
		  features: [iconFeature, iconFeature2, iconFeature3],
		});

		var vectorLayer = new ol.layer.Vector({
		  source: vectorSource,
		});	

	
	var map = new ol.Map({
		layers : [ new ol.layer.Image({
			source : new ol.source.ImageStatic({
				// 워터마크
				// attributions: '© <a
				// href="http://xkcd.com/license.html">xkcd</a>',
				url : '/image/images.png',
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
	  element: element,
	  positioning: 'bottom-center',
	  stopEvent: false,
	  offset: [0, -50],
	});

	map.addOverlay(popup);

	// display popup on click
	map.on('click', function (evt) {
	  var feature = map.forEachFeatureAtPixel(evt.pixel, function (feature) {
	    return feature;
	  });
	  
	  console.log(feature);
	  if (feature) {
	    var coordinates = feature.getGeometry().getCoordinates();
	    popup.setPosition(coordinates);
	    $("#grid").show();
	   
	    
/*	    $(element).popover({
	      placement: 'top',
	      html: true,
	      content: feature.get('name'),
	    });
		    $(element).popover('show');
	  } else {
	    $(element).popover('dispose');
	  }
	});*/
	  }else{
		  $("#grid").hide();
	  }
	});
	map.on('click', function(e) {
		console.log(e.coordinate)
	})
};