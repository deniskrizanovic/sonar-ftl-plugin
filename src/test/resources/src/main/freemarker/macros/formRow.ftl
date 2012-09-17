<#import "/spring.ftl" as spring/>

<#macro display key="">
	<#if key != "">
		<@spring.message "${key}"/>
	<#else>
        <#nested/>
	</#if>
</#macro>

<#macro left key="" classes="callscript prefix_1 grid_10 suffix_1">
    <div class="${classes}">
    	<@display "${key}">
    	<#nested>
    	</@display>
    </div>
</#macro>


    	
<#macro right key="" classes="info prefix_1 grid_15">
    <div class="${classes}">
    	<@display "${key}"><#nested></@display>
	</div>
</#macro>

<#macro container classes="" hidden=false >
	<#assign sectionDisplay></#assign>
	<#if hidden>
		<#assign sectionDisplay>display:none;</#assign>
	</#if>	
<div class="formRow ${classes}" style="${sectionDisplay}">
<#nested>
</div>
</#macro>
