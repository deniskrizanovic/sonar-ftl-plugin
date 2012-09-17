<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>
<@row.container "descriptionofcover">
	<@row.left "questionset_description_of_cover_title"/>
	<div class="prefix_1 grid_43">
		<div>
			<span class="grid_18">
				<@ui.checkbox "" "Coverage.Cover.OwnDamageAndThirdPartyLiability" 
				ui.nullSafe("questionSet.coverage.cover.ownDamageAndThirdPartyLiability") "" readOnly/>
				<label class="inline-label" for="Coverage.Cover.OwnDamageAndThirdPartyLiability"><@spring.message "questionset_cover_own_damage_and_third_pl"/></label>
			</span>
		</div>
		<div class="clear"/>
		<div class="clear"/>
		<div class="clearfix">
			<span class="grid_18">
				<@ui.checkbox "" "Coverage.Cover.FireTheftAndThirdPartyLiability" 
				ui.nullSafe("questionSet.coverage.cover.fireTheftAndThirdPartyLiability") "" readOnly/>
				<label class="inline-label" for="Coverage.Cover.FireTheftAndThirdPartyLiability"><@spring.message "questionset_cover_fire_theft_and_third_pl"/></label>		
			</span>
		</div>
		<div class="clear"/>
		<div class="clear"/>
		<div>
			<span class="grid_18">
				<@ui.checkbox "" "Coverage.Cover.ThirdPartyLiability" 
				ui.nullSafe("questionSet.coverage.cover.thirdPartyLiability") "" readOnly/>
				<label class="inline-label" for="Coverage.Cover.ThirdPartyLiability"><@spring.message "questionset_cover_third_pl"/></label>
			</span>
		</div>
		<div class="clear"/>
	</div>
	<@row.right "questionset_cover_assistive_text"/>
</@row.container>
<script type="text/javascript">
	$(document).ready(function () {
		$("input[name='Coverage.Cover.OwnDamageAndThirdPartyLiability']").bind('click', function() {
			var ownCheckedFlag = $("input[name='Coverage.Cover.OwnDamageAndThirdPartyLiability']").attr('checked');
			if (ownCheckedFlag === 'checked') {
				$(".extensions input[rel='qs-field']").each(function() {
					var textField = $(this);
					textField.removeAttr('disabled');
				});				
				$(".extensions").slideDown(500);
			} else {
				var fireCheckedFlag = $("input[name='Coverage.Cover.FireTheftAndThirdPartyLiability']").attr('checked');
				if (fireCheckedFlag !== 'checked') {
					$(".extensions input[rel='qs-field']").each(function() {
						var textField = $(this);
						textField.attr('disabled', 'true');
					});
					$(".extensions").slideUp(500);
				}
			}
		});
		$("input[name='Coverage.Cover.FireTheftAndThirdPartyLiability']").bind('click', function() {
			var fireCheckedFlag = $("input[name='Coverage.Cover.FireTheftAndThirdPartyLiability']").attr('checked');
			if (fireCheckedFlag === 'checked') {
				$(".extensions input[rel='qs-field']").each(function() {
					var textField = $(this);
					textField.removeAttr('disabled');
				});
				$(".extensions").slideDown(500);
				
			} else {
				var ownCheckedFlag = $("input[name='Coverage.Cover.OwnDamageAndThirdPartyLiability']").attr('checked');
				if(ownCheckedFlag !== 'checked') {
					$(".extensions input[rel='qs-field']").each(function() {
						var textField = $(this);
						textField.attr('disabled', 'true');
					}); 
					$(".extensions").slideUp(500);
				}
			}
		});
	});
</script>