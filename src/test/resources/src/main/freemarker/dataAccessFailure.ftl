<@layout.public>
<div>
  <#assign title><@spring.message "error_dataaccessfailure_title"/></#assign>
  <h4 class="title">${title}</h4>
    <p>
      <@spring.message "error_dataaccessfailure_problemdescription" />
    </p>
    
    <#if exception??>
      <p>
        <h4 class="title">
          <@spring.message "exception_details" />
        </h4>
        <#assign message><spring:message "exception_message"/></#assign>
        <div>
        	<div>${message}</div>
        </div>
        <#assign stacktrace><@spring.message "exception_stacktrace" /></#assign>
        <div>
        <div>${stacktrace}</div>
          <#list exception.stackTrace as trace>
            ${trace}
            <br />
          </#list>
        </div>
      </p>
    </#if>
    
</div>
</@layout.public>
