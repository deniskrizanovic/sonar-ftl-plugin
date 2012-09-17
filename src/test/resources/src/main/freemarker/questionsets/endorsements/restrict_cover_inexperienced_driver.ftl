<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_inexperienced_driver endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
			<@ui.checkbox "inexperienceddriver" "Endorsements.Endorsement.InexperiencedDriver" 
			"${questionSet.endorsements.endorsement.inexperiencedDriver?string}" "" readOnly />
			<label class="inline-label" for="inexperienceddriver"><@spring.message "questionset_endorsement_inexperienced_driver"/></label>
	</div>

	<@row.right ""/>
</@row.container>
