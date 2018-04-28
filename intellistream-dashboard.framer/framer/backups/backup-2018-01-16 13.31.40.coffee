# METADATA
Framer.info =
	title: "Intellistream Search"
	author: "Ed Monterrubio"
	date: "11/6/2017"
	description: "Intellistream search functionality for GE Oil & Gas"
# SETTINGS
{DynamicLoader} = require "DynamicLoader"
InputModule = require "input"
# exports.mapboxgl = require "mapbox-gl"
# {mapboxgl} = require "npm"
document.body.style.cursor = "auto"
Framer.Extras.Hints.enable()

highCharts = ['//code.highcharts.com/highcharts.js','//code.highcharts.com/modules/data.js','//code.highcharts.com/modules/exporting.js','//code.highcharts.com/highcharts-more.js']

mapboxgl.accessToken = 'pk.eyJ1IjoiZW1vbnRlcnJ1YmlvIiwiYSI6ImNqMmhzbndwNzAwbzYyd3J4OGp1MGx3cTcifQ.bnnjH6UalCsXKym6IUKukw'
	
dashboardWidth = 1280

# COUNTER OPTIONS
options =
	useEasing : true, 
	useGrouping : true, 
	separator : '', 
	decimal : '.', 
	prefix : '', 
	suffix : ''

# ANIMATION CURVES
animateIn = "spring(750,60,50)"
animateOut = "spring(750,65,30)"

# BLUE SHADES
blue01 = "#0D1418" # background
blue02 = "#012939" # header
blue03 = "#065769"
blue04 = "#09819C"
blue05 = "#8BD6FF"

# BASE COLORS
blue = '#00CCFF'
green = '#33FF00'
lemon = "#C5FF00"
yellow = '#FFC107'
red = "#ED2B2A"
orange = "#FF7900"
gray = "#555555"

Screen.backgroundColor = blue01
# DATA

# TIMESERIES DATA
# timeseries = require "timeseriesData"
# timeseriesData = timeseries.data.length
# timeseriesEntry = [0...timeseriesData]

# TABLE DATA
# production = require "tableData"
# productionData = production.data.length
# productionEntry = [0...productionData]

# DATA
production = require "productionData"
productionData = production.data.length
productionEntry = [0...productionData]

# TABLE DATA
tableData = JSON.parse Utils.domLoadDataSync "tableData.json"
dataTable = tableData.length
rowsData = [0...dataTable]

# SEARCH RESULTS DATA
searchResultsData = JSON.parse Utils.domLoadDataSync "searchResultsData.json"
dataResults = searchResultsData.length
rowsSearchData = [0...dataResults]

liftType = ["Gas Lift", "ESP", "PCP", "Rod Lift", "Plunger", "HPU"]

statusColor = ["#FF4545", "#FFCF45", "#45FF68"]

wellName = ["Bishop A #10", "Bishop A #11", "Bishop A #12", "Bishop A #13", "Bishop A #14", "Clark A #4", "Clark A #5", "Clark A #6", "Clark A #7", "Crozier A #1", "Crozier A #2", "Crozier A #3", "Pohler A #1", "Pohler A #2", "Pohler A #3", "Rayes BA #1", "Rayes BA #2", "Writte S #1", "Writte S #2", "Writte S #3"]
# GEO
geojsonGreen = 
	[
		{
			"location": "Wilmington Oil Field",
			"city": "Wilmington, IA 50251",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-92.8513368, 41.5792554] #sully
		},
		{
			"location": "South Belridge Oil Field",
			"city": "Fort Dodge, IA 50501",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-94.2062666, 42.5151921] #fortDodge
		},
		{
			"location": "Coalinga Oil Field",
			"city": "Conata, SD 57790",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-102.1975254, 43.7286025] #conata
		},
		{
			"location": "Elk Hills",
			"city": "Alliance, NE 69301",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-102.8895055, 42.0934715] #alliance
		},
		{
			"location": "Kern River",
			"city": "Green Bay, WI 54301",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-88.0605333, 44.522924] #greenBay
		},
		{
			"location": "Midway-Sunset Field",
			"city": "Portage, WI 53901",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-89.4868971, 43.5548162] #portage
		},
		{
			"location": "Thunder Horse Oil Field",
			"city": "North Platte, NE 69101",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-100.7945923, 41.1277558] #northplatte
		},
		{
			"location": "Bakken Oil Field",
			"city": "Rensselaer, IN 47978",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-87.1948639, 40.9336504] #rensselaer
		},
		{
			"location": "Kelly-Snyder / SACROC",
			"city": "Champaign, IL 61820",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-88.3121287, 40.1146258] #champaign
		},
		{
			"location": "Yates Oil Field",
			"city": "Topeka, KS 66607",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-95.77807, 39.0130336] #topeka
		},
		{
			"location": "East MO Oil Field",
			"city": "Cameron, MO 64429",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-94.2501645, 39.7417187] #cameron
		}
	]

geojsonRed = 
	[
		{
			"location": "Spraberry Trend Field",
			"city": "Winterset, IA 50273",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-94.0354895, 41.3409161] #winterset
		}
	]
	
geojsonYellow = 
	[
		{
			"location": "Swan Hills Field",
			"city": "St. Louis, MO 63101",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-90.822277, 39.6191436] #stLouis
		},{
			"location": "Rainbow Lake Field",
			"city": "Benkelman, NE 69021",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-101.5395919, 40.0520104] #benkelman
		},{
			"location": "Sugar Loaf field",
			"city": "Atkinson, NE 68713",
			"production": Math.round(Utils.randomNumber(100, 500)),
			"coordinates": [-98.9844497, 42.5334601] #atkinson
		}
	]
