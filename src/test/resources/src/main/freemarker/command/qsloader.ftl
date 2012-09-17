<#import "../macros/form.ftl" as ui>
<html>
<head>
<#assign base_url><@spring.url "/"/></#assign>
<#assign jsresources =['tiny_mce.js', 'jquery-1.7.1.min.js', 'json2.js', 'formjson-harvester.js', 'question-set.js', 'question-set-util.js', 'jquery-ui-1.8.min.js']/>
<#assign screenCssResources =['jquery-ui-1.8.css', '960.css', 'heavymotor.css', 'font-awesome.css']/>
<#assign printCssResources =['jquery-ui-1.8.css', '960.css', 'heavymotor-print.css', 'font-awesome.css']/>

<@ui.loadcss "${base_url}styles" printCssResources "print"/>
<@ui.loadcss "${base_url}styles" screenCssResources "screen" />
<@ui.loadjs "${base_url}javascript" jsresources/>

<script type="text/javascript">
	$(document).ready(function(){
		qsCollector.init('${base_url}');
	});
</script>
	
<script type="text/javascript">
$(document).ready(function(){
	$("#loadqs").bind('click', function() {
	    var placementId = $("#placementId").val();
		qsCollector.load('questionset/'+placementId+'/quoteslip', 'questionSet');
	});
	$("#getqs").bind('click', function() {
		$('#json').html(qsCollector.collect());
	});
	$("#validate").bind('click', function() {
		qsCollector.validate();
	});
	
});

</script>
</head>
<body>

<#list 1..17 as i>
	<a href="#" onclick="loadQs('${i}');">${i}</a>&nbsp;
</#list>
<div>
	<form name="loader">
		<input type="text" id="placementId" value="1"/>
		<input type="text" class="datepicker"/>
		<button type="button" id="loadqs">Load</button>
		<button type="button" id="getqs">Get JSON</button>
		<button type="button" id="validate">Validate</button>
	</form>
</div>
<div id="json" style="background:#fff;"><!--json data holder-->
</div>
<div id="questionSet"><!--question set holder--></div>
</body>
</html>