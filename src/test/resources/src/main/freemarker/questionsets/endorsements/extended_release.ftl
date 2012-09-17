<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "extended_release endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
	<@ui.checkbox "extendedreleaseunspecified" "Endorsements.Endorsement.ExtendedReleaseUnspecified" 
		ui.nullSafe("questionSet.endorsements.endorsement.extendedReleaseUnspecified", "false") "" readOnly />
	<label class="inline-label" for="extendedreleaseunspecified">
	<@spring.message "questionset_endorsement_extended_release_unspecified"/></label>
	</div>
	
	<div class="prefix_13 grid_43">
	<@ui.checkbox "extendedreleasespecified" "Endorsements.Endorsement.ExtendedReleaseSpecified.Applicable" 
		ui.nullSafe("questionSet.endorsements.endorsement.extendedReleaseSpecified.applicable", "false") "" readOnly />
	<label class="inline-label" for="extendedreleasespecified">
	<@spring.message "questionset_endorsement_extended_release_specified"/></label>
	</div>

	<div class="prefix_13 grid_65 extendedreleasespecifieddependent">
		
		<div class="prefix_3 grid_43">
			<div class="grid_43">
				<label class="inline-label grid_15">
					<b><@spring.message "questionset_endorsement_extended_entity_or_person"/></b></label>
				<label class="inline-label grid_15" style="padding-left: 25px;">
					<b><@spring.message "questionset_endorsement_extended_specified_contract"/></b></label>
			</div>
			
			<div id="specifiedcontractpanels" class="grid_43">
				<#list questionSet.endorsements.endorsement.extendedReleaseSpecified.specifiedContracts as specifiedContract>
					<div id="specifiedcontractpanel_${specifiedContract_index}" class="specifiedcontractpanel grid_43">
						<@ui.input "Endorsements.Endorsement.ExtendedReleaseSpecified.SpecifiedContracts[${specifiedContract_index}].Name" "${specifiedContract.name!}" "grid_15 extendedreleasespecifieddependent onBlurExtendedReleaseInput" "data-type='text' required='true' size-min='1' size-max='999999999' rowindex='${specifiedContract_index}'" "text" readOnly "grid_15 inputsize"/>
						<span class="grid_1">&#160;</span>
						<@ui.input "Endorsements.Endorsement.ExtendedReleaseSpecified.SpecifiedContracts[${specifiedContract_index}].Contract" "${specifiedContract.contract!}" "grid_15 extendedreleasespecifieddependent onBlurExtendedReleaseInput" "data-type='text' required='true' size-min='1' size-max='999999999' rowindex='${specifiedContract_index}'" "text" readOnly "specified_contract_prefix_1 grid_15 inputsize"/>
						<#if !readOnly>
							<span class="grid_2"><img id="deletespecifiedcontractbutton" rowidtodelete="specifiedcontractpanel_${specifiedContract_index}" class="deletespecifiedcontract questionSet-GarbageBin" src="images/garbage_bin.png" style="border: none; margin-left: 5px;" alt="Delete"/></span>
						</#if>
					</div>
				</#list>
			</div>		
		</div>
		<span class="grid_43" style="height:12px;">&#160;</span>
	</div>
	
	<@row.right />
</@row.container>
<script>
	var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#extendedreleasespecified"), elToHide: $(".extendedreleasespecifieddependent")}
									]
									
	 							});
	checkBoxHideShowContentRunner.run();
	
	var createOnLastRowTable = new CreateOnLastRowTable({
												inputCreateNewRowClass: "onBlurExtendedReleaseInput",
												addToPanelId: "specifiedcontractpanels",
												childClass: "specifiedcontractpanel",
												deleteButtonsClass: "deletespecifiedcontract",
												readOnly: ${readOnly?string},
												newRowHtml: "<div id='specifiedcontractpanel_rowIndexToken' class='specifiedcontractpanel grid_43'>" +
															"<input type='text' name='Endorsements.Endorsement.ExtendedReleaseSpecified.SpecifiedContracts[rowIndexToken].Name' rel='qs-field' class='grid_15 extendedreleasespecifieddependent onBlurExtendedReleaseInput' rowindex='rowIndexToken'/>" +
																"<span class='grid_1'>&#160;</span>" +
																"<input type='text' name='Endorsements.Endorsement.ExtendedReleaseSpecified.SpecifiedContracts[rowIndexToken].Contract' rel='qs-field' class='grid_15 extendedreleasespecifieddependent onBlurExtendedReleaseInput' rowindex='rowIndexToken'/>" +
																"<span class='grid_2'><img id='deletespecifiedcontractbutton' rowidtodelete='specifiedcontractpanel_rowIndexToken' class='deletespecifiedcontract questionSet-GarbageBin' src='images/garbage_bin.png' style='border: none; margin-left: 5px; display:none;' alt='Delete'/></span>" +
															"</div>"
											});
	createOnLastRowTable.run();
</script>