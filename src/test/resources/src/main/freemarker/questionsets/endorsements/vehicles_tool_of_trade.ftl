<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<@row.container "vehiclestooloftrade endorsement-container">
	<@row.left ""/>
	<div class="prefix_13 grid_43">
			<@ui.checkbox "vehicletooloftrade" "Endorsements.Endorsement.VehicleToolOfTrade" 
				ui.nullSafe("questionSet.endorsements.endorsement.vehicleToolOfTrade?string") "" readOnly/>
			<label class="inline-label" for="vehicletooloftrade"><@spring.message "questionset_endorsement_vehicles_used_as_tool_trade"/></label>
	</div>

	<@row.right ""/>
</@row.container>


