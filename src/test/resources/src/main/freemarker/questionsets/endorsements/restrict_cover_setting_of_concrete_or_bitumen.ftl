<#import "../../macros/formRow.ftl" as row>
<#import "../../macros/form.ftl" as ui>
<#import "../../macros/app.ftl" as app>

<@row.container "restrict_cover_setting_of_concrete_or_bitumen endorsement-container">
	<@row.left ""/>

	<div class="prefix_13 grid_43">
			<@ui.checkbox "settingofconcretebitumen" "Endorsements.Endorsement.SettingOfConcreteBitumen" 
			"${questionSet.endorsements.endorsement.settingOfConcreteBitumen?string}" "" readOnly/>
			<label class="inline-label" for="settingofconcretebitumen"><@spring.message "questionset_endorsement_setting_of_concrete_bitumen"/></label>
	</div>

	<@row.right ""/>
</@row.container>
