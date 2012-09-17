<#import "/spring.ftl" as spring/>

<#macro selectBox name items label helpText="">
		<div class="control-group">
	      <label class="control-label" for="product"><@spring.message label/></label>
	      <div class="controls">
			<@select name items/>
	        <p class="help-block">${helpText}</p>
	      </div>
	    </div>
</#macro>

<#macro checkSelected statusValue value>
    <#if statusValue?is_number && statusValue == value?number>selected="selected"</#if>
    <#if statusValue?is_string && statusValue == value>selected="selected"</#if>
</#macro>

<#macro readOnlyAppender readOnly=false>
	<#if readOnly>
		disabled="${readOnly?string}"
	</#if>
</#macro>

<#macro dropdown name options statusValue readOnly=false>
  <select name="${name}" <@readOnlyAppender readOnly/> >
        <#if options?is_hash>
            <#list options?keys as value>
            <option value="${value?html}" <@checkSelected statusValue value/>>${options[value]?string}</option>
            </#list>
        <#else> 
            <#list options as value>
            <option value="${value?html}" <@checkSelected statusValue value/>>${value?html}</option>
            </#list>
        </#if>  
  
  </select>
</#macro>

<#macro input name value="" classes="" attributes="" type="text" readonly=false readonlyclasses="">
	<#if readonly>
		<span rel="qs-field" class="${readonlyclasses}">${value}</span>
	<#else>
		<input type="${type}" id="${name}" name="${name}" value="${value}" rel="qs-field" class="${classes}" ${attributes}/>
	</#if>
</#macro>

<#macro checkbox id name value="" attributes="" readonly=false classes="">
	<#assign selected></#assign>
	<#if value == "true">
		<#assign selected>checked=true</#assign>
	</#if>
	<input type="checkbox" id="${id}" name="${name}" 
	value="${value}" rel="qs-field" class="yesnocheckbox ${classes}" 
	${selected}
	${attributes} <@readOnlyAppender readonly/> />
</#macro>

<#macro typeof obj="">
	Hash  ${obj?is_hash?string}<br/>
	Hash Ex ${obj?is_hash_ex?string}<br/>
	Collection ${obj?is_collection?string}<br/>
	Enumerable ${obj?is_enumerable?string}<br/>
	Sequence ${obj?is_sequence?string}<br/>
</#macro>

<#function nullSafe path="" defaultValue="">
	<#attempt>
		<#return path?eval?string>
	<#recover>
		<#return defaultValue>
	</#attempt>
</#function>

<#macro loadcss styles cssResources media="screen">
	<#list cssResources as css>
	<link rel="stylesheet" type="text/css" href="${styles}/${css}" media="${media}"/>
	</#list>
</#macro>

<#macro loadjs javascript jsResources>
	<#list jsResources as js>
	<script type="text/javascript" src="${javascript}/${js}"><!--ff and opera like--></script>
	</#list>
</#macro>

<#macro button id="" key="" readonly=false classes="">
	<#if !readonly>
		<button type="button" id="${id}" class="${classes}"><@spring.message key/></button>
	</#if>
</#macro>