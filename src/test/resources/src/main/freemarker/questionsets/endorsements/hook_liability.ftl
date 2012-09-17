<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "hook_liability endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
	<@ui.checkbox "hookliability" "Endorsements.Endorsement.HookLiability.Applicable" 
		ui.nullSafe("questionSet.endorsements.endorsement.hookLiability.applicable", "false") "" readOnly/>
	<label class="inline-label" for="hookliability">
	<@spring.message "questionset_endorsement_hookliability_title"/></label>
	</div>
	<div class="prefix_13 grid_65 hookliabilitydependent" style="top: -10px;">
		<div class="grid_43">
		
		<span class="prefix_2 grid_1">&#160;</span>
		<@app.amountField "questionset_endorsement_hookliability_limit" "Endorsements.Endorsement.HookLiability.Limit"
		"questionSet.endorsements.endorsement.hookLiability.limit" "grid_5 inputsize" "left: 5px;" "grid_4 hookliabilitydependent" "grid_4 inputsize" 
		"data-type='number' required='true' size-min='1' size-max='999999999'"
		"number"
		readOnly/>

		<span class="grid_5">&#160;</span>
		<span class="prefix_1"></span>

		<@app.amountField "questionset_endorsement_hookliability_excess" "Endorsements.Endorsement.HookLiability.Excess"
		"questionSet.endorsements.endorsement.hookLiability.excess" "grid_5 inputsize" "" "grid_4 hookliabilitydependent" "grid_4 inputsize"
		"data-type='number' required='true' size-min='1' size-max='999999999'"
		"number"
		readOnly/>
			
		</div>
			
	</div>
	
	<@row.right />
</@row.container>
<script>
	var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#hookliability"), elToHide: $(".hookliabilitydependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
</script>