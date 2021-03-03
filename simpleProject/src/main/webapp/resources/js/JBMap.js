/**
 * JBMap.js 
 */
var _layers = {};
var _layerIndex = [];
(function() {
	document.write('<link rel="stylesheet" type="text/css" href="/resources/css/ol.css" />');
	
JBMap = {
		map : null,
		overlay: null,
		//이미지 레이어
		imageLayer : null,
		
		deviceLayer : null,
		
		extent : [0, 0, 1920, 1080],
		
		resolutions: [11.25, 8.653846153846153, 6.65680473372781, 5.120619025944469, 3.938937712264976, 3.0299520863576737, 2.3307323741212875, 1.792871057016375, 1.3791315823202885, 1.0608704479386835, 0.8160541907220642, 0.6277339928631263, 0.4828723022024048, 0.3714402324633883, 0.28572325574106794, 0.2197871198008215, 0.16906701523140114, 0.13005155017800088, 0.1000396539830776, 0.07695357998698277, 0.05919506152844828, 0.04553466271419098, 0.035026663626300754, 0.026943587404846734, 0.02072583646526672, 0.015942951127128246, 0.012263808559329419, 0.00943369889179186, 0.007256691455224507, 0.005582070350172698, 0.004293900269363614],
		
		projection : null,
		
		wkt : null,
		
		alarmInterval : null,
		
		oriExtent : null,	//최초 extent
		
		init : function(isIconPointer, isLock){
			
			
			// Get control of the right-click event:
			document.getElementById("map").oncontextmenu = function(evt){
				evt = evt?evt:window.event;
			 if (evt.preventDefault) evt.preventDefault(); // For non-IE browsers.
			 else return false; // For IE browsers.
			};
			
			this.projection = new ol.proj.Projection({
				code : 'xkcd-image',
				units : 'pixels',
				extent : JBMap.extent
			});
			
			this.overlay = new ol.Overlay({
		        element: document.getElementById('popup'),
		        autoPan: true,
		        autoPanAnimation: {
		          duration: 250
		        }
			});
			
			var mapOptions = {
				layers: [],
				overlays: [this.overlay],
				target: 'map',
				view: new ol.View({
					projection: JBMap.projection,
					center: ol.extent.getCenter(JBMap.extent),
					resolutions: [7.5, 5, 3.33, 2.22, 1.481, 0.9876, 0.6584, 0.4389, 0.2926, 0.195, 0.13, 0.0867, 0.0578, 0.0385]
				})	
			};
			
//			if(isLock) {
//				mapOptions.controls = [];
				mapOptions.interactions = new ol.interaction.defaults({mouseWheelZoom:false});
//			}
			
			this.map =  new ol.Map(mapOptions);
			
			this.wkt = new ol.format.WKT();
			
			this.setLayer();
			
			if(isIconPointer) {
				JBMap.map.on('pointermove', function(evt) {
					JBMap.map.getTargetElement().style.cursor =
	                JBMap.map.hasFeatureAtPixel(evt.pixel) ? 'pointer' : '';
	            });
			}
			
			//지도의 +/-버튼 이미지로 변경
			jQuery("#map").find(".ol-zoom-in").html("<img src='/images/map_zoomin.png' />");
			jQuery("#map").find(".ol-zoom-out").html("<img src='/images/map_zoomout.png' />");
			
		},
		/**
		 * 왼쪽 클릭 이벤트
		 */
		singleClickEvt : function(evt){
			evt.preventDefault();
			console.log(JBMap.map.getEventCoordinate(evt));
		},
		/**
		 * 오른쪽 클릭 이벤트
		 */
//		contextmenuEvt : function(evt){
//			evt.preventDefault();
//			console.log();
//			JBMap.setDrawDeviceIcon(JBMap.map.getEventCoordinate(evt));
//		},
		/**
		 * 레이어 셋팅
		 */
		setLayer :function(){
			this.addImageLayer(); //기본 도면 레이어
			this.addDeviceLayer();// 포인트 레이어
		},
		/**
		 * 배경레이어 기본 등록
		 */
//		addImageLayer : function(_extent, url){
//			this.imageLayer = new ol.layer.Image({
//				source : new ol.source.ImageStatic({
//					url : url,
//					projection : JBMap.projection,
//					imageExtent : _extent
//				})
//			})
//			this.map.addLayer(this.imageLayer);
//			this.map.getView().fit(_extent);
//		},
		
		addImageLayer : function(){
			this.imageLayer = new ol.layer.Image();
			this.map.addLayer(this.imageLayer);
		},
		
		setBaseLayer : function(_extent, url, _callback){
			
			var img = new Image();
			img.onload=function(){
				var features = JBMap.deviceLayer.getSource().getFeatures();
				for(var i=0, cnt=features.length; i<cnt; i++) {
					JBMap.deviceLayer.getSource().removeFeature(features[i]);
				}
				
				var source = new ol.source.ImageStatic({
					url : url,
					projection : JBMap.projection,
					imageExtent : _extent
				});
				JBMap.imageLayer.setSource(source);
				
				var view = new ol.View({
					projection: JBMap.projection,
					center: ol.extent.getCenter(_extent),
					extent: _extent
				});
				
				JBMap.map.setView(view);
				
				view.fit(_extent, {
					size: JBMap.map.getSize(),
					constrainResolution: false
				});
				JBMap.closePopup();
				
				if(typeof _callback === "function") {
					_callback.call(this);
				}
				
			}
			img.onerror=function(){
				var features = JBMap.deviceLayer.getSource().getFeatures();
				for(var i=0, cnt=features.length; i<cnt; i++) {
					JBMap.deviceLayer.getSource().removeFeature(features[i]);
				}
				
				var source = new ol.source.ImageStatic({
					url : "/resources/images/common/noImage.png",
					projection : JBMap.projection,
					imageExtent : _extent
				});
				JBMap.imageLayer.setSource(source);
				
				var view = new ol.View({
					projection: JBMap.projection,
					center: ol.extent.getCenter(_extent),
					extent: _extent
				});
				
				JBMap.map.setView(view);
				view.fit(_extent, {
					size: JBMap.map.getSize(),
					constrainResolution: false
				});
				JBMap.closePopup();
				
				if(typeof _callback === "function") {
					_callback.call(this);
				}
			}
			img.src=url;
			JBMap.oriExtent = _extent;
			
			
		},
		/**
		 * device 레이어
		 */
		addDeviceLayer : function(){
			var source = new ol.source.Vector();
			this.deviceLayer = new ol.layer.Vector({
				source: source
			});			
			this.map.addLayer(this.deviceLayer);
		},
		
		setDrawDeviceIcon : function(item, txt, url , fill_color, isAlarm){
			var img = new Image();
			img.onload=function(){
				if(item.px_x != null && item.px_y != null) {
					var feature = JBMap.wkt.readFeature("POINT("+item.px_x+" "+item.px_y+")");
					var _scale = 28/item.img_width;
					var style = new ol.style.Style({
				        image: new ol.style.Icon({
				          src: url,
				          opacity: 1,
				          scale: _scale
				        }),
				        text: JBMap.getTextStyle(txt , fill_color)
					});
					
					
					var hstyle = new ol.style.Style({
				        image: new ol.style.Icon({
				          src: url,
				          opacity: 0.3,
				          scale: _scale
				        }),
				        text: JBMap.getTextStyle(txt, fill_color)
					});

					feature.setStyle(style);
					if(item.eqpmn_seqno) {
						feature.setId(item.eqpmn_seqno);
					}
					feature.set('data', item);
					
					JBMap.deviceLayer.getSource().addFeature(feature);
					
					if(isAlarm) {
						var check = true;
						JBMap.alarmInterval = setInterval(function(){
							if(check) {
								feature.setStyle(style);
								check = false;
							}else {
								feature.setStyle(hstyle);
								check = true;
							}
						}, 500);
					}
					
				}	
			}
			img.onerror=function(){
				if(item.px_x != null && item.px_y != null) {
					var feature = JBMap.wkt.readFeature("POINT("+item.px_x+" "+item.px_y+")");
					var _scale = 28/item.img_width;
					var style = new ol.style.Style({
				        image: new ol.style.Icon({
				          src: "/resources/images/common/noImage_icon.png",
				          opacity: 1,
				          scale: _scale
				        }),
				        text: JBMap.getTextStyle(txt , fill_color)
					});
					

					feature.setStyle(style);
					if(item.eqpmn_seqno) {
						feature.setId(item.eqpmn_seqno);
					}
					feature.set('data', item);
					
					JBMap.deviceLayer.getSource().addFeature(feature);
					
				}
			}
			img.src=url;
		},
		
		getTextStyle: function(_txt , _color) {
			if(!_color) _color = "#000000";
			return new ol.style.Text({
	        	textAlign: 'center',
                font: '12px Arial',
                text: _txt,
                fill: new ol.style.Fill({color: _color}),
                stroke: new ol.style.Stroke({color: '#ffffff', width: 3}),
                offsetX: 0,
                offsetY: 25,
                placement: 'point',
                maxAngle: '0.7853981633974483',
                rotation: 0
             })
		},
		
		closePopup: function() {
			if(this.overlay != null) {
				this.overlay.setPosition(undefined);
			}
		},
		
		destory: function() {
			if (JBMap.map != null) {
				JBMap.map.setTarget(null);
				JBMap.map = null;
				clearInterval(JBMap.alarmInterval);
				JBMap.alarmInterval = null;
			  }
		},
		
		addPopup: function() {
			
			if(this.overlay != null) {
				JBMap.map.removeOverlay(this.overlay);
				this.overlay = null;
			}
			
			this.overlay = new ol.Overlay({
		        element: document.getElementById('popup'),
		        autoPan: true,
		        autoPanAnimation: {
		          duration: 250
		        }
			});
			
			JBMap.map.addOverlay(this.overlay);
		},
		
		removeAllFeatures: function() {
			if(JBMap.deviceLayer != null) {
				var source = JBMap.deviceLayer.getSource();
				var features = source.getFeatures();
				for(var i=0, cnt=features.length; i<cnt; i++) {
					source.removeFeature(features[i]);
				}
			} 
		},
		
		// 맵 기본 위치로 이동
		setMapReloacate: function() {
			if (JBMap.oriExtent != null && JBMap.map != null && JBMap.map.getView()) {
				JBMap.map.getView().fit(JBMap.oriExtent, {
					size: JBMap.map.getSize(),
					constrainResolution: false
				});
			}
		},
		
		hideBaseLayer: function() {
			JBMap.removeAllFeatures();
			if(JBMap.imageLayer != null) {
				JBMap.imageLayer.setSource(null);
			}
		}
		
	}
})();