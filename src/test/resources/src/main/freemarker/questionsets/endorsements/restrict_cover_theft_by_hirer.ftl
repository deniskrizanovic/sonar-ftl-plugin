<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_theft_by_hirer endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
			<@ui.checkbox "theftbyhirer" "Endorsements.Endorsement.TheftByHirer" 
			"${questionSet.endorsements.endorsement.theftByHirer?string}" "" readOnly/>
			<label class="inline-label" for="theftbyhirer"><@spring.message "questionset_endorsement_theft_by_hirer"/></label>
	</div>

	<@row.right ""/>
</@row.container>
