<#import "/spring.ftl" as spring/>
<#macro select name items>
  <select name="${name}">
  <#if items?is_collection>
	  <#list items as value>
	    <option value="${value?html}">${value?html}</option>
	  </#list>
  <#elseif items?is_hash_ex> 
    <#list items.entrySet() as entry>
	    <option value="${entry.key}">${entry.value}</option>
    </#list>
  </#if>
  </select>
</#macro>

<#macro selectBox name items label helpText="">
		<div class="control-group">
	      <label class="control-label" for="product"><@spring.message label/></label>
	      <div class="controls">
			<@select name items/>
	        <p class="help-block">${helpText}</p>
	      </div>
	    </div>
</#macro>

<#macro textBox name label attributes="" helpText="" type="text" class="">
		<div class="control-group">
	      <label class="control-label" for="product"><@spring.message label/></label>
	      <div class="controls">
			<input type="${type}" name="${name}" class="${class}" ${attributes} /> 
	        <p class="help-block">${helpText}</p>
	      </div>
	    </div>
</#macro>

<#macro formSelect path items label attributes="" helpText="">
	<@spring.bind path/>
	<div class="control-group">
      <label class="control-label" for="product"><@spring.message label/></label>
      <div class="controls">
		<select id="${spring.status.expression}" name="${spring.status.expression}" ${attributes}>
		  <#if items?is_collection>
			  <#list items as value>
			    <option value="${value?html}" <@spring.checkSelected value/>>${value?html}</option>
			  </#list>
		  <#elseif items?is_hash_ex> 
		    <#list items.entrySet() as entry>
			    <option value="${entry.key}" <@spring.checkSelected entry.key/>>${entry.value}</option>
		    </#list>
		  </#if>
		</select>
		  <p class="help-block">${helpText}</p>
      </div>
    </div>
</#macro>

<#macro formInput path label attributes="" helpText="" type="text">
		<@spring.bind path/>
		<div class="control-group">
	      <label class="control-label" for="product"><@spring.message label/></label>
	      <div class="controls">
			<input type="text" id="${spring.status.expression}" name="${spring.status.expression}" value="${spring.stringStatusValue}" ${attributes}/>
	        <p class="help-block">${helpText}</p>
	      </div>
	    </div>
</#macro>

<#macro formInputPair pathA pathB label attributes="" helpText="" type="text">
	<div class="control-group">
      <label class="control-label" for="product"><@spring.message label/></label>
      <div class="controls">
		<@spring.bind pathA/>
		<input type="text" id="${spring.status.expression}" name="${spring.status.expression}" value="${spring.stringStatusValue}" ${attributes}/>
	    <@spring.bind pathB/>
		to <input type="text" id="${spring.status.expression}" name="${spring.status.expression}" value="${spring.stringStatusValue}" ${attributes}/>
      </div>
    </div>
</#macro>


<#macro submitButton code class="">
	<div class="form-actions">
	  <#assign submit_button><@spring.message code/></#assign>
	  <button class="btn btn-danger ${class}" type="submit"><i class="icon-ok icon-white"></i> ${submit_button}</button>
	</div>
</#macro>

<#macro searchButton code class="" resetSelector="">
	<div class="form-actions">
	  <#assign submit_button><@spring.message code/></#assign>
	  <button class="btn btn-danger ${class} searchButton" type="submit"><i class="icon-search icon-white"></i> ${submit_button}</button>
	  <button class="btn btn-danger reset ${class} clearButton" type="button"><i class="icon-repeat icon-white"></i> Clear</button>
	</div>
	<#if resetSelector??>
	<script type="text/javascript">
		$(document).ready(
			function() {
				$("button.reset").on('click', function() {
					new UiForm('${resetSelector}').clear();
				});
			}
		);
	</script>
	</#if>
</#macro>

<#macro showNote title="Note">
    <div class="alert alert-info">
        <h1>${title}</h1>
        <#nested/>
    </div>
</#macro>

<#macro showError title="Error">
    <div class="alert alert-error">
        <h1>${title}</h1>
        <div class="error"><#nested/></div>
    </div>
</#macro>

<#macro showWarning title="Warning">
    <div class="alert alert-warning">
        <h1>${title}</h1>
        <#nested/>
    </div>
</#macro>

<#macro modal id title actionId="" actionLabel="">
<div id="${id}" class="modal hide fade">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&#215;</button>
      <h3>${title}</h3>
    </div>
    <div class="modal-body">
      <#nested/>
    </div>
    <div class="modal-footer">
      <a href="#" class="btn" data-dismiss="modal">Close</a>
      <#if actionId?has_content>
      	<a id="${actionId}" href="#" class="btn btn-primary btn-danger">${actionLabel}</a>
     </#if>
    </div>
</div>
</#macro>
