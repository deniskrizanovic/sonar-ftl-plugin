<#import "form.ftl" as ui>
<#macro gwtscripts>

<#assign base_url><@spring.url "/"/></#assign>
<#assign styles>${base_url}styles</#assign>
<#assign javascript>${base_url}javascript</#assign>
  
<#assign jsResources =['tiny_mce.js', 
'jquery-1.7.1.min.js', 'json2.js', 
'formjson-harvester.js', 'question-set.js', 'question-set-util.js', 'jquery-ui-1.8.min.js']/>
  
<#assign allCssResources =['jquery-ui-1.8.css', 'font-awesome.css']/>
<#assign screenCssResources =['960.css', 'heavymotor.css']/>
<#assign printCssResources =['960-print.css', 'heavymotor-print.css']/>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">

<@ui.loadcss styles allCssResources "all"/>
<@ui.loadcss styles screenCssResources "screen"/>
<@ui.loadcss styles printCssResources "print"/>


<script type="text/javascript" src="${base_url}applicationScaffold/applicationScaffold.nocache.js"><!--ff and opera--></script>
<@ui.loadjs javascript jsResources/>

<script type="text/javascript">
$(document).ready(function () {
	qsCollector.init('${base_url}');
});
</script>
</#macro>
