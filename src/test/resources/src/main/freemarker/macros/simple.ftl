<#import "/spring.ftl" as spring />
<#macro simple>
<html>  
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />	
		<#assign app_name><@spring.message "application_name"/></#assign>
		<title>${app_name}</title>
	</head>
	
  	<body>
	    <#nested>
	</body>
</html>
</#macro>