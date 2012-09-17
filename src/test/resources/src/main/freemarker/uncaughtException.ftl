<@layout.public>
<div>
  <#assign title><@spring.message "error_uncaughtexception_title"/></#assign>
  <h1 class="title">${title}</h1>
  <p>
	<@spring.message "error_uncaughtexception_problemdescription" />
  </p>
  <a class="btn btn-danger" data-toggle="collapse" data-target="#stacktrace">Show/Hide Error Stacktrace</a>
  <#if exception??>
  <div id="stacktrace" class="collapse">
	<h5>Error Stacktrace</h5>
	  <#list exception.stackTrace as trace>
	    ${trace}
	    <br />
	  </#list>
  </div>
  </#if>
</div>
</@layout.public>