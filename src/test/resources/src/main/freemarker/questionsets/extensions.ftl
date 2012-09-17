<#import "../macros/form.ftl" as ui>
<#import "../macros/formRow.ftl" as row>
<#assign extensionsHidden=false/>
<#attempt>
<#if !questionSet.coverage.cover.ownDamageAndThirdPartyLiability && !questionSet.coverage.cover.fireTheftAndThirdPartyLiability>
	<#assign extensionsHidden=true/>
</#if>
<#recover>
</#attempt>
<@row.container "extensions" extensionsHidden>	
	<@row.left key="questionset_extensions"/>
	<div class="prefix_1 grid_43">
		
		<div class="extensionsheader">
			<span class="grid_15 gridheaders"><@spring.message "questionset_extension_header"/></span>
			<span class="margin_2 grid_12 gridheaders"><@spring.message "questionset_extension_sublimit_header"/></span>
			<span class="margin_1 grid_12 gridheaders"><@spring.message "questionset_extension_required_sublimit_header"/></span>			
		</div>
		
		<div class="extensionscontent">
			<div class="grid_43" style="position:relative; top:10px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_emergency_repairs_protection_costs"/></span>
				<span class="margin_2 grid_1">&#160;</span>
				<span class="grid_8 inputsize"><@spring.message "questionset_extension_emergency_repairs_protection_costs_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.EmergencyRepairs" ui.nullSafe("questionSet.extensions.emergencyRepairs") "grid_5" "style='text-align:right;'" "number" readOnly "grid_15 inputsize"/>
				</span>
			</div>
			<div class="grid_43" style="position:relative; top:7px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_expediting_expenses"/></span>
				<span class="margin_2 grid_1">&#160;</span>
				<span class="grid_8 inputsize"><@spring.message "questionset_extension_expediting_expenses_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.ExpeditingExpenses" ui.nullSafe("questionSet.extensions.expeditingExpenses") "grid_5" "style='text-align:right;'" "number" readOnly "grid_15 inputsize"/>
				</span>
			</div>
			<div class="grid_43" style="position:relative; top:4px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_funeral_expenses"/></span>
				<span class="margin_2 grid_1">&#160;</span>
				<span class="grid_8 inputsize"><@spring.message "questionset_extension_funeral_expenses_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.FuneralExpenses" ui.nullSafe("questionSet.extensions.funeralExpenses") "grid_5" "style='text-align:right;'" "number" readOnly "grid_15 inputsize"/>
				</span>
			</div>
			<div class="grid_43" style="position:relative; top:1px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_removal_debris"/></span>
				<span class="margin_2 grid_1">&#160;</span>
				<span class="grid_8 inputsize"><@spring.message "questionset_extension_removal_debris_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.RemovalOfDebris" ui.nullSafe("questionSet.extensions.removalOfDebris") "grid_5" "style='text-align:right;'" "number" readOnly "grid_15 inputsize"/>
				</span>
			</div>
			<div class="grid_43" style="position:relative; top:-2px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_hire_costs"/></span>
				<span class="margin_2 grid_1" style="width:23px;">&#160;</span>
				<span class="grid_8 inputsize" style="width:121px;"><@spring.message "questionset_extension_hire_costs_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.HireCosts" ui.nullSafe("questionSet.extensions.hireCosts") "grid_5" "style='text-align:right;'" "number" readOnly "grid_15 inputsize"/>
				</span>
			</div>
			<div class="grid_43" style="position:relative; top:-5px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_employees_personal_property"/></span>
				<span class="margin_2 grid_1" style="width:23px;">&#160;</span>
				<span class="grid_8 inputsize" style="width:121px;"><@spring.message "questionset_extension_employees_personal_property_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.EmployeePersonalProperty" ui.nullSafe("questionSet.extensions.employeePersonalProperty")
					"grid_5" "style='text-align:right;'" "number" readOnly/>
				</span>
			</div>
			<div class="grid_43" style="position:relative; top:-8px;">
				<span class="grid_18 inputsize"><@spring.message "questionset_extension_keys_locks"/></span>
				<span class="margin_2 grid_1" style="width:23px;">&#160;</span>
				<span class="grid_8 inputsize" style="width:121px;"><@spring.message "questionset_extension_keys_locks_default_value"/></span>
				<span class="margin_1 grid_1">&#160;</span>
				<span class="grid_11">
					<@ui.input "Extensions.KeysLocks" ui.nullSafe("questionSet.extensions.keysLocks") "grid_5" "style='text-align:right;'" "number" readOnly "grid_15 inputsize"/>
				</span>
			</div>
		</div>
	</div>
	
	
	<@row.right >
		<span class="grid_15">Please note the following points in completing this section:</span>

		<span class="grid_15">(a) The default amount for the Sub-Limit of Liability has been agreed with all our Insurers and is automatically listed as the Required Sub-Limit.</span>
		
		<span class="grid_15">(b) Should your client require a different Sub-Limit, please click the box adjacent to that extension so that you can  type in another amount (in dollars only, no cents required).</span>
		
		<span class="grid_15">(c) Any Required Sub-Limit amount different to the amount previously agreed with Insurers will need to be  negotiated  and there is no guarantee that it will be accepted. 
		Also, an increase in Required Sub-Limit may result in a higher  premium.</span>
	</@row.right>
</@row.container>

