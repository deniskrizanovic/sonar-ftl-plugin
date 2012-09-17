<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_vehicle_on_rails_or_over_water endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
			<@ui.checkbox "vehiclerailsoverwater" "Endorsements.Endorsement.VehicleRailsOverWater" 
			"${questionSet.endorsements.endorsement.vehicleRailsOverWater?string}" "" readOnly />
			<label class="inline-label" for="vehiclerailsoverwater"><@spring.message "questionset_endorsement_vehicle_on_rails_or_over_water"/></label>
	</div>

	<@row.right ""/>
</@row.container>
