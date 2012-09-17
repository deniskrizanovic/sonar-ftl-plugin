<#macro footer>
<div id="footer">
  <#assign home><@spring.url "/"/></#assign>
	<div id="nav" class="navbar">
		<div class="navbar-inner">
		</div>
	</div>  
	<#if rc.userPrincipal?? >
    <c:out value=" | "/>
    <span>
      <#assign logout><@spring.url "/resources/j_spring_security_logout"/></#assign>
      <a href="${logout}">
        <@spring.message code="security_logout"/>
      </a>
    </span>
  </#if>

</div>
</#macro>