# CSS STYLES
Utils.insertCSS ("
	section {border-top:1px solid #fff; margin:15px 15px 0 15px; width:210px; padding:0; font-size:14px;}
	section.selectTag {border-top:none; margin-top: 1rem;}
	h2 {font-size:14px; margin:5px 12px 0 12px; padding-top:10px;}
	h2 > span, li > span {float:right;}
	.pill {color: #FFF; font-size: 12px; line-height: 2.2; padding: 0 10px 0 12px; background-color: #065769; border-radius: 20px; height: 25px; display:inline-block;}
	.close {background: url('images/close-icon.svg') right center no-repeat; background-size:cover; display:inline-block; width:10px; float:right; margin:8px 0 0 10px; height:10px;}
	.check-wrapper {position:relative; background-color:#032C36; color:#6BC0D3; border-bottom:1px solid #0F1D25; padding: 5px 0;}
	.check-wrapper input {position:absolute; z-index: 2; top:12px; left:12px;}
	label {padding-left:35px;}
	.more-btn {display:block; float:right; color:#6BC0D3; margin:0 12px 0 0;}
	.blueQuote {color:#6BC0D3;}
	.rowBody {color: #2477b2; font-size:13px; line-height:15px; font-weight:400; font-family:GE Inspira Sans;}
	a {text-decoration: none; color:#2477b2;}
	.rowContent {color:#343A40; font-size: 13px; line-height:15px; font-weight:400; font-family:GE Inspira Sans; text-align:right; float:right;}
	.rowHeader {color:#343A40; font-size:14px; line-height:16px; font-weight:500; font-family:GE Inspira Sans;}
	.rowEntry {font-size: 15px; font-family:GE Inspira Sans; line-height: 2.8; padding: 5px 0px 0px 0px;}
	.analysisLabel {font-size: 12px; font-family:GE Inspira Sans; line-height: 2.5; padding: 0px 0px 0px 45px;}
	.rowCircle{font-size: 18px; padding: 4px 0 0 0;}
	.columnHeader {font-size:12px; line-height: 2.8; text-transform: uppercase; padding: 0px 0px 0px 10px;}
	.headerBorder {border: 1px solid #09819C;}
	.alignRight {text-align:right; float:right;}
	.alignLeft {text-align:left;}
	.metric {color:#868E96; line-height:20px;}
	.row {width:160px; display:block; margin-bottom:3px;}
	.rowWide{width: 220px; display:block; margin-bottom:3px;}
	.label {z-index: 1;}
	.greenLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #33FF00;}
	.waterLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #00CCFF;}
	.gasLegend {color:white; font: 12px GE Inspira Sans; line-height:1.5rem; padding: 0 0.5rem; background-color:#2F373C; border-left:4px solid #FF7900;}
	.marker{cursor:pointer; width:17px; height:21px;}
	.mapboxgl-popup {max-width:200px; font:15px 'GE Inspira Sans'; color:black;}
	ul {list-style:none;}
	li {font-size: 15px; font-family:GE Inspira Sans; color:#8BD6FF; padding:5px 12px; border:none;}
	
	ul.selectMenu {margin-top:4px; height: 30px; width: 120px; color:#fff; font:15px GE Inspira Sans; background-color: #065769;}
	ul.selectMenu li {padding:5px 15px; z-index: 2; list-style:none;}
	ul.selectMenu li:not(.init) {float: left; width:90px; display:none; background-color:#666; }
	ul.selectMenu li:not(.init):hover, ul li.selected:not(.init) { background: #09f; }
	ul.selectMenu li.init {cursor:pointer;}
	.dots {padding: 5px 10px; list-style:none;}
	.dots li { position:relative;}
	.dots li > span {color:#fff;  margin-left:5px; font-size:14px; position:absolute; top:2px; left:25px;}
")
# HEADER
headerBar = new Layer
	width: dashboardWidth, height: 70
	backgroundColor: blue02
	
# assetTreeIcon = new Layer
# 	parent: headerBar
# 	width: 22, height: 20
# 	y: Align.center, x: 25
# 	backgroundColor: null
# 	image: "images/assetTree-icon.svg"
	
avatar = new Layer
	parent: headerBar
	width: 30, height: 30
	image: "images/avatar.png"
	y: Align.center, x: dashboardWidth - 50
	
helpIcon = new Layer
	parent: headerBar
	width: 20, height: 20
	y: Align.center, x:dashboardWidth - 160
	backgroundColor: null
	image: "images/help-icon.svg"
	
appsIcon = new Layer
	parent: headerBar
	width: 22, height: 23
	y: Align.center, x: 25
	backgroundColor: null
	image: "images/apps-icon.svg"

notificationsIcon = new Layer
	parent: headerBar
	width: 22, height: 22
	y: Align.center, x: dashboardWidth - 105
	backgroundColor: null
	image: "images/notification-icon.svg"

# searchIcon = new Layer
# 	parent: headerBar
# 	width: 19, height: 20
# 	y: Align.center, x: dashboardWidth - 210
# 	backgroundColor: null
# 	image: "images/search-icon.svg"

# bhgeLogo = new Layer
# 	parent: headerBar
# 	width: 135, height: 50
# 	y: Align.center, x: appsIcon.width + 60
# 	image: "images/bhge-logo.png"

intelliStreamLogo = new Layer
	parent: headerBar
	width: 95, height: 14
	y: Align.center, x: appsIcon.width + 60
	image: "images/intelliStream-logo.svg"
	scale: 1.1

# KPIS
kpisContainer = new Layer
	width: dashboardWidth, height: 100
	y: headerBar.height
	backgroundColor: blue01
	visible: true
# 	parent: scroll.content

# WELL COUNT
wellKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	
wellCountLabel = new TextLayer
	parent: wellKpiContainer
	x: 25, y: 25
	text: "WELL COUNT"
	font: "300 12px/1.5 GE Inspira Sans"
	color: blue05
	
wellCountVal = new Layer
	parent: wellKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: "white"
	clip: true
wellCountVal.html = '<div id="wellCountVal" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
wellNumber = new CountUp("wellCountVal", 0, Utils.randomNumber(10, 180), 0, 2, options)
wellNumber.start()

# LIQUID COUNT	
liquidKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width
	
liquidCountLabel = new TextLayer
	parent: liquidKpiContainer
	x: 25, y: 25
	text: "LIQUID"
	font: "300 12px/1.5 GE Inspira Sans"
	color: blue05
	
liquidCountVal = new Layer
	parent: liquidKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: "white"
	clip: true
liquidCountVal.html = '<div id="liquidCountVal" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
liquidNumber = new CountUp("liquidCountVal", 0, Utils.randomNumber(1000, 100000), 0, 2, options)
liquidNumber.start()

# OIL COUNT	
oilKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width
	
oilCountLabel = new TextLayer
	parent: oilKpiContainer
	x: 25, y: 25
	text: "OIL"
	font: "300 12px/1.5 GE Inspira Sans"
	color: blue05
	
oilCountVal = new Layer
	parent: oilKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: "white"
	clip: true
oilCountVal.html = '<div id="oilCountVal" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
oilNumber = new CountUp("oilCountVal", 0, Utils.randomNumber(1000, 50000), 0, 2, options)
oilNumber.start()

# WATER COUNT	
waterKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width + oilKpiContainer.width
	
waterCountLabel = new TextLayer
	parent: waterKpiContainer
	x: 25, y: 25
	text: "WATER"
	font: "300 12px/1.5 GE Inspira Sans"
	color: blue05
	
waterCountVal = new Layer
	parent: waterKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: "white"
	clip: true
waterCountVal.html = '<div id="waterCountVal" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
waterNumber = new CountUp("waterCountVal", 0, Utils.randomNumber(1000, 100000), 0, 2, options)
waterNumber.start()

# GAS COUNT	
gasKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width + oilKpiContainer.width + waterKpiContainer.width
	
gasCountLabel = new TextLayer
	parent: gasKpiContainer
	x: 25, y: 25
	text: "GAS"
	font: "300 12px/1.5 GE Inspira Sans"
	color: blue05
	
gasCountVal = new Layer
	parent: gasKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: "white"
	clip: true
gasCountVal.html = '<div id="gasCountVal" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
gasNumber = new CountUp("gasCountVal", 0, Utils.randomNumber(1000, 50000), 0, 2, options)
gasNumber.start()

# ALERTS COUNT	
alertsKpiContainer = new Layer
	parent: kpisContainer
	backgroundColor: null
	width: kpisContainer.width/6, height: kpisContainer.height
	x: wellKpiContainer.width + liquidKpiContainer.width + oilKpiContainer.width + waterKpiContainer.width + gasKpiContainer.width
	
alertsCountLabel = new TextLayer
	parent: alertsKpiContainer
	x: 25, y: 25
	text: "ALERTS"
	font: "300 12px/1.5 GE Inspira Sans"
	color: blue05
	
alertsCountVal = new Layer
	parent: alertsKpiContainer
	width: 140, height: 30, x: 25, y: 45
	backgroundColor: null
	color: "white"
	clip: true
alertsCountVal.html = '<div id="alertsCountVal" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
alertsNumber = new CountUp("alertsCountVal", 0, Utils.randomNumber(1, 50), 0, 2, options)
alertsNumber.start()

div = new TextLayer
	parent: alertsKpiContainer
	x: 55, y: 40
	text: "/"
	font: "300 24px/1.5 GE Inspira Sans"
	color: "white"

alertsCountVal2 = new Layer
	parent: alertsKpiContainer
	width: 140, height: 30, x: 70, y: 45
	backgroundColor: null
	color: "white"
	clip: true
alertsCountVal2.html = '<div id="alertsCountVal2" style="font-size:24px; font-family:GE Inspira Sans; line-height:1";></div>'
alertsNumber = new CountUp("alertsCountVal2", 0, Utils.randomNumber(1, 50), 0, 2, options)
alertsNumber.start()
# TIMESERIES DASHBOARD
gasData = [] # orange
waterData = [] # blue
oilData = [] # green

for i in [0..101-1]
	gasData.push Math.round(Utils.randomNumber(22000, 35000))
	waterData.push Math.round(Utils.randomNumber(30000, 50000))
	oilData.push Math.round(Utils.randomNumber(65000, 90000))

timeseriesContainer = new Layer
	width: dashboardWidth/3 * 2, height: 260
	y: headerBar.height + kpisContainer.height
	backgroundColor: blue01
	visible: true
timeseriesContainer.html = '<div id="timeseriesContainer" style="height:225px;"></div>'

dropDown = new TextLayer
	width: 120, height: 30, x: 230
	y: 13
	backgroundColor: blue04
	text: "Year"
	font: "400 15px/1 -apple-system, GE Isnpira Sans"
	color: "white"
	padding: 8
	parent: timeseriesContainer
	
dropArrow = new Layer
	parent: dropDown
	width: 12, height: 8, x: 95, y: Align.center
	backgroundColor: null
	image: "images/down-arrow.svg"
	
dropDown.onMouseOver () ->
	document.body.style.cursor = "pointer"
	this.backgroundColor = "#065769"
	
dropDown.onMouseOut () ->
	document.body.style.cursor = "auto"
	this.backgroundColor = blue03

widgetControls = new Layer
	parent: timeseriesContainer
	width: 69, height: 19, x: timeseriesContainer.width - 90, y: 20
	image: "images/widget-controls.svg"

oilLegend = new Layer
	parent: timeseriesContainer
	backgroundColor: null
	x: timeseriesContainer.width - 90, y: 65
	width: 70, height: 25
	html: '<div class="greenLegend">Oil</div>'
	
waterLegend = new Layer
	parent: timeseriesContainer
	backgroundColor: null
	x: timeseriesContainer.width - 90, y: oilLegend.y + oilLegend.height + 5
	width: 70, height: 25
	html: '<div class="waterLegend">Water</div>'
	
gasLegend = new Layer
	parent: timeseriesContainer
	backgroundColor: null
	x: timeseriesContainer.width - 90, y: waterLegend.y + waterLegend.height + 5
	width: 70, height: 25
	html: '<div class="gasLegend">Gas</div>'
	
DynamicLoader.series(highCharts).then(->
	timeseriesChart = Highcharts.chart('timeseriesContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'line', renderTo: '', marginLeft: 70, marginRight: 110, marginTop: 65, marginBottom: 20, backgroundColor: null}
		title: {text:'PRODUCTION OVER TIME', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '18px', color: "white", fontWeight: 400}, y: 25, x: 15}
		xAxis:
			categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			tickColor: null, type: 'datetime', tickInterval: 30 * 24 * 3600 * 1000
			labels:
				enabled: true, style: {color: "white"}, format: '{value: %m}'
		yAxis:
			title: null, crosshair: false, tickInterval: 30000
			labels: {style: {color: "white"}}
			gridLineColor: gray
			lineColor: "white"
			lineWidth: 1.5
		series: [{type: 'line', name: 'Gas', data: gasData, color: orange, pointInterval: 3.3 * 24 * 3600 * 1000},{
			type: 'line', name: 'Oil', data: oilData, color: green, pointInterval: 3.3 * 24 * 3600 * 1000},{
			type: 'line', name: 'Water', data: waterData, color: blue, pointInterval: 3.3 * 24 * 3600 * 1000}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Production Over Time</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (cu.ft/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 3)
				pointRange: 30 * 24 * 3600 * 1000
	)
	timeseriesContainer.onMouseOver ->
	timeseriesContainer.onMouseOut ->
)
#              MAP              #
mapContainer = new Layer
	width: dashboardWidth/3 * 2, height: 530
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height
	backgroundColor: null
# 	parent: scroll.content

# blue tint over map
mapOverlay = new Layer
	width: dashboardWidth/3 * 2, height: 530
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height
	backgroundColor: blue05
	blending: "overlay"
# 	parent: mapContainer
	
productionHeader = new TextLayer
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 25
	width: 225, height: 60, x: 25
	text: "PRODUCTION BY REGION"
	font: "400 18px/1.5 GE Inspira Sans"
	color: blue05
# 	parent: mapOverlay
	
regionHeader = new TextLayer
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 25
	width: mapContainer.width, height: 60, x: productionHeader.width
	text: "NORTH AMERICA"
	font: "400 18px/1.5 GE Inspira Sans"
	color: "white"
# 	parent: scroll.content

mapControls = new Layer
	width: 126, height: 18, x: 700
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 30
	image: "images/widget-controls-map.svg"
	
mapIcon = new Layer
	width: 16, height: 16, x: 723
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 31
	image: "images/map-icon.svg"
	
tableIcon = new Layer
	width:16, height: 16, x: 755
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 32
	image: "images/table-icon.svg"
	
expandMapIcon = new Layer
	width: 16, height: 17, x: 815
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 500
	backgroundColor: null
	image: "images/expand-icon.svg"
	
wellCounter = new Layer
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 370
	width: 80, height: 100, x: 25
	backgroundColor: null
	html: '<ul class="dots">
		<li style="color:#ED2B2A;">● <span>' + geojsonRed.length + '<span></li>
		<li style="color:#FFC107;">● <span>' + geojsonYellow.length + '<span></li>
		<li style="color:#33FF00;">● <span>' + geojsonGreen.length + '<span></li>
	</ul>'

# Layer to drop the map instance in
mapboxLayer = new Layer
mapboxLayer.ignoreEvents = false
mapboxLayer.parent = mapContainer 
mapboxLayer.width = mapContainer.width
mapboxLayer.height = mapContainer.height
mapboxLayer.html = "<div id='map'></div>"

# Container for HTML element
mapElement = mapboxLayer.querySelector("#map")
mapElement.style.height = mapContainer.height + 'px'

# start and end coordinates for fly in
start = [-94.6799557, 38.2876203]
end = [-94.2062666, 42.5151921]

map = new mapboxgl.Map({
	attributionControl: false
	container: mapElement
	style: 'mapbox://styles/mapbox/dark-v8'
	center: end
	zoom: 3.5
	pitch: 30
	bearing: -30
	container: 'map'
})

popup = new mapboxgl.Popup({
	offset: 25
	closeButton: false
	closeOnClick: false
})

#              BUILD THE MAP              #
mapBuild = ->		
	map.on 'load', ->
		mapContainer.animate
			properties:
				opacity: 1
			curve: 'ease-in-out'
			time: 0.1
		mapOverlay.animate
			properties:
				opacity: 1
			curve: 'ease-in-out'
			time: 0.1
		map.flyTo({
			center: end
			zoom: 5
			speed: 0.5
			curve: 1
			pitch: 30
			bearing: -10
		})
		Utils.delay 2, ->
			regionHeader.text = "NORTH AMERICA / MIDWEST"
			# ADD GREEN MARKERS TO MAP
			geojsonGreen.forEach (marker) ->
				# create a DOM element for the marker
				el = document.createElement('div')
				icon = document.createElement('img')
				icon.src = "images/green-flag.svg"
				icon.className = "marker"
				el.appendChild(icon)
				
				new mapboxgl.Marker(el, {offset: [-8, -18]})
					.setLngLat(marker.coordinates)
					.addTo(map)
			
				# trigger pop up for each marker
				el.addEventListener 'mouseenter', () ->
					popup.setLngLat(marker.coordinates)
						.setHTML('<strong>' + marker.location + '</strong></br>' + marker.city + '</br><strong>' + marker.production + '</strong> bbl/day')
						.addTo(map)
				el.addEventListener 'mouseleave', () ->
					popup.remove()
					
			# ADD RED MARKERS TO MAP
			geojsonRed.forEach (marker) ->
				# create a DOM element for the marker
				el = document.createElement('div')
				icon = document.createElement('img')
				icon.src = "images/red-flag.svg"
				icon.className = "marker"
				el.appendChild(icon)
				
				new mapboxgl.Marker(el, {offset: [-8, -18]})
					.setLngLat(marker.coordinates)
					.addTo(map)
			
				# trigger pop up for each marker
				el.addEventListener 'mouseenter', () ->
					popup.setLngLat(marker.coordinates)
						.setHTML('<strong>' + marker.location + '</strong></br>' + marker.city + '</br><strong>' + marker.production + '</strong> bbl/day')
						.addTo(map)
				el.addEventListener 'mouseleave', () ->
					popup.remove()
					
			# ADD YELLOW MARKERS TO MAP
			geojsonYellow.forEach (marker) ->
				# create a DOM element for the marker
				el = document.createElement('div')
				icon = document.createElement('img')
				icon.src = "images/yellow-flag.svg"
				icon.className = "marker"
				el.appendChild(icon)
				
				new mapboxgl.Marker(el, {offset: [-8, -18]})
					.setLngLat(marker.coordinates)
					.addTo(map)
			
				# trigger pop up for each marker
				el.addEventListener 'mouseenter', () ->
					popup.setLngLat(marker.coordinates)
						.setHTML('<strong>' + marker.location + '</strong></br>' + marker.city + '</br><strong>' + marker.production + '</strong> bbl/day')
						.addTo(map)
				el.addEventListener 'mouseleave', () ->
					popup.remove()
					
mapBuild()

# add curosr pointer on hover
mapContainer.on Events.TouchMove, ->
	map.scrollZoom.enable()

# WELLS
topWellsContainer = new Layer
	y: kpisContainer.height, x: timeseriesContainer.width
	width: dashboardWidth/3, height: 790
	backgroundColor: blue01
	parent: scroll.content
	visible: true
	
topWellsBarContainer = new Layer
	y: headerBar.height + kpisContainer.height, x: timeseriesContainer.width
	width: dashboardWidth/3, height: 790
	backgroundColor: null
	
topWellHeader = new TextLayer
	height: 60, x: 30, y: 20
	parent: topWellsContainer
	text: "TOP PRODUCING WELLS"
	font: "400 18px/1.5 GE Inspira Sans"
	color: "white"
	
widgetControls = new Layer
	parent: topWellsContainer
	width: 69, height: 19, x: topWellsContainer.width - 90, y: 20
	image: "images/widget-controls.svg"

# create gray bars, well names, esp and BBL labels			
for i in [0...11]
	grayBars = new Layer
		width: 280, height: 4
		y: i * 73 + 115, x: 30
		parent: topWellsContainer
		backgroundColor: gray
		
	well = new TextLayer
		y: grayBars.y - 40, x: 30
		parent: topWellsContainer
		text: wellName[i]
		font: "18px/1 GE Inspira Sans"
		color: "white"
		
	esp = new TextLayer
		y: grayBars.y - 35, x: 30 + well.width + 10
		parent: topWellsContainer
		text: "ESP"
		font: "12px/1 GE Inspira Sans"
		color: "white"
		
	bblLabel = new TextLayer
		y: grayBars.y - 4, x: 360
		parent: topWellsContainer
		text: "BBL/DAY"
		font: "12px/1 GE Inspira Sans"
		color: "white"

# Create an array to store the histogram and an array to assign a random height to each bar 
histogram = []
barWidth = []
	
for j in [0...11]
	bars = new Layer
		width: 0, height: 4
		y: j * 73 + 115, x: 30
		parent: topWellsContainer
		backgroundColor: ""
	
	# populate the arrays with the number of bars and their random generated numbers
	histogram.push bars
	barWidth.push Utils.randomNumber(50, 200)

	# logic to determine the color of the bars
	if barWidth[j] < 100
		bars.backgroundColor = red
		
	if barWidth[j] >= 100 && barWidth[j] <= 150
		bars.backgroundColor = yellow
		
	if barWidth[j] > 150
		bars.backgroundColor = green
	
	BBLCounter = new TextLayer
		y: bars.y - 4, x: 325
		parent: topWellsContainer
		text: Math.round(barWidth[j])
		font: "12px/1 GE Inspira Sans"
		color: "white"

# animate the bars	
for bar, j in histogram
	bar.animate
		curve: 'ease-in-out'
		properties:
			width: barWidth[j]
			x: barWidth[j] - bar
		delay: bar/10
		time: .5
#              DYNAMIC TABLE             #
tableWidth = 1250
tableHeight = 470
tableFullHeight = Screen.height
columnWidth = tableWidth / 11
spineWidth = 240
headerHeight = 40
rowCount = 21

gasData = [] # orange
waterData = [] # blue
oilData = [] # green
	
for i in [0..101-1]
	gasData.push Math.round(Utils.randomNumber(22000, 35000))
	waterData.push Math.round(Utils.randomNumber(30000, 50000))
	oilData.push Math.round(Utils.randomNumber(65000, 90000))

#             TABLE BREADCRUMB             #
backToDashboardBtn = new Layer
	width: 50, height: 60
	y: headerBar.height
	backgroundColor: null
	visible: false
	
backToTableBtn = new Layer
	width: 50, height: 60
	y: headerBar.height
	backgroundColor: null
	visible: false

backArrow = new Layer
# 	parent: backToDashboardBtn
	width: 12, height: 18, x: 25
	y: headerBar.height + 25
	image: "images/back-arrow.svg"
	visible: false
	
backBtnTitle = new TextLayer
# 	parent: backToDashboardBtn
	width: 225, height: 23, x: backArrow.width + 40
	y: headerBar.height + 20
	text: "DASHBOARD"
	font: "400 18px/1.5 GE Inspira Sans"
	color: blue05
	visible: false
	
backBtnSubtitle = new TextLayer
# 	parent: backToDashboardBtn
	width: 225, height: 23
	y: headerBar.height + 20, x: backArrow.width + backBtnTitle.width - 70
	text: "PRODUCTION BY REGION"
	font: "400 18px/1.5 GE Inspira Sans"
	color: "white"
	visible: false

#             TABLE CONTAINER             #	
tableContainer = new Layer
	width: dashboardWidth/3 * 1.95, height: tableHeight - 40
# 	width: tableWidth, height: tableFullHeight
	x: 15
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 60
# 	y: headerBar.height + backToDashboardBtn.height
	clip: true
	backgroundColor: null
	visible: false
	opacity: 0

#             TABLE HEADER             #	
tableHeaderContainer = new Layer
	parent: tableContainer
	backgroundColor: null
	width: tableWidth, height: 30
	shadowY : 1
	shadowColor: blue03
	
statusHeader = new Layer
	width: columnWidth/1.4, height: headerHeight, x: 10
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Status</div>'
	
wellNameHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth - 10
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Well Name</div>'	
	
liftTypeHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 2 + 20
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Lift Type</div>'
	
oilHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 3 + 25
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Oil</div>'
	
waterHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 4 + 10
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Water</div>'
	
gasHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 5
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Gas</div>'
	
energyHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 6 - 20
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Energy</div>'
	
uptimeHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 7 - 30
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">UpTime</div>'
	
gatheringHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 8 - 40
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Gathering</div>'
	
changeHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 9 - 40
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Change</div>'
	
actionsHeader = new Layer
	width: columnWidth, height: headerHeight, x: columnWidth * 10 - 40
	backgroundColor: null
	parent: tableHeaderContainer
	html: '<div class="columnHeader">Actions</div>'
	
expandTableIcon = new Layer
	width: 16, height: 17, x: 815
	y: headerBar.height + kpisContainer.height + timeseriesContainer.height + 500
	backgroundColor: null
	image: "images/expand-icon.svg"
# 	parent: tableContainer
	visible: false
	
#             TABLE SCROLL CONTAINER             #
tableScrollContainer = new ScrollComponent
	width: tableWidth, height: tableFullHeight
	y: tableHeaderContainer.height
	parent: tableContainer
	contentInset: top: 0, bottom: 100
tableScrollContainer.scrollHorizontal = false
tableScrollContainer.mouseWheelEnabled = true

rows = []

#             TABLE BUILD             #
for i in [0..rowCount]	
	tableData = new Layer
		width: tableWidth, height: 42, y: 20 + (43 * i)
		backgroundColor: blue01
		parent: tableScrollContainer.content
		shadowColor: "rgba(250,250,250,0.2)"
		shadowY: 1
		name: "dataRow"
		clip: true
		opacity: 0
		animationOptions:
			curve: Bezier.easeInOut
			time: 0.15
	
	rows.push(tableData)
		
	tableData.expanded = false
	
	tableData.rowSelect = new Layer
		parent: tableData
		width: tableWidth, height: tableData.height
		backgroundColor: null
		visible: false
		
	tableData.statusEntry = new TextLayer
		width: 12, x: 38, y: Align.center
		parent: tableData
		backgroundColor: null
		color: Utils.randomChoice(statusColor)
		text: "●"
		fontSize: 10
		
	tableData.wellNameEntry = new Layer
		width: columnWidth, height: 50, x: wellNameHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice(wellName) + '</div>'
		
	tableData.liftTypeEntry = new Layer
		width: columnWidth, height: 50, x: liftTypeHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice(liftType) + '</div>'
		
	tableData.oilEntry = new Layer
		width: columnWidth, height: 50, x: oilHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([100..1000]) + '</div>'
		
	tableData.waterEntry = new Layer
		width: columnWidth, height: 50, x: waterHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..1000]) + '</div>'
		
	tableData.gasEntry = new Layer
		width: columnWidth, height: 50, x: gasHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..1000]) + '</div>'
		
	tableData.energyEntry = new Layer
		width: columnWidth, height: 50, x: energyHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '</div>'
		
	tableData.uptimeEntry = new Layer
		width: columnWidth, height: 50, x: uptimeHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '</div>'
	
	tableData.gatheringEntry = new Layer
		width: columnWidth, height: 50, x: gatheringHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '</div>'
		
	tableData.changeEntry = new Layer
		width: columnWidth, height: 50, x: changeHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry">' + Utils.randomChoice([10..100]) + '%</div>'
		
	tableData.actionEntry = new Layer
		width: columnWidth, height: 50, x: actionsHeader.x + 10, y: Align.center
		parent: tableData
		backgroundColor: null
		html: '<div class="rowEntry" style="color:#8BD6FF;">Run Analysis</div>'
		
	tableData.overflow_icon = new Layer
		parent: tableData
		width: 4, height: 20, y: Align.center, x: actionsHeader.x + 120
		image: "images/overflow-icon.svg"
		
	tableData.chart = new Layer
		parent: tableData
		width: tableWidth, height: 280
		y: tableData.height
		backgroundColor: blue02
		
	tableData.actions = new Layer
		parent: tableData
		width: 155, height: tableData.chart.height
		x: tableData.chart.width - 155, y: tableData.height
		backgroundColor: null
# 		backgroundColor: "#243C4B"
		html: '<ul>
			<li>Optimize</li>
			<li>Plan</li>
			<li>View Details</li>
			</ul>'
			
	tableData.analysisBtn = new Layer
		parent: tableData
		width: 100, height: 30, x: actionsHeader.x, y: 7
		backgroundColor: null
	
	#             DYNAMICALLY GENERATED DIV IDs	FOR CHARTS IN ROWS             #
	tsDivId = "tsDivId_" + i
	dcDivId = "dcDivId_" + i
	
	tsContainer = new Layer
		width: dashboardWidth/3 * 1.7, height: 260
		y: Align.center, x: 10
		backgroundColor: null
		parent: tableData.chart
	tsContainer.html = '<div id="' + tsDivId + '" style="height:240px;"></div>'
	
	dcContainer = new Layer
		width: dashboardWidth/3 * 1, height: 260
		y: Align.center, x: tsContainer.width
		backgroundColor: null
		parent: tableData.chart
	dcContainer.html = '<div id="' + dcDivId + '" style="height:240px;"></div>'
	
	#             TIMESERIES CHART             #
	timeseriesDataChart = Highcharts.chart(tsDivId,
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'line', marginLeft: 70, marginRight: 110, marginTop: 65, marginBottom: 20, backgroundColor: null}
		title: {text:'PRODUCTION OVER TIME', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '18px', color: "white", fontWeight: 400}, y: 25, x: 15}
		subtitle: {enabled: false}
		xAxis:
			tickColor: null
			type: 'datetime'
			tickInterval: 30 * 24 * 3600 * 1000
			categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			labels:
				enabled: true, style: {color: "white"}, format: '{value: %m}'
		yAxis:
			title: null
			crosshair: false
			tickInterval: 30000
			labels: {style: {color: "white"}}
			gridLineColor: gray
			lineColor: "white"
			lineWidth: 1.5
		series: [{
			type: 'line', name: 'Gas', data: gasData, color: orange
			pointInterval: 3.3 * 24 * 3600 * 1000
			},{
			type: 'line', name: 'Oil', data: oilData, color: green
			pointInterval: 3.3 * 24 * 3600 * 1000
			},{
			type: 'line', name: 'Water', data: waterData, color: blue
			pointInterval: 3.3 * 24 * 3600 * 1000
			}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Production Over Time</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (cu.ft/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			boxplot: {groupPadding: 0, pointPadding: 0, fillColor:'rgba(255,255,255,.75)'}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 3)
				pointRange: 30 * 24 * 3600 * 1000
	)
	
	#             DONUT CHART             #
	donutTotalNum = Utils.randomChoice([1..150])
	donutTotal = new TextLayer
		parent: dcContainer
		backgroundColor: 'transparent'
		width: 90, height: 90
		y: 110, x: 175
		text: donutTotalNum + 'k'
		color: 'white'
		fontSize: 36
		fontWeight: 400
		
	# shift the total number based on a 1 or 2 or 3 digit
	if donutTotalNum < 10
		donutTotal.x = 180
	else if donutTotalNum > 10 and donutTotalNum < 99
		donutTotal.x = 172
	else
		donutTotal.x = 162
	
	donutChart = Highcharts.chart(dcDivId,
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'pie', renderTo: '', marginLeft: 0, marginRight: 20, marginTop: 25, marginBottom: 0, backgroundColor: null}
		title: {text:'GOALS', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '18px', color: "white", fontWeight: 400}, y: 25, x: 15}
		subtitle: null
		series: [{
			colorByPoint: true
			innerSize: '75%'
			data: [
				{name: 'Oil', y: Utils.randomChoice([1..100]), color: green}
				{name: 'Gas', y: Utils.randomChoice([1..100]), color: yellow}
				{name: 'Water', y: Utils.randomChoice([1..100]), color: blue}
			]
		}]
		tooltip:
			enabled: true
			backgroundColor: "rgba(255,255,255,1)"
			borderColor: "#FFFFFF"
			borderWidth: 1
			shadow: false
			headerFormat: ""
			useHTML: true
			pointFormat: '<span style="color:{point.color}">\u25CF</span> {point.name} <br/><b>{point.y}</b>'
		plotOptions:
# 				series:
# 					# THIS TURNS OFF THE WEDGE HIGHLIGHT
# 					states:{hover:{enabled: false}}
			pie:
# 					states: {hover: {enabled: false}}
				borderWidth: 0
				point:
					# THIS GETS RID OF THE TOGGLE
					events: 
						legendItemClick: () -> return false
# 							mouseOver:{hover:{enabled: false}}
				dataLabels:
					enabled: false
					distance: -16
					style: {fontFamily: 'GE Inspira Sans', fontWeight: 500, color: 'white', textOutline: null}
					format: '{y}%'
				allowPointSelect: true
				showInLegend: true
		legend: 
			enabled: false

	)
			
	dcContainer.onMouseOver ->
	dcContainer.onMouseOut ->
		
	dropDown = new TextLayer
		parent: tsContainer
		width: 120, height: 30, x: 230, y: 13
		backgroundColor: blue03
		text: "Year"
		font: "400 15px/1 -apple-system, GE Isnpira Sans"
		color: "white"
		padding: 8
		
	dropArrow = new Layer
		parent: dropDown
		width: 12, height: 8, x: 95, y: Align.center
		backgroundColor: null
		image: "images/down-arrow.svg"
		
	dropDown.onMouseOver () ->
		document.body.style.cursor = "pointer"
		this.backgroundColor = "#065769"
		
	dropDown.onMouseOut () ->
		document.body.style.cursor = "auto"
		this.backgroundColor = blue03
	
	widgetControls = new Layer
		parent: tsContainer
		width: 69, height: 19, x: tsContainer.width - 90, y: 20
		image: "images/widget-controls.svg"
	
	oilLegend = new Layer
		parent: tsContainer
		backgroundColor: null
		x: tsContainer.width - 90, y: 65
		width: 70, height: 25
		html: '<div class="greenLegend">Oil</div>'
		
	waterLegend = new Layer
		parent: tsContainer
		backgroundColor: null
		x: tsContainer.width - 90, y: oilLegend.y + oilLegend.height + 5
		width: 70, height: 25
		html: '<div class="waterLegend">Water</div>'
		
	gasLegend = new Layer
		parent: tsContainer
		backgroundColor: null
		x: tsContainer.width - 90, y: waterLegend.y + waterLegend.height + 5
		width: 70, height: 25
		html: '<div class="gasLegend">Gas</div>'

		tsContainer.onMouseOver ->
		tsContainer.onMouseOut ->
			
	#             TABLE ROWS CLICK ACTIONS                #
	tableData.states =
		selected:
			backgroundColor: blue02
	
	tableData.on Events.MouseOver, (event, layer) ->
		document.body.style.cursor = "pointer"
		this.backgroundColor = blue02
		
	tableData.on Events.MouseOut, (event, layer) ->
		document.body.style.cursor = "auto"
		this.backgroundColor = blue01
		
	tableData.on Events.Click, (event, layer) ->
		toggleExpand(@, 280)
		# this adds or removes a class in order to toggle a background color
		if @.classList.contains("clicked")
			layer.classList.remove("clicked")
			layer.rowSelect.visible = false
		else
			layer.classList.add("clicked")
			layer.rowSelect.visible = true
	
	# from table view to analysis screen		
	tableData.analysisBtn.on Events.Click, (event, layer) ->
		backBtnTitle.text = Utils.randomChoice(wellName).toUpperCase()
		backBtnSubtitle.text = "OPTIMIZATION"
		backToDashboardBtn.visible = false
		backToTableBtn.visible = true
		clearTable()
		buildAnalysis()

#             ROW TOGGLE             #
toggleExpand = (tableData, distance) ->
	distance = if tableData.expanded is false then distance else -distance
	tableData.animate
		height: tableData.height + distance

	for sib in tableData.siblings
		if sib.y > tableData.y
			sib.animate
				y: sib.y + distance
# 				opacity: 0.5
				
	tableData.expanded = !tableData.expanded

#              ANALYSIS             #
analysisContainer = new Layer
	width: tableWidth, height: tableFullHeight
	x: 15, y: headerBar.height + 60
	clip: true
	backgroundColor: null
	visible: false
	opacity: 0

#              A / B Counters             #
aFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: 50, y: 0
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	html: '<div class="analysisLabel">Increase Frequency: </div>'
	
bFrequency = new Layer
	parent: analysisContainer
	width: 375, height: 30, x: aFrequency.width + 80
	borderColor: blue05
	borderWidth: 1
	backgroundColor: null
	opacity: 0
	html: '<div class="analysisLabel">Decrease WHP: </div>'
	
aIcon = new Layer
	parent: aFrequency
	width: 35, height: 30
	image: "images/frequencyA.png"

bIcon = new Layer
	parent: bFrequency
	width: 35, height: 30
	image: "images/frequencyB.png"
	
HzCounter = new Layer
	parent: aFrequency
	width: 85, height: 25, x: 150, y: 1
	color: "white"
	backgroundColor: null
	clip: true
HzCounter.html = '<div id="HzCounter" style="font-size:12px"></div>'
canvasElement = HzCounter.querySelector("#HzCounter")
HzNumber = new CountUp("HzCounter", 0, Utils.randomNumber(15, 100), 0, 4, options)
HzNumber.start()

whpCounter = new Layer
	parent: bFrequency
	width: 85, height: 25, x: 130, y: 1
	color: "white"
	backgroundColor: null
	clip: true
whpCounter.html = '<div id="whpCounter" style="font-size:12px"></div>'
canvasElement = whpCounter.querySelector("#whpCounter")
whpNumber = new CountUp("whpCounter", 0, Utils.randomNumber(15, 100), 0, 4, options)
whpNumber.start()

#              SPLINE CHART CONTAINERS             #
vspCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 50, x: 50
	backgroundColor: blue01
	opacity: 0
vspCurveContainer.html = '<div id="vspCurveContainer" style="height:240px;"></div>'

gradientCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 50, x: vspCurveContainer.width + 80
	backgroundColor: blue01
	opacity: 0
gradientCurveContainer.html = '<div id="gradientCurveContainer" style="height:240px;"></div>'

iprCurveContainer = new Layer
	parent: analysisContainer
	width: 375, height: 240, y: aFrequency.height + 50, x: vspCurveContainer.width + gradientCurveContainer.width + 110
	backgroundColor: blue01
	opacity: 0
iprCurveContainer.html = '<div id="iprCurveContainer" style="height:240px;"></div>'

#              SPLINE CHARTS             #
# DynamicLoader.series(highCharts).then(->
drawSplineCurves = () ->
	vspCurveChart = Highcharts.chart('vspCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'VARIABLE SPEED PERFORMANCE CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: "white", fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'FLOW RATE (rb/d)', style: {color: "white"}}
		yAxis:
			title: {text: 'HEAD (ft)', style: {color: "white"}}
			labels: {enabled: false}
			gridLineColor: gray
			tickInterval: 10
			lineColor: "white"
			lineWidth: 1
		series: [{type: 'spline', name: 'Gas', data: [Utils.randomChoice([0..100]), Utils.randomChoice([0..100]), Utils.randomChoice([0..100])], color: blue}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Flow Rate</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (rb/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 1)
				pointInterval: 24 * 3600 * 1000
	)
	vspCurveContainer.onMouseOver ->
	vspCurveContainer.onMouseOut ->
		
	gradientCurveChart = Highcharts.chart('gradientCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'GRADIENT CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: "white", fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'PRESSURE (psig)', style: {color: "white"}}
		yAxis:
			title: {text: 'TRUE VERTICAL DEPTH (ft)', style: {color: "white"}}
			labels: {enabled: false}
			tickInterval: 10
			gridLineColor: gray
			lineColor: "white"
			lineWidth: 1
		series: [{type: 'spline', name: 'Gas', data: [Utils.randomChoice([0..100]), Utils.randomChoice([0..100]), Utils.randomChoice([0..100])], color: blue}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Pressure</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (rb/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 1)
				pointInterval: 24 * 3600 * 1000
	)
	gradientCurveContainer.onMouseOver ->
	gradientCurveContainer.onMouseOut ->
		
	iprCurveChart = Highcharts.chart('iprCurveContainer',
		credits: {enabled: false}
		exporting: {enabled: false}
		chart: {type: 'spline', renderTo: '', marginLeft: 20, marginRight: 20, marginTop: 35, marginBottom: 20, backgroundColor: null}
		title: {text:'IPR CURVE', align: "left", style: {fontFamily: 'GE Inspira Sans', fontSize: '16px', color: "white", fontWeight: 400}, y: 5, x: 0}
		xAxis:
			tickColor: null
			labels: {enabled: false}
			title: {enabled: true, text: 'FLOW RATE (stb/d)', style: {color: "white"}}
		yAxis:
			title: {text: 'FLOW PRESSURE (psia)', style: {color: "white"}}
			labels: {enabled: false}
			tickInterval: 10
			gridLineColor: gray
			lineColor: "white"
			lineWidth: 1
		series: [{type: 'spline', name: 'Gas', data: [Utils.randomChoice([0..100]), Utils.randomChoice([0..100]), Utils.randomChoice([0..100])], color: blue}]
		legend:
			enabled: false
		tooltip:
			enabled: true
			shared: true
			useHTML: true
			backgroundColor: "white"
			borderColor: '#555555'
			borderWidth: 1
			shadow: false
			headerFormat: '<span class="metric">Flow Pressure</span></br>'
			pointFormat: '<span class="row"><span class="alignLeft"><span style="color:{point.color}">\u25CF</span> {series.name} </span><span class="alignRight"><b> {point.y} (rb/d)</b></span></span>'
		plotOptions:
			line: {lineWidth: 1.5}
			series:
				marker: {enabled: false, symbol: 'circle'}
				states: {hover: {fillColor: null, lineWidth: 2, lineColor: null}}
				pointStart: Date.UTC(2017, 0, 1)
				pointInterval: 24 * 3600 * 1000
	)
	iprCurveContainer.onMouseOver ->
	iprCurveContainer.onMouseOut ->
# )

#              SURFACE FLOWRATE SLIDER             #
surfaceFlowrateSlider = new SliderComponent
	parent: analysisContainer
	x: 110, y: aFrequency.height + vspCurveContainer.height + 180, width: 210, height: 5
	min: 0, max: 2000
# 	value: 1500
	knobSize: 20
	opacity: 0
surfaceFlowrateSlider.fill.backgroundColor = blue
surfaceFlowrateSlider.backgroundColor = "#313C42"
surfaceFlowrateSlider.borderRadius = 0
surfaceFlowrateSlider.animateToValue(1500, {curve: Bezier.easeInOut, time: 0.5})

surfaceFlowrateLabel = new TextLayer
	parent: surfaceFlowrateSlider
	x: -60, y: -40, width: 200, height: 30
	text: "SURFACE FLOWRATE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

surfaceFlowrateValue1 = new TextLayer
	parent: surfaceFlowrateSlider
	x: surfaceFlowrateSlider.width + 15, y: -5, width: 100
	text: 1800
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
surfaceFlowrateValue2 = new TextLayer
	parent: surfaceFlowrateSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 1653
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
surfaceFlowrateUnit = new TextLayer
	parent: surfaceFlowrateSlider
	x: surfaceFlowrateSlider.width + 45, y: -5, width: 100
	text: "stb/d"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
#              BOTTOMHOLE PRESSURE SLIDER             #
bottomholePressureSlider = new SliderComponent
	parent: analysisContainer
	x: 110, y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 800
	knobSize: 20
	opacity: 0
bottomholePressureSlider.fill.backgroundColor = blue
bottomholePressureSlider.backgroundColor = "#313C42"
bottomholePressureSlider.borderRadius = 0
bottomholePressureSlider.animateToValue(800, {curve: Bezier.easeInOut, time: 0.5})

bottomholePressureLabel = new TextLayer
	parent: bottomholePressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "BOTTOMHOLE PRESSURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

bottomholePressureValue1 = new TextLayer
	parent: bottomholePressureSlider
	x: surfaceFlowrateSlider.width + 15, y: -5, width: 100
	text: 2000
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
bottomholePressureValue2 = new TextLayer
	parent: bottomholePressureSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 1260
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
bottomholePressureUnit = new TextLayer
	parent: bottomholePressureSlider
	x: surfaceFlowrateSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"

#             MOTOR TEMPERATURE SLIDER             #	
motorTempSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + 310, y: aFrequency.height + vspCurveContainer.height + 180
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1800
	knobSize: 20
	opacity: 0
motorTempSlider.fill.backgroundColor = red
motorTempSlider.backgroundColor = "#313C42"
motorTempSlider.knob.color = "white"
motorTempSlider.knob.width = 2
motorTempSlider.knob.height = 20
motorTempSlider.animateToValue(1800, {curve: Bezier.easeInOut, time: 0.5})

motorTempLabel = new TextLayer
	parent: motorTempSlider
	x: -60, y: -40, width: 200, height: 30
	text: "MOTOR TEMPERATURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

motorTempValue1 = new TextLayer
	parent: motorTempSlider
	x: motorTempSlider.width + 15, y: -5, width: 100
	text: 260
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
motorTempValue2 = new TextLayer
	parent: motorTempSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 220
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
motorTempUnit = new TextLayer
	parent: motorTempSlider
	x: motorTempSlider.width + 45, y: -5, width: 100
	text: "F"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
#             FREQUENCY SLIDER             #	
frequencySlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + 310
	y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
	opacity: 0
frequencySlider.fill.backgroundColor = lemon
frequencySlider.backgroundColor = "#313C42"
frequencySlider.knob.color = "white"
frequencySlider.knob.width = 2
frequencySlider.knob.height = 20
frequencySlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

frequencyLabel = new TextLayer
	parent: frequencySlider
	x: -60, y: -40, width: 200, height: 30
	text: "FREQUENCY"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

frequencyValue1 = new TextLayer
	parent: frequencySlider
	x: motorTempSlider.width + 15, y: -5, width: 100
	text: 100
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
frequencyValue2 = new TextLayer
	parent: frequencySlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 50
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
frequencyUnit = new TextLayer
	parent: frequencySlider
	x: motorTempSlider.width + 45, y: -5, width: 100
	text: "Hz"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"

#              WELLHEAD PRESSURE SLIDER             #
wellheadPressureSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 510
	y: aFrequency.height + vspCurveContainer.height + 180
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 1400
	knobSize: 20
	opacity: 0
wellheadPressureSlider.fill.backgroundColor = orange
wellheadPressureSlider.backgroundColor = "#313C42"
wellheadPressureSlider.borderRadius = 0
wellheadPressureSlider.knob.color = "white"
wellheadPressureSlider.knob.width = 2
wellheadPressureSlider.knob.height = 20
wellheadPressureSlider.animateToValue(1400, {curve: Bezier.easeInOut, time: 0.5})

wellheadPressureLabel = new TextLayer
	parent: wellheadPressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "WELLHEAD PRESSURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

wellheadPressureValue1 = new TextLayer
	parent: wellheadPressureSlider
	x: wellheadPressureSlider.width + 15, y: -5, width: 100
	text: 425
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
wellheadPressureValue2 = new TextLayer
	parent: wellheadPressureSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 327
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
wellheadPressureUnit = new TextLayer
	parent: wellheadPressureSlider
	x: wellheadPressureSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
#              INTAKE PRESSURE SLIDER             #
intakePressureSlider = new SliderComponent
	parent: analysisContainer
	x: surfaceFlowrateSlider.width + bottomholePressureSlider.width + 510
	y: aFrequency.height + vspCurveContainer.height + 270
	width: 210, height: 5
	min: 0, max: 2000
# 	value: 500
	knobSize: 20
	opacity: 0
intakePressureSlider.fill.backgroundColor = green
intakePressureSlider.backgroundColor = "#313C42"
intakePressureSlider.borderRadius = 0
intakePressureSlider.knob.color = "white"
intakePressureSlider.knob.width = 2
intakePressureSlider.knob.height = 20
intakePressureSlider.animateToValue(500, {curve: Bezier.easeInOut, time: 0.5})

intakePressureLabel = new TextLayer
	parent: intakePressureSlider
	x: -60, y: -40, width: 200, height: 30
	text: "INTAKE PRESSURE"
	color: "white"
	fontSize: 12
	fontFamily: "GE Inspira Sans"

intakePressureValue1 = new TextLayer
	parent: intakePressureSlider
	x: wellheadPressureSlider.width + 15, y: -5, width: 100
	text: 6000
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
intakePressureValue2 = new TextLayer
	parent: intakePressureSlider
	x: -60, y: -12, width: 50
	borderColor: "white"
	borderWidth: 1
	padding: 8
	text: 1032
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	fontWeight: 600
	
intakePressureUnit = new TextLayer
	parent: intakePressureSlider
	x: wellheadPressureSlider.width + 45, y: -5, width: 100
	text: "psig"
	fontSize: 12
	color: "white"
	fontFamily: "GE Inspira Sans"
	
# Listen for slider value updates
surfaceFlowrateSlider.knob.onDrag ->
	surfaceFlowrateValue1.text = Math.round(surfaceFlowrateSlider.value)
	surfaceFlowrateValue2.text = Math.round(surfaceFlowrateSlider.value/1.2)
	motorTempValue1.text = Math.round(motorTempSlider.value)
	motorTempValue2.text = Math.round(motorTempSlider.value/1.2)
	wellheadPressureValue1.text = Math.round(wellheadPressureSlider.value)
	wellheadPressureValue2.text = Math.round(wellheadPressureSlider.value/1.2)
	bottomholePressureValue1.text = Math.round(bottomholePressureSlider.value)
	bottomholePressureValue2.text = Math.round(bottomholePressureSlider.value/1.2)
	frequencyValue1.text = Math.round(frequencySlider.value)
	frequencyValue2.text = Math.round(frequencySlider.value/1.2)
	intakePressureValue1.text = Math.round(intakePressureSlider.value)
	intakePressureValue2.text = Math.round(intakePressureSlider.value/1.2)
	motorTempSlider.animate
		value: surfaceFlowrateSlider.value / 1
		options: {curve: "lineal", time: 0.1}
	wellheadPressureSlider.animate
		value: surfaceFlowrateSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	bottomholePressureSlider.animate
		value: surfaceFlowrateSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	frequencySlider.animate
		value: surfaceFlowrateSlider.value * 1.1
		options: {curve: "lineal", time: 0.1}
	intakePressureSlider.animate
		value: surfaceFlowrateSlider.value * 1.2
		options: {curve: "lineal", time: 0.1}
		
surfaceFlowrateSlider.knob.onDragEnd ->
	drawSplineCurves()
	
bottomholePressureSlider.knob.onDrag ->
	bottomholePressureValue1.text = Math.round(bottomholePressureSlider.value)
	bottomholePressureValue2.text = Math.round(bottomholePressureSlider.value/1.2)
	surfaceFlowrateValue1.text = Math.round(surfaceFlowrateSlider.value)
	surfaceFlowrateValue2.text = Math.round(surfaceFlowrateSlider.value/1.2)
	motorTempValue1.text = Math.round(motorTempSlider.value)
	motorTempValue2.text = Math.round(motorTempSlider.value/1.2)
	wellheadPressureValue1.text = Math.round(wellheadPressureSlider.value)
	wellheadPressureValue2.text = Math.round(wellheadPressureSlider.value/1.2)
	frequencyValue1.text = Math.round(frequencySlider.value)
	frequencyValue2.text = Math.round(frequencySlider.value/1.2)
	intakePressureValue1.text = Math.round(intakePressureSlider.value)
	intakePressureValue2.text = Math.round(intakePressureSlider.value/1.2)
	motorTempSlider.animate
		value: bottomholePressureSlider.value / 1
		options: {curve: "lineal", time: 0.1}
	wellheadPressureSlider.animate
		value: bottomholePressureSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	surfaceFlowrateSlider.animate
		value: bottomholePressureSlider.value / 1.5
		options: {curve: "lineal", time: 0.1}
	frequencySlider.animate
		value: bottomholePressureSlider.value * 1.1
		options: {curve: "lineal", time: 0.1}
	intakePressureSlider.animate
		value: bottomholePressureSlider.value * 1.2
		options: {curve: "lineal", time: 0.1}
		
	bottomholePressureSlider.knob.onDragEnd ->
		drawSplineCurves()

analysisSave = new Layer
	parent: analysisContainer
	width: 1165, height: 30, x: 50
	y: aFrequency.height + vspCurveContainer.height + surfaceFlowrateSlider.height + bottomholePressureSlider.height + 400
	image: "images/analysis-save.png"
	opacity: 0

# FACETED PANEL
facetWidth = 240

facetContainer = new Layer
	width: facetWidth, height: Screen.height
	y: headerBar.height + 1
	backgroundColor: blue01
	opacity: 0

facetedPanelBuild = ->
	selectedTags = new Layer
		parent: facetContainer
		backgroundColor: null
	selectedTags.html = '<section class="selectTag">
		<h2>SELECTED TAGS</h2>
		<p class="pill">ESP<span class="close"></span></p>
		<p class="pill">Total Liquid<span class="close"></span></p>
		<p class="pill">Oil Production<span class="close"></span></p>
		<p class="pill">BBL/Day<span class="close"></span></p>
		</section>'
			
	pumps = new Layer
		parent: facetContainer
		backgroundColor: null
		y: 150
	pumps.html = '<section>
		<h2>PUMPS</h2>
		<ul>
			<li>Electronic Submersible</li>
			<li>Rod Lift</li>
			<li>Plunger</li>
			<li>Gas Lift</li>
		</ul>
		<a class="more-btn">more</a>
		</section>'
		
	pumpCounter = new Layer
		width: 85, height: 25, x: 190, y: 180
		color: "white"
		backgroundColor: null
		parent: facetContainer
		clip: true
	pumpCounter.html = '<div id="pumpCount" style="font-size:14px"></div>'
	canvasElement = pumpCounter.querySelector("#pumpCount")
	pumpnumber = new CountUp("pumpCount", 0, Utils.randomNumber(150, 300), 0, 4, options)
	pumpnumber.start()
		
	espCounter = new Layer
		parent: facetContainer
		width: 85, height: 25, x: 196, y: 215
		color: blue05
		backgroundColor: null
		clip: true
	espCounter.html = '<div id="espCount" style="font-size:14px"></div>'
	canvasElement = espCounter.querySelector("#espCount")
	espnumber = new CountUp("espCount", 0, Utils.randomNumber(10, 100), 0, 6, options)
	espnumber.start()
	
	rodLiftCounter = new Layer
		parent: facetContainer
		width: 85, height: 25, x: 196, y: 253
		color: blue05
		backgroundColor: null
		clip: true
	rodLiftCounter.html = '<div id="rodLiftCount" style="font-size:14px"></div>'
	canvasElement = rodLiftCounter.querySelector("#rodLiftCount")
	rodLiftnumber = new CountUp("rodLiftCount", 0, Utils.randomNumber(10, 100), 0, 6, options)
	rodLiftnumber.start()
	
	plungerCounter = new Layer
		parent: facetContainer
		width: 85, height: 25, x: 196, y: 293
		color: blue05
		backgroundColor: null
		clip: true
	plungerCounter.html = '<div id="plungerCount" style="font-size:14px"></div>'
	canvasElement = plungerCounter.querySelector("#plungerCount")
	plungernumber = new CountUp("plungerCount", 0, Utils.randomNumber(10, 100), 0, 6, options)
	plungernumber.start()
	
	gasLiftCounter = new Layer
		parent: facetContainer
		y: 330
		color: blue05
		backgroundColor: null
		clip: true
	gasLiftCounter.html = '<div id="gasLiftCount" style="font-size:14px"></div>'
	canvasElement = gasLiftCounter.querySelector("#gasLiftCount")
	gasLiftnumber = new CountUp("gasLiftCount", 0, Utils.randomNumber(10, 100), 0, 6, options)
	gasLiftnumber.start()
		
	kpis = new Layer
		parent: facetContainer
		backgroundColor: null
		y: 400
	kpis.html = '<section>
		<h2>KPIS</h2>
		<form>
			<div class="check-wrapper">
				<input type="checkbox"><label>Total Liquid</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Oil Prodction</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Prodcution</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Gas Produciton</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Uptime</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Water Cut</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>Operational Expenditure</label>
			</div>
		</form>
		<a class="more-btn">more</a>
		</section>'
		
	volumes = new Layer
		parent: facetContainer
		backgroundColor: null
		y: 770
	volumes.html = '<section>
		<h2>VOLUMES</h2>
		<form>
			<div class="check-wrapper">
				<input type="checkbox"><label>BBL/DAY</label>
			</div>
			<div class="check-wrapper">
				<input type="checkbox"><label>MCFD</label>
			</div>
		</form>
		<a class="more-btn">more</a>
		</section>'
# SEARCH
resultsWidth = 1030
resultsTableWidth = 990
resultsTableHeight = 1000

searchIcon = new Layer
	width: 18, height: 18
	x: headerBar.width/1.195, y: headerBar.height/3.3
	backgroundColor: null
	parent: headerBar
searchIcon.html = """
<svg width="19px" height="19px" viewBox="0 0 19 19">
    <g id="Symbols" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="app-header" transform="translate(-812.000000, -25.000000)" stroke="#FFFFFF">
            <g id="search">
                <g transform="translate(812.497459, 25.500000)">
                    <path d="M14.9682729,7.73286614 C14.9682729,11.7268548 11.7293954,14.9657323 7.73540676,14.9657323 C3.73997151,14.9657323 0.502540621,11.7268548 0.502540621,7.73286614 C0.502540621,3.73887746 3.73997151,0.5 7.73540676,0.5 C11.7293954,0.5 14.9682729,3.73887746 14.9682729,7.73286614 Z M12.4169517,13.3979362 L17.5175689,18.5 L12.4169517,13.3979362 Z" id="search-icon"></path>
                </g>
            </g>
        </g>
    </g>
</svg>
"""

closeIcon = new Layer
	width: 14, height: 13
	x: headerBar.width/1.2, y: headerBar.height/4
	backgroundColor: null
	parent: headerBar
	visible: false
	opacity: 0
closeIcon.html = """
<svg width="14px" height="13px" viewBox="0 0 14 13">
    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="search-icon" transform="translate(-631.000000, -428.000000)" stroke="#6BC0D3">
            <g id="Close" transform="translate(632.000000, 428.000000)">
                <path d="M6,6.788 L0,12.788 L6,6.788 L0,0.788 L6,6.788 Z M6,6.788 L12,0.788 L6,6.788 L12,12.788 L6,6.788 Z" id="close-icon"></path>
            </g>
        </g>
    </g>
</svg>
"""

closeBtn = new Layer
	parent: closeIcon
	width: 16, height: 16, y: 10
	backgroundColor: null

searchUnderline = new Layer
	height: 1, width: 0
	x: headerBar.width/1.21, y: headerBar.height/1.3
	backgroundColor: "white"
	parent: headerBar

searchField = new Layer
	parent: headerBar
	height: 30, width: 350
	x: headerBar.width/1.8, y: headerBar.height/4
	backgroundColor: 'transparent'
	visible: false
	opacity: 0
	
buildSearchBar = ->
	searchField.visible = true
	closeIcon.visible = true
	searchIcon.animate
		x: headerBar.width/1.86
		options:
			curve: Bezier.easeInOut
			time: .2
	# change the color through a unique ID in the SVG code for the search icon
	document.getElementById("search-icon").style.stroke = blue03
	searchUnderline.animate
		x: headerBar.width/1.87
		width: 400
		backgroundColor: blue03
		options:
			curve: Bezier.easeInOut
			time: .1
	searchField.animate
		opacity: 1
		options:
			curve: Bezier.easeInOut
			time: .1
			delay: 0.5
	closeIcon.animate
		opacity: 1
		options:
			curve: Bezier.easeInOut
			time: .1
			delay: 0.5
			
closeSearchBar = ->
	searchIcon.animate
		x: headerBar.width/1.2
		options:
			curve: Bezier.easeInOut
			time: .1
	# change the color through a unique ID in the SVG code for the search icon
	document.getElementById("search-icon").style.stroke = "white"
	searchUnderline.x = headerBar.width/1.21
	searchUnderline.width = 0
	searchUnderline.backgroundColor = "white"
	searchField.animate
		opacity: 0
		options:
			curve: Bezier.easeInOut
			time: .1
			delay: 0.5
	closeIcon.animate
		opacity: 0
		options:
			curve: Bezier.easeInOut
			time: .1
			delay: 0.5
	searchField.visible = false
	closeIcon.visible = false

# OPEN SEARCH FIELD
searchIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
				
searchIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
searchIcon.on Events.TouchEnd, ->
	buildSearchBar()

# CLOSE SEARCH FIELD
closeIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
				
closeIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
closeIcon.on Events.TouchEnd, ->
	closeSearchBar()

search_data = [
	"Show me top producing wells",
	"Show me high priority alerts", 
	"Show me immediate action items", 
	"Show me [all] wells < [300]", 
	"Show me [all] [ESP wells]", 
	"Show me details on [Thomas field]",
	"What is the condition on [Edison 1A]", 
	"Show me on the changes I've made]", 
	"How is my [all] [pad] performing against [goals]",
	"Show me SmartSignal Analysis", 
	"Update me on the recent changes across [entire] [organization]", 
	"Show me notifications", 
	"Show me [Digital Twin]"
	"which wells have high alerts",
	"what regions have the most optimized wells",
	"which wells have been decommissioned",
	"what production dashboards most accurately display my wells status",
	"where are the the least optimized wells for my region located",
	"which wells need optimization",
	"what dashboards show optimized well production from the last 7 days",
	"which production wells are under performing",
	"which field in the US was optimized lately",
	"which analytics best describes my well performance for 2017"
]

#------------------------------#
#       SEARCH RESULTS         #
#------------------------------#
searchResultsScroll = new ScrollComponent
	width: resultsWidth, height: Screen.height
	x: facetWidth, y: headerBar.height + 80
	visible: false
	
searchResultsScroll.scrollHorizontal = false
searchResultsScroll.contentInset = bottom: 100
searchResultsScroll.mouseWheelEnabled = true

#------------------------------#	
#          SCROLL BAR          #
#------------------------------#
scrollBar = new SliderComponent 
	parent: searchResultsScroll.content
	width: 10, height: searchResultsScroll.height - 10
	x: searchResultsScroll.width - 10
	min: 0, max: 100, value: 0
	backgroundColor: null
	clip: true
	visible: false
scrollBar.centerY()
scrollBar.fill.backgroundColor = null

# Style the knob of the slider
scrollBar.knob.props = 
	width: 10, height: 80, y: 10
	backgroundColor: "rgba(255,255,255,0.5)"
	borderRadius: 50
	clip: false
	
# Connect the slider to the scroll event
searchResultsScroll.on Events.Move, ->	
	scrollBar.value = Utils.modulate(searchResultsScroll.scrollY, [0, searchResultsScroll.content.height - searchResultsScroll.height], [0, 100], true)
	
updatePosition = -> 	
	scrollValue = Utils.modulate(scrollBar.value, [0, 100], [0, searchResultsScroll.content.height - searchResultsScroll.height], true)
	searchResultsScroll.scrollY = scrollValue

scrollBar.onMouseDown ->
	@on "change:value", updatePosition
			
scrollBar.onMouseUp -> 
	@off "change:value", updatePosition
	
#-----------------------------------#
#          FEATURED CHARTS          #
#-----------------------------------#
relevance = new TextLayer
	parent: searchResultsScroll.content
	x: 20
	text: "HIGHEST RELEVANCE"
	fontSize: 12
	fontFamily: "GE Inspira Sans"
	color: "white"
	opacity: 0
	
closeIconFeature = new Layer
	width: 14, height: 13
	x: searchResultsScroll.width - 40, y: -10
	backgroundColor: null
	parent: searchResultsScroll.content
	opacity: 0
closeIconFeature.html = """
<svg width="14px" height="13px" viewBox="0 0 14 13">
    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="search-results-dark" transform="translate(-631.000000, -428.000000)" stroke="#6BC0D3">
            <g id="Close" transform="translate(632.000000, 428.000000)">
                <path d="M6,6.788 L0,12.788 L6,6.788 L0,0.788 L6,6.788 Z M6,6.788 L12,0.788 L6,6.788 L12,12.788 L6,6.788 Z" id="close-icon"></path>
            </g>
        </g>
    </g>
</svg>
"""
#---------------------------------------#	
#          LEFT FEATURED CHART          #
#---------------------------------------#	
featureWellLeft = new Layer
	parent: searchResultsScroll.content
	width: 490, height: 305
	x: 20, y: 60
	backgroundColor: blue02
	borderColor: blue03
	borderWidth: 1
	opacity: 0

featureWellLeftBuild = ->
	wellLeftChartContainer = new Layer
		parent: featureWellLeft
		width: 450, height: 200, x: 20, y: 20
		backgroundColor: null
	wellLeftChartContainer.html = '<div id="wellLeftChartContainer" style="height:200px;"></div>'
	
	DynamicLoader.series(highCharts).then(->	
		drawLeftChart = ->
			leftChart = Highcharts.chart('wellLeftChartContainer',
				credits: {enabled: false}
				exporting: {enabled: false}
				chart: {renderTo: 'wellLeftChartContainer', marginLeft: 20, marginRight: 0, marginTop: 20, marginBottom: 20, backgroundColor: null}
				title: {text:''}
				subtitle: {enabled: false}
				xAxis:
					title: 
						text: 'TEMPERATURE'
						style: 
							color: "white"
					minorTickLength: 0
					tickLength: 0
					labels: {enabled: false}
					lineColor: "white"
				yAxis:
					title: 
						text:'FLOWRATE'
						style: 
							color: "white"
					crosshair: false
					tickInterval: 50
					labels: {enabled: false}
					gridLineColor: blue04
					lineColor: "white"
					lineWidth: 1.5
				series: [{
					type: 'column'
# 					data: [129.9, 171.5, 206.4, 229.2, 244.0, 276.0, 235.6, 298.5, 376.4, 294.1, 195.6, 154.4], color: blue04
					data: [Math.floor(Utils.randomNumber(100, 150)), Math.floor(Utils.randomNumber(100, 150)), Math.floor(Utils.randomNumber(100, 200)), Math.floor(Utils.randomNumber(100, 200)), Math.floor(Utils.randomNumber(100, 250)), Math.floor(Utils.randomNumber(100, 250)), Math.floor(Utils.randomNumber(100, 300)), Math.floor(Utils.randomNumber(100, 350)), Math.floor(Utils.randomNumber(100, 400)), Math.floor(Utils.randomNumber(100, 400)), Math.floor(Utils.randomNumber(100, 300)), Math.floor(Utils.randomNumber(100, 250))], color: blue04
					pointInterval: 24 * 3600 * 1000
					}]
				legend:
					enabled: false
				tooltip:
					enabled: true
					shared: true
					useHTML: true
					backgroundColor: "white"
					borderColor: '#555555'
					borderWidth: 1
					shadow: false;
					headerFormat: '<span class="metric">Flowrate 2017</br>Average Production (Wells)</span>'
					pointFormat: '<span class="row">
						<span class="alignLeft"><span style="color:{point.color};">\u25AE</span> {series.name}</span>
						<span class="alignRight"><b>{point.y} (cu.ft/d)</b></span>
						</span>'
				plotOptions:
					column: {groupPadding: 0.1}
					legend: {enabled: false}
					series:
						# THIS GETS RID OF THE TOGGLE
						events: {legendItemClick: () -> return false}
						# THIS SETS THE MONTH RANGE BY DAY
						pointRange: 24 * 3600 * 1000
						marker: {fillColor:'#FFF', lineWidth: 2, lineColor: null}
						borderColor: null
				)
			
		wellLeftChartContainer.onMouseOver ->
		wellLeftChartContainer.onMouseOut ->
		wellLeftChartContainer.onClick ->
		drawLeftChart()
	)
	
	assetLeft = new TextLayer
		parent: featureWellLeft
		x: 20, y: 245
		text: "WELL 3B"
		fontSize: 18
		fontFamily: "GE Inspira Sans"
		color: "white"
		
	assetLeftOF = new TextLayer
		parent: featureWellLeft
		x: 20, y: 270
		text: "Operating Frequency:"
		fontSize: 12
		fontFamily: "GE Inspira Sans"
		color: "white"
		
	frequencyCount1 = new Layer
		width: 85, height: 25, x: 132, y: 264
		color: "white"
		backgroundColor: null
		parent: featureWellLeft
		clip: true
	frequencyCount1.html = '<div id="frequencyCount1" style="font-size:12px"></div>'
	canvasElement = frequencyCount1.querySelector("#frequencyCount1")
	number = new CountUp("frequencyCount1", 0, Utils.randomNumber(10, 80), 1, 4, options)
	number.start()
	
	runAnalysisBtn = new Layer
		parent: featureWellLeft
		width: 100, height: 35
		x: 350, y: 250
		backgroundColor: blue03
		html: "ESP Sandbox"
	runAnalysisBtn.style =
		fontSize: "14px"
		fontFamily: "GE Inspira Sans"
		padding: "3px 0 0 12px"
		
	runAnalysisBtn.on Events.MouseOver, (event, layer) ->
		document.body.style.cursor = "pointer"
		this.backgroundColor = blue04
		
	runAnalysisBtn.on Events.MouseOut, (event, layer) ->
		document.body.style.cursor = "auto"
		this.backgroundColor = blue03
		
	overflowIcon = new Layer
		width: 14, height: 13
		x: 465, y: 255
		backgroundColor: null
		parent: featureWellLeft
	overflowIcon.html = """
	<svg width="4px" height="20px" viewBox="0 0 4 20">
	    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
	        <g id="search-results-dark" transform="translate(-725.000000, -480.000000)" fill="#FFFFFF">
	            <g id="search-results" transform="translate(255.000000, 100.000000)">
	                <g id="featured-results" transform="translate(5.000000, 88.000000)">
	                    <g id="featured" transform="translate(0.000000, 32.000000)">
	                        <g id="esp" transform="translate(15.000000, 25.000000)">
	                            <g id="overflow-copy-2" transform="translate(450.000000, 235.000000)">
	                                <path d="M2,12 C3.1045695,12 4,11.1045695 4,10 C4,8.8954305 3.1045695,8 2,8 C0.8954305,8 0,8.8954305 0,10 C0,11.1045695 0.8954305,12 2,12 Z M2,4 C3.1045695,4 4,3.1045695 4,2 C4,0.8954305 3.1045695,0 2,0 C0.8954305,0 0,0.8954305 0,2 C0,3.1045695 0.8954305,4 2,4 Z M2,20 C3.1045695,20 4,19.1045695 4,18 C4,16.8954305 3.1045695,16 2,16 C0.8954305,16 0,16.8954305 0,18 C0,19.1045695 0.8954305,20 2,20 Z" id="overflow-icon"></path>
	                            </g>
	                        </g>
	                    </g>
	                </g>
	            </g>
	        </g>
	    </g>
	</svg>
	"""
	
#----------------------------------------#	
#          RIGHT FEATURED CHART          #
#----------------------------------------#
featureWellRight = new Layer
	parent: searchResultsScroll.content
	width: 490, height: 305
	x: 520, y: 60
	backgroundColor: blue02
	borderColor: blue03
	borderWidth: 1
	opacity: 0
	
featureWellRightBuild = ->
	wellRightChartContainer = new Layer
		parent: featureWellRight
		width: 450, height: 200, x: 20, y: 20
		backgroundColor: null
	wellRightChartContainer.html = '<div id="wellRightChartContainer" style="height:200px;"></div>'
	
	DynamicLoader.series(highCharts).then(->	
		drawRightChart = ->
			RightChart = Highcharts.chart('wellRightChartContainer',
				credits: {enabled: false}
				exporting: {enabled: false}
				chart: {renderTo: 'wellRightChartContainer', marginLeft: 20, marginRight: 0, marginTop: 20, marginBottom: 20, backgroundColor: null}
				title: {text:''}
				subtitle: {enabled: false}
				xAxis:
					title: 
						text: 'TEMPERATURE'
						style: 
							color: "white"
					minorTickLength: 0
					tickLength: 0
					labels: {enabled: false}
					lineColor: "white"
				yAxis:
					title: 
						text:'FLOWRATE'
						style: 
							color: "white"
					crosshair: false
					tickInterval: 50
					labels: {enabled: false}
					gridLineColor: blue04
					lineColor: "white"
					lineWidth: 1.5
				series: [{
					type: 'column'
# 					data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4], color: blue04
					data: [Math.floor(Utils.randomNumber(100, 150)), Math.floor(Utils.randomNumber(100, 150)), Math.floor(Utils.randomNumber(100, 200)), Math.floor(Utils.randomNumber(100, 200)), Math.floor(Utils.randomNumber(100, 250)), Math.floor(Utils.randomNumber(100, 250)), Math.floor(Utils.randomNumber(100, 300)), Math.floor(Utils.randomNumber(100, 350)), Math.floor(Utils.randomNumber(100, 400)), Math.floor(Utils.randomNumber(100, 400)), Math.floor(Utils.randomNumber(100, 300)), Math.floor(Utils.randomNumber(100, 250))], color: blue04
					pointInterval: 24 * 3600 * 1000
					}]
				legend:
					enabled: false
				tooltip:
					enabled: true
					shared: true
					useHTML: true
					backgroundColor: "white"
					borderColor: '#555555'
					borderWidth: 1
					shadow: false;
					headerFormat: '<span class="metric">Flowrate 2017</br>Average Production (Wells)</span>'
					pointFormat: '<span class="row">
						<span class="alignLeft"><span style="color:{point.color};">\u25AE</span> {series.name}</span>
						<span class="alignRight"><b>{point.y} (cu.ft/d)</b></span>
						</span>'
				plotOptions:
					column: {groupPadding: 0.1}
					legend: {enabled: false}
					series:
						# THIS GETS RID OF THE TOGGLE
						events: {legendItemClick: () -> return false}
						# THIS SETS THE MONTH RANGE BY DAY
						pointRange: 24 * 3600 * 1000
						marker: {fillColor:'#FFF', lineWidth: 2, lineColor: null}
						borderColor: null
				)
			
		wellRightChartContainer.onMouseOver ->
		wellRightChartContainer.onMouseOut ->
		wellRightChartContainer.onClick ->
		drawRightChart()
	)
	
	assetRight = new TextLayer
		parent: featureWellRight
		x: 20, y: 245
		text: "WELL 8A"
		fontSize: 18
		fontFamily: "GE Inspira Sans"
		color: "white"
		
	assetLRightOF = new TextLayer
		parent: featureWellRight
		x: 20, y: 270
		text: "Operating Frequency:"
		fontSize: 12
		fontFamily: "GE Inspira Sans"
		color: "white"
		
	frequencyCount2 = new Layer
		width: 85, height: 25, x: 132, y: 264
		color: "white"
		backgroundColor: null
		parent: featureWellRight
		clip: true
	frequencyCount2.html = '<div id="frequencyCount2" style="font-size:12px"></div>'
	canvasElement = frequencyCount2.querySelector("#frequencyCount2")
	number = new CountUp("frequencyCount2", 0, Utils.randomNumber(10, 50), 1, 4, options)
	number.start()
	
	# RUN ANALYSIS BTN
	runAnalysisBtn = new Layer
		parent: featureWellRight
		width: 100, height: 35
		x: 350, y: 250
		backgroundColor: blue03
		borderColor: blue01
		borderWidth: 1
		html: "Run Analysis"
	runAnalysisBtn.style =
		fontSize: "14px"
		fontFamily: "GE Inspira Sans"
		padding: "3px 0 0 12px"
		
	runAnalysisBtn.on Events.MouseOver, (event, layer) ->
		document.body.style.cursor = "pointer"
		this.backgroundColor = blue04
		
	runAnalysisBtn.on Events.MouseOut, (event, layer) ->
		document.body.style.cursor = "auto"
		this.backgroundColor = blue03
		
	overflowIcon = new Layer
		parent: featureWellRight
		width: 14, height: 13
		x: 465, y: 255
		backgroundColor: null
	overflowIcon.html = """
	<svg width="4px" height="20px" viewBox="0 0 4 20">
	    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
	        <g id="search-results-dark" transform="translate(-725.000000, -480.000000)" fill="#FFFFFF">
	            <g id="search-results" transform="translate(255.000000, 100.000000)">
	                <g id="featured-results" transform="translate(5.000000, 88.000000)">
	                    <g id="featured" transform="translate(0.000000, 32.000000)">
	                        <g id="esp" transform="translate(15.000000, 25.000000)">
	                            <g id="overflow-copy-2" transform="translate(450.000000, 235.000000)">
	                                <path d="M2,12 C3.1045695,12 4,11.1045695 4,10 C4,8.8954305 3.1045695,8 2,8 C0.8954305,8 0,8.8954305 0,10 C0,11.1045695 0.8954305,12 2,12 Z M2,4 C3.1045695,4 4,3.1045695 4,2 C4,0.8954305 3.1045695,0 2,0 C0.8954305,0 0,0.8954305 0,2 C0,3.1045695 0.8954305,4 2,4 Z M2,20 C3.1045695,20 4,19.1045695 4,18 C4,16.8954305 3.1045695,16 2,16 C0.8954305,16 0,16.8954305 0,18 C0,19.1045695 0.8954305,20 2,20 Z" id="overflow-icon"></path>
	                            </g>
	                        </g>
	                    </g>
	                </g>
	            </g>
	        </g>
	    </g>
	</svg>
	"""
	
#------------------------------#	
#          DATA TABLE          #
#------------------------------#
resultsLabel = new TextLayer
	parent: searchResultsScroll.content
	x: 20, y: headerBar.height + featureWellLeft.height
	text: "ALL RESULTS"
	fontSize: 12
	fontFamily: "GE Inspira Sans"
	color: "white"
	opacity: 0
	
resultsTableContainer = new Layer
	parent: searchResultsScroll.content
	width: resultsTableWidth, height: resultsTableHeight
	x: 20, y: headerBar.height + featureWellLeft.height + 30
	backgroundColor: blue01
	
searchRows = []
			
searchstaggeredTable = ->
	for row, i in searchResultsData
		tableData[i] = new Layer
			width: resultsTableWidth, height: 60
			y: 20 + (62 * i + 1)
			backgroundColor: blue02
			parent: resultsTableContainer
			shadowColor: blue01
			shadowY: 1
			opacity: 0
			animationOptions:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
		
		tableData[i].assetName = row.assetName
		tableData[i].tags = row.tags
		
		searchRows.push(tableData[i])
	# 	print searchRows.length
		
		assetNameEntry = new TextLayer
			parent: tableData[i]
			x: 15, y: 10
			text: row.assetName
			fontSize: 18
			fontFamily: "GE Inspira Sans"
			color: "white"
			
		assetTags = new Layer
			parent: tableData[i]
			width: 400
			x: 15, y: 35
			backgroundColor: null
			html: '<div style="font-size:12px; font-family:GE Inspira Sans; padding: 0 0; line-height: 1.3; color:white;">Tags: <span style="color:#45ACCC;">' + row.tags + '</span></div>'
			
		# RUN ANALYSIS BTN
		runAnalysisBtn = new Layer
			parent: tableData[i]
			width: 100, height: 35
			x: resultsTableContainer.width - 140, y: 14
			backgroundColor: blue03
			html: "Run Analysis"
			borderColor: blue01
			borderWidth: 1
		runAnalysisBtn.style =
			fontSize: "14px"
			fontFamily: "GE Inspira Sans"
			padding: "3px 0 0 12px"
		
		runAnalysisBtn.on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = blue04
			
		runAnalysisBtn.on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue03
			
		overflowIcon = new Layer
			parent: tableData[i]
			width: 14, height: 13
			x: resultsTableContainer.width - 25, y: 18
			backgroundColor: null
		overflowIcon.html = """
		<svg width="4px" height="20px" viewBox="0 0 4 20">
		    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
		        <g id="search-results-dark" transform="translate(-725.000000, -480.000000)" fill="#FFFFFF">
		            <g id="search-results" transform="translate(255.000000, 100.000000)">
		                <g id="featured-results" transform="translate(5.000000, 88.000000)">
		                    <g id="featured" transform="translate(0.000000, 32.000000)">
		                        <g id="esp" transform="translate(15.000000, 25.000000)">
		                            <g id="overflow-copy-2" transform="translate(450.000000, 235.000000)">
		                                <path d="M2,12 C3.1045695,12 4,11.1045695 4,10 C4,8.8954305 3.1045695,8 2,8 C0.8954305,8 0,8.8954305 0,10 C0,11.1045695 0.8954305,12 2,12 Z M2,4 C3.1045695,4 4,3.1045695 4,2 C4,0.8954305 3.1045695,0 2,0 C0.8954305,0 0,0.8954305 0,2 C0,3.1045695 0.8954305,4 2,4 Z M2,20 C3.1045695,20 4,19.1045695 4,18 C4,16.8954305 3.1045695,16 2,16 C0.8954305,16 0,16.8954305 0,18 C0,19.1045695 0.8954305,20 2,20 Z" id="overflow-icon"></path>
		                            </g>
		                        </g>
		                    </g>
		                </g>
		            </g>
		        </g>
		    </g>
		</svg>
		"""
		
		#-------------------------------------#	
		#          ROW HOVER ACTIONS          #
		#-------------------------------------#
		tableData[i].on Events.MouseOver, (event, layer) ->
			document.body.style.cursor = "pointer"
			this.backgroundColor = blue03
			
		tableData[i].on Events.MouseOut, (event, layer) ->
			document.body.style.cursor = "auto"
			this.backgroundColor = blue02

#----------------------------------------#	
#          SEARCH FUNCTIONALITY          #
#----------------------------------------#
# Array to store matched results
results = []
	
searchField.ignoreEvents = false

searchField.states =
	default:{
		width: 0
	}
	elongateSearch:{
		width: 350
	}

searchField.on Events.TouchEnd, ->
	this.animate("elongateSearch")
	type_wrapper.visible = true
	
stringResult = new Layer
	x: 260, y: headerBar.height + 25
	width: 800, height: 30
	backgroundColor: null
	html: ''
stringResult.style =
	color: "white"
	fontSize: 18
	
# TYPEAHEAD WRAPPER
type_wrapper = new Layer
	width: 690, height: 30
	x: headerBar.width/3.3, y: headerBar.height, z: 100
	opacity: 0
	backgroundColor: "white"

# This creates a text input and adds some styling in plain js
inputElement = document.createElement("textarea")
inputElement.parent = searchField

inputElement.style["width"]  = "350px"
inputElement.style["height"] = "25px"
inputElement.style["font"] = "15px/1.35em GE Inspira" #48px
inputElement.style["font-weight"] = "300"
inputElement.style["color"] = "#E1E1E1"
inputElement.style["padding-left"] = "5px"
inputElement.style["padding-top"] = "10px"
inputElement.style["background-color"] = "transparent"
inputElement.style["resize"] = "none"
inputElement.style["outline"] = "none"

# Set the value, focus and listen for changes
inputElement.placeholder = "Search"
inputElement.value = ""
inputElement.focus()
inputElement.onkeyup = (e) ->	
	#expand search box	
	searchField.animate("elongateSearch")
	inputElement.style["width"]  = "350px"
	# Clear Everything
	matchedStrings = []
	matched = false
	
	# Garbage collect old layers
	_.invoke(type_wrapper.subLayers, "destroy")
	
	# Set values and Regex query
	val = inputElement.value.toLowerCase()
	reg = new RegExp(val, 'i');
	
	# Iterate through search_data and store names in matchedStrings array
	for i in [0..search_data.length - 1] 
		if search_data[i].match reg 
			matched = true
			matchedStrings.push(search_data[i])
	
	# If names match display the typeahead otherwise hide it
	if val != ""
		for layer in results
			layer.destroy()
		if matched is true		
			type_wrapper.animate
				properties:
					opacity: 1
				curve: animateIn
			
			for j in [0..matchedStrings.length - 1]
				result = new TextLayer
					text: matchedStrings[j]
					parent: type_wrapper
					width: 650, height: 30,
					x: 20, y: j * 31 + 10
					backgroundColor: "white"
					fontSize: 16
					color: "#09819C"
					padding: 5
				
				results.push result
				
				result.on Events.MouseOver, (event, layer) ->
					document.body.style.cursor = "pointer"
					this.backgroundColor = blue03
				
				result.on Events.MouseOut, (event, layer) ->
					document.body.style.cursor = "auto"
					this.backgroundColor = "white"
				
				# here is what happens after selecting an autofill search
				result.on Events.TouchEnd, (event, layer) ->
					clearDashboard()
					clearKPIs()
					clearTimeseries()
					clearMap()
					clearTopWells()
					clearTable()
					Utils.delay 0.2, ->
						scrollBar.visible = true
						type_wrapper.visible = false
						stringResult.html = ''
						stringResult.html = '<span class="blueQuote">&ldquo;</span>' + layer.text + '<span class="blueQuote">&rdquo;</span>'
						inputElement.value = layer.text
						relevance.opacity = 1
						closeIconFeature.opacity = 1
						resultsLabel.opacity = 1
						Utils.delay 0.1, ->
							searchResultsScroll.visible = true
							facetedPanelBuild()
							facetContainer.animate
								opacity: 1
								options:
									curve: Bezier.easeInOut
									time: 0.02
						Utils.delay 0.1, ->
							featureWellLeftBuild()
							featureWellLeft.animate
								y: 30
								opacity: 1
								options:
									curve: Bezier.easeInOut
									time: 0.05
						Utils.delay 0.2, ->
							featureWellRightBuild()
							featureWellRight.animate
								y: 30
								opacity: 1
								options:
									curve: Bezier.easeInOut
									time: 0.05
						Utils.delay 0.2, ->
							searchstaggeredTable()
							# TABLE STACKING
							for j in [0..4]
								searchRows[j].animate
									opacity: 1
									y: 0 + (62 * j + 1)
									options:
										delay: 0.02 * j
									animationOptions:
										curve: Bezier(0.3, 0, 0.3, 1)
										time: 0.02
										
							Utils.delay 0.1, ->
								for k in [5..15]
									searchRows[k].animate
										opacity: 1
										y: 0 + (62 * k + 1)
										options:
											delay: 0.05
										animationOptions:
											curve: Bezier(0.3, 0, 0.3, 1)
											time: 0.02
					
				closeBtn.onClick ->
					inputElement.value = ''

			type_wrapper.height = 20 + matchedStrings.length * 31
			
		if matched is false
		
			type_wrapper.animate
				properties:
					opacity: 0
				curve: animateIn
		
			Utils.delay 0.4, ->
				type_wrapper.height = 70
				
	else
		for layer in results
			layer.destroy()
		type_wrapper.animate
			properties:
				opacity: 0
			curve: animateIn
		Utils.delay 0.4, ->
			type_wrapper.height = 70

# Add textInputLayer to the Screen
searchField._element.appendChild(inputElement)
# APP DRAWER
appDrawerContainer = new Layer
	width: 240, height: 890
	y: headerBar.height, x: -240
	backgroundColor: blue04
	shadowX: 2
	shadowBlur: 2
	shadowColor: 'rgba(0, 0, 0, 0.5)'
	
dashboardsLabel = new TextLayer
	parent: appDrawerContainer
	x: 15, y: 15
	text: "Dashboards"
	fontFamily: "GE Inspira Sans"
	fontSize: 15
	color: "white"
	
appsLabel = new TextLayer
	parent: appDrawerContainer
	x: 120, y: 15
	text: "Apps"
	fontFamily: "GE Inspira Sans"
	fontSize: 15
	color: "white"
	
assetsLabel = new TextLayer
	parent: appDrawerContainer
	x: 180, y: 15
	text: "Assets"
	fontFamily: "GE Inspira Sans"
	fontSize: 15
	color: "white"
	
selector = new Layer
	parent: appDrawerContainer
	height: 3, width: dashboardsLabel.width
	x: 15, y: 35
	backgroundColor: blue05
	
appDrawerDashboards = new Layer
	parent: appDrawerContainer
	width: 193, height: 72, x: Align.center, y: 60
	image: "images/appDrawer-dashboards.svg"
	
appDrawerApps = new Layer
	parent: appDrawerContainer
	width: 192, height: 148, x: Align.center, y: 60
	image: "images/appDrawer-apps.svg"
	opacity: 0

appDrawerContainer.states =
	stateA:
		x: 0
		animationOptions:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.2
	stateB:
		x: -240
		animationOptions:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.15
			
appDrawerContainer.animate ("stateB")

# OPEN AND CLOSE APP DRAWER
appsIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
appsIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
appsIcon.on Events.Click, ->
	appDrawerContainer.stateCycle "stateA", "stateB"

# DASHBOARDS TAB
dashboardsLabel.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
dashboardsLabel.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
dashboardsLabel.on Events.Click, ->
	selector.animate
		x: this.x
		width: this.width
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	Utils.delay 0.1, ->
		appDrawerDashboards.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
	appDrawerApps.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
			
# APPS TAB
appsLabel.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
appsLabel.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
appsLabel.on Events.Click, ->
	selector.animate
		x: this.x
		width: this.width
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	appDrawerDashboards.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	Utils.delay 0.1, ->
		appDrawerApps.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
			
# ASSETS TAB
assetsLabel.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
assetsLabel.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
assetsLabel.on Events.Click, ->
	selector.animate
		x: this.x
		width: this.width
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	appDrawerDashboards.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
	appDrawerApps.animate
			opacity: 0
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
#              FUNCTION CALLS              #
clearKPIs = ->
	kpisContainer.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	Utils.delay 0.1, ->
		kpisContainer.visible = false
	
clearTimeseries = ->
	timeseriesContainer.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	Utils.delay 0.1, ->
		timeseriesContainer.visible = false
	
clearTopWells = ->
	topWellsContainer.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	Utils.delay 0.1, ->
		topWellsContainer.visible = false
	
clearMap = ->
	mapOverlay.visible = false
	expandMapIcon.visible = false
	wellCounter.visible = false
	productionHeader.visible = false
	regionHeader.visible = false
	mapControls.visible = false
	mapIcon.visible = false
	tableIcon.visible = false
	mapContainer.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.05
	Utils.delay 0.1, ->
		mapContainer.visible = false
	
clearTable = ->
	expandTableIcon.visible = false
	expandTableIcon.x = 815
	tableContainer.animate
		opacity: 0
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.05
	Utils.delay 0.1, ->
		tableContainer.visible = false
	
buildKPIs = ->
	kpisContainer.visible = true
	Utils.delay 0.1, ->
		kpisContainer.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
	
buildMap = ->
	mapContainer.visible = true
	mapContainer.opacity = 1
	expandMapIcon.visible = true
	mapOverlay.visible = true
	productionHeader.visible = true
	regionHeader.visible = true
	mapControls.visible = true
	mapIcon.visible = true
	tableIcon.visible = true
	expandMapIcon.visible = true
	wellCounter.visible = true
	Utils.delay 0.1, ->
		mapBuild()
				
buildTimeseries = ->
	timeseriesContainer.visible = true
	Utils.delay 0.1, ->
		timeseriesContainer.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
				
buildTopWells = ->
	topWellsContainer.visible = true
	Utils.delay 0.1, ->
		topWellsContainer.animate
			opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
	
smallTable = ->
	expandTableIcon.visible = true
	tableContainer.visible = true
	tableContainer.width = dashboardWidth/3 * 1.95
	tableContainer.height = tableHeight - 40
	tableContainer.y = headerBar.height + kpisContainer.height + timeseriesContainer.height + 60
	productionHeader.visible = true
	regionHeader.visible = true
	mapControls.visible = true
	mapIcon.visible = true
	tableIcon.visible = true
	tableContainer.animate
		opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.05
			
expandTable = ->
	backToDashboardBtn.visible = true
	expandTableIcon.x = tableWidth - 20
	tableContainer.visible = true
	tableContainer.y = headerBar.height + backToDashboardBtn.height - 5
	tableContainer.width = tableWidth
	tableContainer.height = tableFullHeight
	tableContainer.animate
		opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.05
		
buildDashboard = ->
	buildKPIs()
	buildTimeseries()
	buildTopWells()
	buildMap()
	
staggeredTable = ->
# 	Utils.delay 0.05, ->
	for j in [0..3]
		rows[j].animate
			opacity: 1
			y: 0 + (43 * j)
			options:
				delay: 0.02 * j
			animationOptions:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.02
			
# 	Utils.delay 0.05, ->
	for k in [4..rowCount]
		rows[k].animate
			opacity: 1
			y: 0 + (43 * k)
			options:
				delay: 0.05
			animationOptions:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.02
					
clearAnalysis = ->
	analysisContainer.visible = false
	analysisContainer.opacity = 0
	aFrequency.visible = false
	aFrequency.opacity = 0
	bFrequency.visible = false
	bFrequency.opacity = 0
	vspCurveContainer.visible = false
	vspCurveContainer.opacity = 0
	gradientCurveContainer.visible = false
	gradientCurveContainer.opacity = 0
	iprCurveContainer.visible = false
	iprCurveContainer.opacity = 0
	surfaceFlowrateSlider.visible = false
	surfaceFlowrateSlider.opacity = 0
	motorTempSlider.visible = false
	motorTempSlider.opacity = 0
	wellheadPressureSlider.visible = false
	wellheadPressureSlider.opacity = 0
	bottomholePressureSlider.visible = false
	bottomholePressureSlider.opacity = 0
	frequencySlider.visible = false
	frequencySlider.opacity = 0
	intakePressureSlider.visible = false
	intakePressureSlider.opacity = 0
					
buildAnalysis = ->
	analysisContainer.visible = true
	analysisContainer.animate
		visible: true, opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 0.1
	aFrequency.animate
		visible: true, opacity: 1
		options:
			curve: Bezier(0.3, 0, 0.3, 1)
			time: 1
	Utils.delay 0.1, ->
		bFrequency.animate
			visible: true, opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
	Utils.delay 0.1, ->
		vspCurveContainer.animate
			visible: true, opacity: 1
			options:
				curve: Bezier(0.3, 0, 0.3, 1)
				time: 0.1
		Utils.delay 0.1, ->
			gradientCurveContainer.animate
				visible: true, opacity: 1
				options:
					curve: Bezier(0.3, 0, 0.3, 1)
					time: 0.1
			Utils.delay 0.1, ->
				iprCurveContainer.animate
					visible: true, opacity: 1
					options:
						curve: Bezier(0.3, 0, 0.3, 1)
						time: 0.1
				drawSplineCurves()
				Utils.delay 0.2, ->
					surfaceFlowrateSlider.animate
						visible: true, opacity: 1
						options:
							curve: Bezier(0.3, 0, 0.3, 1)
							time: 0.1
						Utils.delay 0.1, ->
							motorTempSlider.animate
								visible: true, opacity: 1
								options:
									curve: Bezier(0.3, 0, 0.3, 1)
									time: 0.1
							Utils.delay 0.1, ->
								wellheadPressureSlider.animate
									visible: true, opacity: 1
									options:
										curve: Bezier(0.3, 0, 0.3, 1)
										time: 0.1
								Utils.delay 0.1, ->
									bottomholePressureSlider.animate
										visible: true, opacity: 1
										options:
											curve: Bezier(0.3, 0, 0.3, 1)
											time: 0.1
									Utils.delay 0.1, ->
										frequencySlider.animate
											visible: true, opacity: 1
											options:
												curve: Bezier(0.3, 0, 0.3, 1)
												time: 0.1
										Utils.delay 0.1, ->
											intakePressureSlider.animate
												visible: true, opacity: 1
												options:
													curve: Bezier(0.3, 0, 0.3, 1)
													time: 0.1
											analysisSave.animate
												visible: true, opacity: 1
												options:
													curve: Bezier(0.3, 0, 0.3, 1)
													time: 0.1

# CLICK CALLS	
tableIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
tableIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
tableIcon.on Events.TouchEnd, ->
	clearMap()
	Utils.delay 0.1, ->
		staggeredTable()
		smallTable()
		
mapIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
mapIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
mapIcon.on Events.TouchEnd, ->
	clearTable()
	Utils.delay 0.15, ->
		buildMap()
			
expandTableIcon.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"

expandTableIcon.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
	
expandTableIcon.on Events.TouchEnd, ->
	clearKPIs()
	clearTimeseries()
	clearTopWells()
	clearMap()
	backArrow.visible = true
	backBtnTitle.visible = true
	backBtnSubtitle.visible = true
	Utils.delay 0.1, ->
# 		backArrow.visible = true
# 		backBtnTitle.visible = true
# 		backBtnSubtitle.visible = true
		expandTable()

backToDashboardBtn.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
backToDashboardBtn.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
		
backToDashboardBtn.on Events.TouchEnd, ->
	backArrow.visible = false
	backBtnTitle.visible = false
	backBtnSubtitle.visible = false
	clearTable()
	Utils.delay 0.15, ->
		buildDashboard()
		backToDashboardBtn.visible = false
		
backToTableBtn.on Events.MouseOver, ->
	document.body.style.cursor = "pointer"
	
backToTableBtn.on Events.MouseOut, ->
	document.body.style.cursor = "auto"
		
backToTableBtn.on Events.TouchEnd, ->
	clearAnalysis()
	Utils.delay 0.1, ->
		expandTable()
		this.visible = false
		backToDashboardBtn.visible = true
# clearMap()
# clearTimeseries()
# clearKPIs()
# clearTopWells()
# clearTable()
# buildAnalysis()
# staggeredTable()
# expandTable()
# smallTable()