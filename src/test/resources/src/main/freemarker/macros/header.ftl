<#macro header>
<#assign banner><@spring.url "/resources/images/banner-graphic.png"/></#assign>
<#assign base><@spring.url "/"/></#assign>
<#assign home_label><@spring.message code="button_home"/></#assign>
<#assign logout_url><@spring.url "/resources/j_spring_security_logout"/></#assign>
<div>
	<div id="nav" class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<ul class="nav nav-pills">
					<li><a href="${base}"><i class="icon-search icon-white"></i>&nbsp;&nbsp;<@spring.message "label_search"/></a></li>
				</ul>
				<div class="nav-collapse">
					<ul class="nav nav-pills pull-right">
						<li><a href="${base}help"><i class="icon-question-sign icon-white"></i>&nbsp;&nbsp;<@spring.message "label_help"/></a></li>
						<li class="dropdown">
						    <a href="#"
					            class="dropdown-toggle"
					            alternateUrl="${base}account"
					            data-toggle="dropdown">
								<i class="icon-user icon-white"></i>&nbsp;&nbsp;${requestUser}
						        <b class="caret"></b>
						    </a>
						    <ul class="dropdown-menu">
								<li><a href="${base}account"><i class="icon-user icon-black"></i>&nbsp;&nbsp;<@spring.message "label_myaccount"/></a></li>
								<li><a href="${logout_url}"><i class="icon-off icon-black"></i>&nbsp;&nbsp;<@spring.message "label_logout"/></a></li>
						    </ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</#macro>