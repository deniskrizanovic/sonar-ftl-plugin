<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "agreed_value_indemnity endorsement-container">
	<@row.left ""/>

	<div class="grid_65" style="height:20px;">
		<div class="prefix_13 grid_43">
			<@ui.checkbox "agreedvalue" "Endorsements.Endorsement.AgreedValue" 
				ui.nullSafe("questionSet.endorsements.endorsement.agreedValue", "false") ""  readOnly />
			<label class="inline-label" for="agreedvalue">
			<@spring.message "questionset_endorsement_agreed_value"/></label>
		</div>
	</div>

	<span class="grid_43" style="height: 15px;">&#160;</span>
	
	<div class="grid_65" style="height:20px;">
		<div class="prefix_13 grid_43">
			<@ui.checkbox "downtimereplacement" "Endorsements.Endorsement.DowntimeReplacementVehicleHire.Applicable" 
				ui.nullSafe("questionSet.endorsements.endorsement.downtimeReplacementVehicleHire.applicable", "false") ""  readOnly />
			<label class="inline-label" for="downtimereplacement">
			<@spring.message "questionset_endorsement_downtime_replacement_vehicle_hire"/></label>
		</div>
	</div>
	
	<div class="grid_65 downtimereplacementdependent">
		
		<div class="prefix_16 grid_43">
		
			<@app.amountField "questionset_endorsement_downtime_daily_amount" "Endorsements.Endorsement.DowntimeReplacementVehicleHire.DailyAmount"
			"questionSet.endorsements.endorsement.downtimeReplacementVehicleHire.dailyAmount" "grid_5 inputsize" "" "grid_4 downtimereplacementdependent" "grid_4 inputsize" 
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
			
			<span class="grid_5">&#160;</span>
			<span class="prefix_1"></span>
			
			<@app.numberField "questionset_endorsement_downtime_indemnity_period" "Endorsements.Endorsement.DowntimeReplacementVehicleHire.IndemnityPeriod"
			"questionSet.endorsements.endorsement.downtimeReplacementVehicleHire.indemnityPeriod" "grid_6 inputsize" "" "grid_3 downtimereplacementdependent" "readonlyinput inputsize" 
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
			
			<span class="downtimereplacementdependent-days-prefix-1 grid_2 inputsize"><@spring.message "questionset_endorsement_downtime_indemnity_period_period"/></span>
		</div>

	</div>
	
	<span class="grid_43" style="height: 15px;">&#160;</span>
	
	<@row.right />
</@row.container>
<script>
	var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#downtimereplacement"), elToHide: $(".downtimereplacementdependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
</script>
