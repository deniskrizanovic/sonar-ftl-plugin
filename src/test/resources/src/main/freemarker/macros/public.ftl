<#import "/spring.ftl" as spring />
<#macro public>
<!doctype html>
<html>  
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />	
		<@layout.loadscripts/>
		<#assign app_name><@spring.message "application_name"/></#assign>
		<title>${app_name}></title>
	</head>
	
  	<body style="-webkit-text-size-adjust: none;" class="tundra">
  		<div id="outer">
		    <@layout.title/>
  			<div id="inner">
			    <@layout.publicheader/>
				<div id="content">
					<#nested>
				</div>
				<@layout.footer/>
			</div>
		</div>
	</body>
</html>
</#macro>