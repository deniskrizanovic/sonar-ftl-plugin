<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>

<@row.container "dangerousgoods endorsement-container">
	<@row.left/>

	<span class="grid_65" style="height: 15px;">&#160;</span>
	
	<div class="prefix_13 grid_65">
		<div class="grid_1"><@ui.checkbox "dangerousgoods" "Endorsements.Endorsement.DangerousGoods.Applicable" 
			ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.applicable", "false") "" readOnly /></div>
		<div class="grid_43"><label class="inline-label grid_40" for="dangerousgoods"><@spring.message "questionset_endorsement_dangerous_goods"/></label></div>
		<div class="grid_15">These endorsements below will only be applicable if selected and will appear in the schedule</div>
	</div>

	<span class="dangerousgoodsdependent">
		<div class="prefix_16 grid_62" style="height:26px;">
			<@ui.checkbox "class1to9" "Endorsements.Endorsement.DangerousGoods.DangerousGoodsSubLimit.Class1to9.Applicable" 
					ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.dangerousGoodsSubLimit.class1to9.applicable") ""  readOnly "dangerousgoodsdependent grid_2"/>
			<label class="inline-label grid_20" for="class1to9">Sub-limit of Clause 11.1.1 is increased from $1,000,000 to</label>
	
			<span class="class1to9dependent dangerousgoodsdependent grid_16">
				<label class="inline-label grid_1">$</label>
				<@ui.input "Endorsements.Endorsement.DangerousGoods.DangerousGoodsSubLimit.Class1to9.Limit" ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.dangerousGoodsSubLimit.class1to9.limit")
					"class1to9dependent dangerousgoodsdependent grid_4" "data-type='number' required='true' size-min='1' size-max='999999999' style='top:-5px;'" "number" readOnly "dangerousgoods-readonly-input"/>
				<label class="inline-label grid_9" style="margin-left:2px;">for the following classes:</label>
			</span>
			
			
		</div>
	
		<span class="grid_60" style="height:110px;">	
			<@dangerousgoodsclass "Class 1: Explosive substances" "Class 4.3: Dangerous when wet"/>
			<@dangerousgoodsclass "Class 2.1: Flammable gases" "Class 5.1: Oxidising substances"/>
			<@dangerousgoodsclass "Class 2.2: Non-flammable non-toxic gases" "Class 5.2: Organic peroxides"/>
			<@dangerousgoodsclass "Class 2.3: Toxic gases" "Class 6.1: Toxic substances"/>
			<@dangerousgoodsclass "Class 3: Flammable liquids" "Class 8: Corrosive liquids or substances"/>
			<@dangerousgoodsclass "Class 4.1: Flammable solids" "Class 9: Miscellaneous dangerous goods"/>
			<@dangerousgoodsclass "Class 4.2: Spontaneously combustible substances" ""/>
		</span>

		<div class="prefix_16 grid_62" style="height:27px;">
			<@ui.checkbox "infectioussubstances" "Endorsements.Endorsement.DangerousGoods.DangerousGoodsSubLimit.InfectiousSubstances.Applicable" 
					ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.dangerousGoodsSubLimit.infectiousSubstances.applicable") ""  readOnly "dangerousgoodsdependent grid_2"/>
			
			<label class="inline-label" style="width:278px; float:left; top:2px;" for="infectioussubstances">Sub-limit of Clause 11.1.2 is increased from NIL to</label>
	
			<span class="dangerousgoodsdependent infectioussubstancesdependent grid_21">
				<label class="inline-label grid_1">$</label>
				<@ui.input "Endorsements.Endorsement.DangerousGoods.DangerousGoodsSubLimit.InfectiousSubstances.Limit" ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.dangerousGoodsSubLimit.infectiousSubstances.limit") 
					"infectioussubstancesdependent dangerousgoodsdependent grid_4" "data-type='number' required='true' size-min='1' size-max='999999999' style='bottom:2px;'" "number" readOnly "dangerousgoods-readonly-input"/>
				<label class="inline-label grid_13" style="margin-left:4px;">for Class 6.2 infectious substances</label>
			</span>
		</div>
	
		<div class="prefix_16 grid_62" style="height:27px;">
			<@ui.checkbox "radioactivesubstances" "Endorsements.Endorsement.DangerousGoods.DangerousGoodsSubLimit.RadioactiveSubstances.Applicable" 
					ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.dangerousGoodsSubLimit.radioactiveSubstances.applicable") ""  readOnly "dangerousgoodsdependent grid_2"/>
			
			<label class="inline-label" style="width:278px; float:left; top:2px;" for="radioactivesubstances">Sub-limit of Clause 11.1.2 is increased from NIL to</label>
	
			<span class="dangerousgoodsdependent radioactivesubstancesdependent grid_21">
				<label class="inline-label grid_1">$</label>
				<@ui.input "Endorsements.Endorsement.DangerousGoods.DangerousGoodsSubLimit.RadioactiveSubstances.Limit" ui.nullSafe("questionSet.endorsements.endorsement.dangerousGoods.dangerousGoodsSubLimit.radioactiveSubstances.limit") 
					"radioactivesubstancesdependent dangerousgoodsdependent grid_4" "data-type='number' required='true' size-min='1' size-max='999999999' style='bottom:2px;'" "number" readOnly "dangerousgoods-readonly-input"/>
				<label class="inline-label grid_12" style="margin-left:4px;">for Class 7 radioactive substances</label>
			</span>
		</div>
	</span>
	<@row.right ""/>
</@row.container>

<#macro dangerousgoodsclass col1classname col2classname>
	<div class="prefix_19 grid_60">
		<span class="grid_20">
			<label class="inline-label">${col1classname}</label>
   		</span>
   		
   		<#if col2classname != "">
	   		<span class="grid_20">
				<label class="inline-label">${col2classname}</label>
	   		</span>
   		</#if>   		
	</div>
</#macro>

<script>  	
	var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#dangerousgoods"), elToHide: $(".dangerousgoodsdependent")},
										{checkbox: $("#class1to9"), elToHide: $(".class1to9dependent")},
										{checkbox: $("#infectioussubstances"), elToHide: $(".infectioussubstancesdependent")},
										{checkbox: $("#radioactivesubstances"), elToHide: $(".radioactivesubstancesdependent")}									
									],
									readOnly: ${readOnly?string}
	 							});
	checkBoxHideShowContentRunner.run();
	$("#dangerousgoods").click(function() {
				var checkBoxHideShowContentRunner = new CheckBoxHideShowContentRunner(
								{ 
									list: 
									[
										{checkbox: $("#class1to9"), elToHide: $(".class1to9dependent")},
										{checkbox: $("#infectioussubstances"), elToHide: $(".infectioussubstancesdependent")},
										{checkbox: $("#radioactivesubstances"), elToHide: $(".radioactivesubstancesdependent")}									
									],
									readOnly: ${readOnly?string}
	 							});
	checkBoxHideShowContentRunner.run();
			});
</script>