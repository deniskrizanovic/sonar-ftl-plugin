<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "capped_excess endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43" style="height:20px;">
		<@ui.checkbox "cappedexcess" "Endorsements.Endorsement.CappedExcess.Applicable" 
			ui.nullSafe("questionSet.endorsements.endorsement.cappedExcess.applicable", "false") ""  readOnly />
		<label class="inline-label" for="cappedexcess">
		<@spring.message "questionset_endorsement_capped_excess"/></label>
	</div>

	<div class="prefix_16 grid_65 cappedexcessdependent">

		<div class="grid_43">
		
			<@app.amountField "questionset_endorsement_capped_excess_excess" "Endorsements.Endorsement.CappedExcess.Excess"
			"questionSet.endorsements.endorsement.cappedExcess.excess" "grid_5 inputsize" "" "grid_4 cappedexcessdependent" "grid_15 inputsize"  
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
										{checkbox: $("#cappedexcess"), elToHide: $(".cappedexcessdependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
</script>