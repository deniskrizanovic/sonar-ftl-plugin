<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>
<@row.container "vehiclesofinsurance">
	<@row.left "questionset_vehicle_to_be_insured"/>
	
	<div class="prefix_1 grid_43">
		<span class="grid_7 gridheaders"><@spring.message "questionset_number_of_vehicles"/></span> 
		<@ui.input "Coverage.NumberOfVehicles" ui.nullSafe("questionSet.coverage.numberOfVehicles") "grid_3" "data-type='number' required='true' size-min='1' size-max='999999999'" "number" readOnly "grid_15 inputsize"/>
		<span class="error errorMessage" rel="Coverage.NumberOfVehicles"/>
	</div>
	<@row.right "questionset_vehicle_assistive_text"/>
</@row.container>
