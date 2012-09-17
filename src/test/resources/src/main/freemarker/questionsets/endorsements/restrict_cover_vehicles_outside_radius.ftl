<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_vehicles_outside_radius endorsement-container">
	<@row.left ""/>

		<div class="prefix_13 grid_43" style="height:20px;">
				<@ui.checkbox "restrictcovervehiclesoutsideradius" "Endorsements.Endorsement.VehiclesOutsideRadius.Applicable" 
				ui.nullSafe("questionSet.endorsements.endorsement.vehiclesOutsideRadius.applicable", "false") "" 
				readOnly />
		<label class="inline-label" for="restrictcovervehiclesoutsideradius">
			<@spring.message "questionset_endorsement_vehicles_outside_radius"/></label>
		</div>

		<div class="prefix_13 grid_65 vehicleoutsideradiusdependent">
	
			<div class="grid_43">
	
				<@app.numberField "questionset_endorsement_vehicles_permited_inside_radius" 
					"Endorsements.Endorsement.VehiclesOutsideRadius.PermittedRadius"
					"questionSet.endorsements.endorsement.vehiclesOutsideRadius.permittedRadius" 
					"prefix_3 grid_9 inputsize" "" "grid_4 vehicleoutsideradiusdependent" "readonlyinput inputsize"
					"data-type='number' required='true' size-min='1' size-max='999999999'"
					"number"
					readOnly />
				<span class="grid_15 inputsize" style="margin-left: 4px;"><@spring.message "questionset_endorsement_vehicles_kilometre_from_the_departure_depot"/></span>
			</div>
	
		</div>

		<span class="grid_43" style="height: 15px;">&#160;</span>
	<@row.right ""/>
</@row.container>
<script>
	var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#restrictcovervehiclesoutsideradius"), elToHide: $(".vehicleoutsideradiusdependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
</script>