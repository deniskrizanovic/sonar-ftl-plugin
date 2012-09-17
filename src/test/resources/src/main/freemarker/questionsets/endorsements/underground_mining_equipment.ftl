<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<@row.container "undergroundminingequipment endorsement-container">
	<@row.left ""/>
	<div class="prefix_13 grid_43">
		<@ui.checkbox "undergroundmining" "Endorsements.Endorsement.UndergroundMining" 
			ui.nullSafe("questionSet.endorsements.endorsement.undergroundMining?string") "" readOnly/>
		<label class="inline-label" for="undergroundmining"><@spring.message "questionset_endorsement_undergroundmining_equipment"/></label>
	</div>
	<@row.right ""/>
	
</@row.container>


