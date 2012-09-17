<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "claims_experience_discount endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43" style="height:20px;">
	<@ui.checkbox "claimsexperiencediscount" "Endorsements.Endorsement.ClaimsExperience.Applicable" 
		ui.nullSafe("questionSet.endorsements.endorsement.claimsExperience.applicable", "false") ""  readOnly />
	<label class="inline-label" for="claimsexperiencediscount">
	<@spring.message "questionset_endorsement_claims_experience_discount"/></label>
	</div>
	
	<div class="prefix_16 grid_65 claimsexperiencediscountdependent">
		
		<div class="grid_43">
		
			<@app.numberField "questionset_endorsement_claims_experience_loss_percentage" "Endorsements.Endorsement.ClaimsExperience.LossPercentage"
			"questionSet.endorsements.endorsement.claimsExperience.lossPercentage" "grid_6 inputsize" "" "grid_2 claimsexperiencediscountdependent" "prefix_1 grid_2 inputsize" 
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
			
			<span class="grid_2">&#160;</span>
			<span class="prefix_1"></span>
			
			<@app.numberField "questionset_endorsement_claims_experience_refund_percentage" "Endorsements.Endorsement.ClaimsExperience.RefundPercentage"
			"questionSet.endorsements.endorsement.claimsExperience.refundPercentage" "grid_7 inputsize" "" "grid_2 claimsexperiencediscountdependent" "prefix_1 grid_2 inputsize"
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
	
			<span class="grid_2">&#160;</span>
			<span class="prefix_1"></span>
	
			<@app.numberField "questionset_endorsement_claims_experience_max_refund_percentage" "Endorsements.Endorsement.ClaimsExperience.MaximumRefundPercentage"
			"questionSet.endorsements.endorsement.claimsExperience.maximumRefundPercentage" "grid_9 inputsize" "width: 164px;" "grid_2 claimsexperiencediscountdependent" "prefix_1 grid_2 inputsize" 
			"data-type='number' required='true' size-min='1' size-max='999999999'"
			"number"
			readOnly />
		
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
										{checkbox: $("#claimsexperiencediscount"), elToHide: $(".claimsexperiencediscountdependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
</script>
