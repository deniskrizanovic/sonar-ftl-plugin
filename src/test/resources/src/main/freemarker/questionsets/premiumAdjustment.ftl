<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>


<#assign premiumAdjustmentType = ui.nullSafe("questionSet.premiumAdjustment.type")/>
<#assign premiumAdjustmentFrequency = ui.nullSafe("questionSet.premiumAdjustment.frequency")/>
<#assign premiumAdjustmentDescription = ui.nullSafe("questionSet.premiumAdjustment.description")/>

<#assign premiumAdjustmentMethodValueDisplayJsArray="[':', 'UnitCost:Unit Cost/Value Premium Adjustment', 
			'BurningCost:Burning Cost Premium Adjustment', 'IndividuallyRated:Individually Rated']"/>
<#assign premiumAdjustmentFrequencyValueDisplayJsArray="[':', 'Annual:Annual', 'HalfYearly:Half yearly', 
            'Quarterly:Quarterly', 'ExpiryOfPeriodOfInsurance:Expiry of Period of Insurance', 
            'Other:Other, specify', 'Within28Days:Within 28 days from acquisition/disposal']"/>

<div class="questionSetSectionHeader grid_71 prefix_1">
	<span class="questionSetSectionHeaderTitle prefix1"><p style="vertical-align: middle;"><@spring.message "questionset_premium_adjustment"/></p></span>
</div>

<@row.container>
	<@row.left/>
	
	<div id="premiumadjustmentcontainer" class="prefix_12 grid_43">

		<div class="premiumadjustmentheader">
			<span class="margin_2 grid_6 gridheaders"><@spring.message "questionset_premium_adjustment_method"/></span>
			<span class="margin_14 grid_10 gridheaders"><@spring.message "questionset_premium_adjustment_frequency"/></span>
		</div>

		<select name="PremiumAdjustment.Type" id="premiumadjustmenttype" class="margin_2 grid_16" <@ui.readOnlyAppender readOnly/> >
		</select>

		<#if premiumAdjustmentType == "">
		  <select name="PremiumAdjustment.Frequency" id="premiumadjustmentfrequency" class="margin_4 grid_15" disabled="disabled" >
		  </select>
		<#else>
		  <select name="PremiumAdjustment.Frequency" id="premiumadjustmentfrequency" class="margin_4 grid_15" <@ui.readOnlyAppender readOnly/> >
		  </select>
		</#if>
	</div>

	<@row.right>
		<div id="premiumadjustmentauthornote" class="prefix_1 grid_15">
			<span class="grid_15">Please select the method of Premium Adjustment from the dropdown menu. This will be applied to the Deposit Premium and the Frequency or Period that the Insured will adopt in providing an updated Schedule of Motor Vehicles after inception of the policy.</span>
		</div>
	</@row.right>
</@row.container>

