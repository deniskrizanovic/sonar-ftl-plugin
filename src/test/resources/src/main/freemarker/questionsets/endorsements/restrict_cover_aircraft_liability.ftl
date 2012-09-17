<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_aircraft_liability endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
			<@ui.checkbox "aircraftliability" "Endorsements.Endorsement.AircraftLiability" 
			"${questionSet.endorsements.endorsement.aircraftLiability?string}" "" readOnly/>
			<label class="inline-label" for="aircraftliability"><@spring.message "questionset_endorsement_aircraft_liability"/></label>
	</div>

	<@row.right ""/>
</@row.container>
