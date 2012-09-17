<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_dual_multi_lifts endorsement-container">
	<@row.left ""/>
	
	<span class="grid_43" style="height: 20px;">&#160;</span>

	<div class="prefix_13 grid_43">
			<@ui.checkbox "dualmultilifts" "Endorsements.Endorsement.DualMultiLifts" 
			"${questionSet.endorsements.endorsement.dualMultiLifts?string}" "" readOnly/>
			<label class="inline-label" for="dualmultilifts"><@spring.message "questionset_endorsement_dual_multi_lifts"/></label>
	</div>

	<@row.right ""/>
</@row.container>