<script>
	function PremiumAdjustmentRunner (params) {
		params = params || {};
		var premiumAdjustmentMethodValueDisplayJsArray = params.methodsList;
		var premiumAdjustmentFrequencyValueDisplayJsArray = params.frequencyList;
		var premiumAdjustmentType = params.premiumAdjustmentType;
		var premiumAdjustmentFrequency = params.premiumAdjustmentFrequency;
		var premiumAdjustmentDescription = "" + params.premiumAdjustmentDescription;
		var addedNote = "<span id='premiumadjustmentauthornoteburningcost'><br/>Insurer will be required to provide the following:<br/>- Minimum Premium<br/>- Maximum Premium<br/>- Loss Adjusment Ratio<br/></span>";
					
		function createOptionTag (value, display, selectedCheck) {
			var selectedAttr = ""; 
			if(value === selectedCheck){
				selectedAttr = "selected=true";
			}

			var optionTag = "<option value='" + value +"'" + selectedAttr + ">" + display + "</option>";
			return optionTag;
		};
		
		function createInputTagForDescription (value) {
			var inputTag = "<input id='premiumadjustmentdescription' type='text' name='PremiumAdjustment.Description' class='margin_22' style='width:230px;' value='" + value + "'></option>";
			return inputTag;
		};
	
		function initMethodFrequencyOptions( ) {
				    	
			var premiumadjustmenttypeHtml = "";
			var premiumadjustmentfrequencyHtml = "";
			
		    for (valueDisplay in premiumAdjustmentMethodValueDisplayJsArray)
			{		  
			  var indexOfValue = premiumAdjustmentMethodValueDisplayJsArray[valueDisplay].indexOf(":");
			  var indexOfDisplay = premiumAdjustmentMethodValueDisplayJsArray[valueDisplay].indexOf(":") + 1;
			  
			  var value = premiumAdjustmentMethodValueDisplayJsArray[valueDisplay].substring(0, indexOfValue);
			  var display = premiumAdjustmentMethodValueDisplayJsArray[valueDisplay].substring(indexOfDisplay);
			  
			  premiumadjustmenttypeHtml += createOptionTag(value, display, premiumAdjustmentType);
			}
			
			premiumadjustmentfrequencyHtml = createFrequencyOptions(premiumAdjustmentType, premiumAdjustmentFrequencyValueDisplayJsArray, premiumAdjustmentFrequency);
			
			$("#premiumadjustmentcontainer").append(createInputTagForDescription(premiumAdjustmentDescription));
			$("#premiumadjustmentdescription").attr("disabled", "disabled");
			$("#premiumadjustmentdescription").hide();
			
			if(premiumAdjustmentType !== "IndividuallyRated" && premiumAdjustmentFrequency === "Other"){
				$("#premiumadjustmentdescription").removeAttr("disabled", "disabled");
				$("#premiumadjustmentdescription").show();

				if(premiumAdjustmentType === 'BurningCost') {					
					$("#premiumadjustmentauthornote").append(addedNote);
				}
			}
			
			$("#premiumadjustmenttype").html(premiumadjustmenttypeHtml);
			$("#premiumadjustmentfrequency").html(premiumadjustmentfrequencyHtml);
		};
	
		function createFrequencyOptions(typeSelected, premiumAdjustmentFrequencyValueDisplayJsArray, defaultValue) {
			var premiumadjustmentfrequencyHtml = "";
		
			for (valueDisplay in premiumAdjustmentFrequencyValueDisplayJsArray)
			{		  
			  var indexOfValue = premiumAdjustmentFrequencyValueDisplayJsArray[valueDisplay].indexOf(":");
			  var indexOfDisplay = premiumAdjustmentFrequencyValueDisplayJsArray[valueDisplay].indexOf(":") + 1;
			  
			  var value = premiumAdjustmentFrequencyValueDisplayJsArray[valueDisplay].substring(0, indexOfValue);
			  var display = premiumAdjustmentFrequencyValueDisplayJsArray[valueDisplay].substring(indexOfDisplay);
			  
			  if(typeSelected !== "IndividuallyRated" && value !== "Within28Days"){
			  	premiumadjustmentfrequencyHtml += createOptionTag(value, display, defaultValue);			  	
			  }
			  
			  if(typeSelected === "IndividuallyRated" && (value === "" || value === "Within28Days")){
			  	premiumadjustmentfrequencyHtml += createOptionTag(value, display, "Within28Days");
			  }
			}
			
			return premiumadjustmentfrequencyHtml;
		};
	
	    $("#premiumadjustmenttype").change(function () {			
		    if(this.value !== ''){
		    	$("#premiumadjustmentfrequency").removeAttr("disabled", "disabled");
				$("#premiumadjustmentfrequency").html(createFrequencyOptions(this.value, premiumAdjustmentFrequencyValueDisplayJsArray, ""));
				
				if(this.value === 'BurningCost') {					
					$("#premiumadjustmentauthornote").append(addedNote);
				}
				else {
					$("#premiumadjustmentauthornoteburningcost").remove();
				}
		    }
		    else {
		    	$("#premiumadjustmentfrequency").attr("disabled", "disabled");
		        $("#premiumadjustmentfrequency option:selected").removeAttr("selected");
		    }
		    $("#premiumadjustmentdescription").attr("disabled", "disabled");
			$("#premiumadjustmentdescription").hide();
	    });

	    $("#premiumadjustmentfrequency").change(function () {
	    	if(this.value === 'Other'){
	    		$("#premiumadjustmentdescription").removeAttr("disabled", "disabled");
				$("#premiumadjustmentdescription").show();
	    	}
	    	else {
	    		$("#premiumadjustmentdescription").attr("disabled", "disabled");
				$("#premiumadjustmentdescription").hide();
	    	}
	    });
	    
	    return {
	    	run: function(){
	    		initMethodFrequencyOptions();
	    	}
	    };
	 };

	 var premiumAdjustmentRunner = new PremiumAdjustmentRunner({ methodsList: ${premiumAdjustmentMethodValueDisplayJsArray}, 
	 										frequencyList: ${premiumAdjustmentFrequencyValueDisplayJsArray},
	 										premiumAdjustmentType: "${premiumAdjustmentType}",
	 										premiumAdjustmentFrequency: "${premiumAdjustmentFrequency}",
	 										premiumAdjustmentDescription: "${premiumAdjustmentDescription}"
	 										});
	 premiumAdjustmentRunner.run();
</script>
