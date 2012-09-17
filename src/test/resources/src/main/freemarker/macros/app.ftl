<#import "spring.ftl" as spring>
<#import "form.ftl" as ui>

<#macro amountField label="" name="" path="" labelclasses="" labelstyle="" classes="grid_8" readonlyclasses="" attr="data-type='number' required='true' size-min='1' size-max='999999999'"
	fieldtype="number" readOnly=false>

	<span class="${labelclasses}" style="${labelstyle}"><@spring.message "${label}"/></span>
	<span class="grid_1 inputsize">$</span> 
	<@ui.input name ui.nullSafe(path) classes attr fieldtype readOnly readonlyclasses/>
	<span class="error errorMessage" rel="${name}"/>
</#macro>

<#macro numberField label="" name="" path="" labelclasses="" labelstyle="" classes="grid_8" readonlyclasses="" attr="data-type='number' required='true' size-min='1' size-max='999999999'"
	fieldtype="number"
	readOnly=false>
	
	<span class="${labelclasses}" style="${labelstyle}"><@spring.message "${label}"/></span>
	<@ui.input name ui.nullSafe(path) classes attr fieldtype readOnly readonlyclasses/>
	<span class="error errorMessage" rel="${name}"/>
</#macro>

<#macro textField label="" name="" path="" classes="grid_18" attr="data-type='string' required='true'" fieldtype="text"
readOnly=false>
<div class="grid_18">
<span class="grid_10 inputsize"><@spring.message "${label}"/></span>
</div>
<div class="grid_18">
<@ui.input name ui.nullSafe(path) classes attr fieldtype readOnly "grid_15 inputsize"/>
<span class="error errorMessage" rel="${name}"/>
</div>
</#macro>
