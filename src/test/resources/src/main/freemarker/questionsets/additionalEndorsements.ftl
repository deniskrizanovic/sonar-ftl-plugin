<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>
<div class="questionSetSectionHeader grid_71 prefix_1">
	<span class="questionSetSectionHeaderTitle prefix1" ><p style="vertical-align: middle;"><@spring.message "questionset_additional_endorsements"/></p></span>
</div>
<@row.container "additionalEndorsements">
	<div class="prefix_13 grid_43">
		    <div class="grid_42" align="left">
		    	<div> 
					<div class="grid_1"><input type="radio" id="questionsetadditionalendorsementsapplicable" name="AdditionalEndorsements.Applicable" value="true" <@ui.readOnlyAppender readOnly/>/></div>
					<div class="grid_6"><@spring.message "questionset_additional_endorsements_applicable"/></div>
					<div class="grid_1"><input type="radio" id="questionsetadditionalendorsementsnotapplicable" name="AdditionalEndorsements.Applicable" value="false" <@ui.readOnlyAppender readOnly/>/></div>
					<div class="grid_6"><@spring.message "questionset_additional_endorsements_not_applicable"/></div>
				</div>
				
				<div class="grid_37" id="additionalendorsementswordingscontainer"> 
					
					<div class="grid_37" id="additionalendorsementswordingpanels">		
						<#list questionSet.additionalEndorsements.additionalEndorsementWordings as wording>
							<div class="questionsetadditionalendorsementsnotapplicabledependent additionalendorsementswordingpanel grid_37" id="additionalendorsementswordingpanel_${wording_index}">						
								<span class="grid_35">
									<textarea  name="AdditionalEndorsements.AdditionalEndorsementWordings[${wording_index}].AdditionalEndorsementWording" class="questionsetadditionalendorsementsnotapplicabledependent questionSet-TextArea grid_35" rows="3" cols="20" <@ui.readOnlyAppender readOnly/>>${wording.additionalEndorsementWording}</textarea>
								</span>
								<#if !readOnly>
									<span class="grid_2"><img id="deleteendorsementbutton" rowidtodelete="additionalendorsementswordingpanel_${wording_index}" class="deleteendorsement questionSet-GarbageBin" src="images/garbage_bin.png" style="border: none; margin-left: 5px;" alt="Delete"/></span>
								</#if>
							</div>
						</#list>
					</div>

					<div>
						<@ui.button "addendorsementsbutton" "questionset_additional_endorsements_add" readOnly "button primaryButton grid_9 firstbutton questionsetadditionalendorsementsnotapplicabledependent"/>
					</div>
			    </div>
			</div>
			
	</div>
	
	<@row.right>
		<span class="grid_15"><@spring.message "questionset_additional_endorsements_author_note"/></span>

		<span class="grid_15"><@spring.message "questionset_additional_endorsements_author_note_a"/></span>
		
		<span class="grid_15"><@spring.message "questionset_additional_endorsements_author_note_b"/></span>
		
		<span class="grid_15"><@spring.message "questionset_additional_endorsements_author_note_c"/></span>
	</@row.right>
</@row.container>

<script type="text/javascript">
	
	function AdditionalEndorsementsRunner (params) {		
	
		function init( ) {
			var applicable = '${questionSet.additionalEndorsements.applicable?string}';

			if(applicable === 'true') {
				$("#questionsetadditionalendorsementsapplicable").attr('checked', 'true');
				<#if readOnly>
					$(".questionsetadditionalendorsementsnotapplicabledependent").attr("disabled", "disabled");
				<#else>
					$(".questionsetadditionalendorsementsnotapplicabledependent").removeAttr("disabled", "disabled").show();
				</#if>
			} else {
				$("#questionsetadditionalendorsementsnotapplicable").attr('checked', 'true');
				$(".questionsetadditionalendorsementsnotapplicabledependent").attr("disabled", "disabled").hide();
			};
		
			$("input[name='AdditionalEndorsements.Applicable']").click(function() {
				var ownCheckedFlag = $("input[name='AdditionalEndorsements.Applicable']").attr('checked');
				if (ownCheckedFlag === 'checked') {
					$("#questionsetadditionalendorsementsapplicable").attr('checked', 'true');
					$(".questionsetadditionalendorsementsnotapplicabledependent").removeAttr("disabled", "disabled");
					$(".questionsetadditionalendorsementsnotapplicabledependent").show();
				} else {
					$("#questionsetadditionalendorsementsnotapplicable").attr('checked', 'true');
					$(".questionsetadditionalendorsementsnotapplicabledependent").attr("disabled", "disabled");
					$(".questionsetadditionalendorsementsnotapplicabledependent").hide();
				}
			});

			var additionalEndorsementsTable = new AddButtonTable({
												addButtonId: "addendorsementsbutton",
												addToPanelId: "additionalendorsementswordingpanels",
												childClass: "additionalendorsementswordingpanel",
												deleteButtonsClass: "deleteendorsement",
												numberOfPanels: ${questionSet.additionalEndorsements.additionalEndorsementWordings?size},
												newRowHtml: "<div class='questionsetadditionalendorsementsnotapplicabledependent additionalendorsementswordingpanel grid_37' id='additionalendorsementswordingpanel_rowIndexToken'>" +						
																"<span class='grid_35'>" +
																	"<textarea  name='AdditionalEndorsements.AdditionalEndorsementWordings[rowIndexToken].AdditionalEndorsementWording' class='questionsetadditionalendorsementsnotapplicabledependent questionSet-TextArea grid_35' rows='3' cols='20'></textarea>" +
																"</span>" +
																"<span class='grid_2'><img class='deleteendorsement questionSet-GarbageBin' rowidtodelete='additionalendorsementswordingpanel_rowIndexToken' src='images/garbage_bin.png' style='border: none; margin-left: 5px;' alt='Delete'/></span>" +
															"</div>"
											});
			additionalEndorsementsTable.run();
		}
	
		return {
	    	run: function(){
	    		init();
	    	}
	    };
	};

	var additionalEndorsementsRunner = new AdditionalEndorsementsRunner();
	additionalEndorsementsRunner.run();
</script>