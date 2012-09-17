<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>
<div class="questionSetSectionHeader grid_71 prefix_1">
		<span class="questionSetSectionHeaderTitle prefix1" ><p style="vertical-align: middle;"><@spring.message "questionset_limits_of_liability"/></p></span>
</div>
<@row.container "limitsofliability">
	<div class="callscript prefix_1 grid_10 suffix_1">&nbsp;</div>
	<div class="prefix_1 grid_43">
		<div class="grid_42" align="left">
		
			<div>
				<span class="grid_3">&nbsp;</span>
				<span class="grid_16 gridheaders"></span>
				<span class="grid_12 gridheaders"><@spring.message "questionset_limits_of_liability_standard_limit"/></span>
				<span class="grid_7 gridheaders"><@spring.message "questionset_limits_of_liability_required_limit"/></span>
			</div>
			<div class="grid_42">
				<span class="grid_14 gridheaders"><oneAndHalf-lineHeight><@spring.message "questionset_limits_of_liability_own_damage"/></oneAndHalf-lineHeight></span>
			</div>
			 <div>
				<span class="grid_18 margin_1"><@spring.message "questionset_limits_of_liability_per_insured_vehicle"/></span>
				<span class="grid_4 rightAlighnmentOfText"><@spring.message "questionset_limits_of_liability_per_policy"/></span>
			</div>
			<div class="grid_42">
				<span class="grid_14 gridheaders"><oneAndHalf-lineHeight><@spring.message "questionset_limits_of_liability_third_party_liability"/></oneAndHalf-lineHeight></span>
			</div> 
			<div>
				<span class="grid_18 margin_1 inputsize"><@spring.message "questionset_limits_of_liability_property_damage_and_personal_injury"/></span>
				<span class="grid_4 rightAlighnmentOfText inputsize"><@spring.message "questionset_limits_of_liability_property_damage_and_personal_injury_standard_limit"/></span>
				<span class="grid_8">&nbsp;</span>
				<span class="grid_6"><@ui.input "LimitsOfLiability.ThirdPartyPropertyDamagePersonalInjury" ui.nullSafe("questionSet.limitsOfLiability.thirdPartyPropertyDamagePersonalInjury") "grid_5 rightAlighnmentOfText" "" "number" readOnly "grid_5 rightAlighnmentOfText inputsize"/> 
				</span>
			</div>
			
			<div class="grid_42">
				<span class="grid_14 gridheaders"><oneAndHalf-lineHeight><@spring.message "questionset_limits_of_liability_extension_additional_vehicles"/></oneAndHalf-lineHeight></span>
			</div> 
			<div>
				<span class="grid_18 margin_1 inputsize"><@spring.message "questionset_limits_of_liability_additional_vehicle"/></span>
				<span class="grid_4 rightAlighnmentOfText inputsize"><@spring.message "questionset_limits_of_liability_additional_vehicle_standard_limit"/></span>
				<span class="grid_8">&nbsp;</span>
				<span class="grid_6"><@ui.input "LimitsOfLiability.AdditionalVehiclesAdditionalVehicle" ui.nullSafe("questionSet.limitsOfLiability.additionalVehiclesAdditionalVehicle") "grid_5 rightAlighnmentOfText" "" "number" readOnly "grid_5 rightAlighnmentOfText inputsize"/></span>
			</div>
			<div>
				<span class="grid_18 margin_1 inputsize"><@spring.message "questionset_limits_of_liability_non_owned_trailer"/></span>
				<span class="grid_4 rightAlighnmentOfText inputsize"><@spring.message "questionset_limits_of_liability_non_owned_trailer_standard_limit"/></span>
				<span class="grid_8">&nbsp;</span>
				<span class="grid_6"><@ui.input "LimitsOfLiability.AdditionalVehiclesNonOwnedTrailer" ui.nullSafe("questionSet.limitsOfLiability.additionalVehiclesNonOwnedTrailer") "grid_5 rightAlighnmentOfText" "" "number" readOnly "grid_5 rightAlighnmentOfText inputsize"/></span>
			</div>
			<div>
				<span class="grid_19 gridheaders inputsize"><@spring.message "questionset_limits_of_liability_employees_motor_vehicles"/></span>
				<span class="grid_4 rightAlighnmentOfText inputsize"><@spring.message "questionset_limits_of_liability_employees_motor_vehicles_standard_limit"/></span>
				<span class="grid_8">&nbsp;</span>
				<span class="grid_6"><@ui.input "LimitsOfLiability.EmployeesVehicles" ui.nullSafe("questionSet.limitsOfLiability.employeesVehicles") "grid_5 rightAlighnmentOfText"  "" "number" readOnly "grid_5 rightAlighnmentOfText inputsize"/></span>
			</div>
		</div>
	</div>
	
	<@row.right>
		<span class="grid_15">Any Required Limit amount different to the Standard Limit below will need to be negotiated with the Insurers and there is no guarantee that it will be accepted.</span>
		<span class="grid_15">Also, an increase in Required Limit may result in higher premium.</span>
	</@row.right>
</@row.container>
