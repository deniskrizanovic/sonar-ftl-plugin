<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "aggregate_deductible endorsement-container">
	<@row.left ""/>
	
	<div class="prefix_13 grid_43" style="height:20px;">
		<@ui.checkbox "aggregatewithoutstoploss" "Endorsements.Endorsement.AggregateDeductibleWithoutStopLoss.Applicable" 
			ui.nullSafe("questionSet.endorsements.endorsement.aggregateDeductibleWithoutStopLoss.applicable", "false") ""  readOnly />
		<label class="inline-label" for="aggregatewithoutstoploss">
			<@spring.message "questionset_endorsement_aggregate_deductible_without_loss"/>
		</label>
	</div>

	<div class="prefix_13 grid_65 aggregatewithoutstoplossdependent">
		
		<div class="grid_43">
			<@app.amountField "questionset_endorsement_annual_aggregate_deductible" "Endorsements.Endorsement.AggregateDeductibleWithoutStopLoss.Deductible"
			"questionSet.endorsements.endorsement.aggregateDeductibleWithoutStopLoss.deductible" "prefix_3 grid_10 inputsize" "" "grid_4 aggregatewithoutstoplossdependent" "grid_15 inputsize" 
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
		</div>

	</div>
	<span class="grid_43" style="height: 15px;">&#160;</span>
	
	<div class="prefix_13 grid_43" style="height:20px;">
		<@ui.checkbox "aggregatewithstoploss" "Endorsements.Endorsement.AggregateDeductibleWithStopLoss.Applicable" 
			ui.nullSafe("questionSet.endorsements.endorsement.aggregateDeductibleWithStopLoss.applicable", "false") ""  readOnly />
		<label class="inline-label" for="aggregatewithstoploss">
		<@spring.message "questionset_endorsement_aggregate_deductible_with_loss"/></label>
	</div>
	
	<div class="prefix_13 grid_65 aggregatewithstoplossdependent">
		
		<div class="grid_43">
		
			<@app.amountField "questionset_endorsement_annual_aggregate_deductible" "Endorsements.Endorsement.AggregateDeductibleWithStopLoss.Deductible"
			"questionSet.endorsements.endorsement.aggregateDeductibleWithStopLoss.deductible" "prefix_3 grid_10 inputsize" "" "grid_4 aggregatewithstoplossdependent" "grid_4 inputsize"
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
			
			<span class="grid_5">&#160;</span>
			<span class="prefix_1"></span>
			
			<@app.amountField "questionset_endorsement_event_stop_loss_limit" "Endorsements.Endorsement.AggregateDeductibleWithStopLoss.StopLossLimit"
			"questionSet.endorsements.endorsement.aggregateDeductibleWithStopLoss.stopLossLimit" "grid_8 inputsize" "" "grid_4 aggregatewithstoplossdependent" "grid_4 inputsize"
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number" 
			readOnly />
		
		</div>
	</div>
	
	<span class="grid_65" style="height: 10px;">&#160;</span>
	
	<@row.right />
</@row.container>
<script>
	var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#aggregatewithoutstoploss"), elToHide: $(".aggregatewithoutstoplossdependent")},
										{checkbox: $("#aggregatewithstoploss"), elToHide: $(".aggregatewithstoplossdependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
</script>
