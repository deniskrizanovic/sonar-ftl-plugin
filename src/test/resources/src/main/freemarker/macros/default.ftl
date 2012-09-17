<#import "/spring.ftl" as spring />
<#macro default>
<!doctype html>
<html>  
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />	
		<@layout.loadscripts/>
		<title>Vertex HeavyMotor</title>
	</head>
	
  	<body style="-webkit-text-size-adjust: none;" class="tundra">
  		<div id="outer">
		    <@layout.title/>
  			<div id="inner">
			    <@layout.header/>
				<div id="content">
					<#nested>
				</div>
				<@layout.footer/>
			</div>
		</div>
	</body>
</html>
</#macro>