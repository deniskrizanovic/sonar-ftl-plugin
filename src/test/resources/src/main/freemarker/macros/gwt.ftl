<#import "/spring.ftl" as spring />
<#macro gwt>
<!doctype html>
<html>  
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />	
		<@layout.gwtscripts/>
		<#assign app_name><@spring.message "application_name"/></#assign>
		<title>Vertex HeavyMotor</title>
	</head>
  	<body style="">
		<iframe src="javascript:''" id="__gwt_historyFrame" tabIndex='-1' style="position:absolute;width:0;height:0;border:0"></iframe>
		  <span id='loading' style="margin-left:10px;font-size:12px;padding:10px;font-family:Helvetica;background-color:#e5edf9;border:2px solid #96a2b5;">
	    	Loading...
	  	</span>
	  	<div id="notifications"><!--ff and opera--></div>
	</body>
</html>
</#macro>