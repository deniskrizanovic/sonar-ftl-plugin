<#import "/spring.ftl" as spring/>
<#macro login_status>
<#if RequestParameters.login_error??>
  		<div class="alert alert-error">
        <p>
          <@spring.message "security_login_unsuccessful" />
          <b>
	          <#if SPRING_SECURITY_LAST_EXCEPTION??>
	          ${SPRING_SECURITY_LAST_EXCEPTION.message!"invalid login"}
	          <#else>
	          Invalid Login
	          </#if>
	      </b>
          .
        </p>
      </div>
<#else>
	<div class="alert">
		<@spring.message "security_login_message" />
	</div>
</#if>
</#macro>