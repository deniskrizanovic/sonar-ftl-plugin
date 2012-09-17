<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>
<#assign quotationsTermBasisOptions={'CommissionIncluded':'Commission Included','NilCommission': 'Nil Commission/Fee for Service'}>


<@row.container "quotations">
	<@row.left "questionset_quotations"/>
	<div class="grid_43">
		<div class="prefix_1 grid_43">
			<span class="grid_15 gridheaders"><b><@spring.message "questionset_quote_due_by"/></b></span>
			<#assign quoteDueBy></#assign>
			<#if questionSet.quotations.quoteDueBy?? >
				<#attempt>
					<#assign quoteDueBy>${questionSet.quotations.quoteDueBy.value.toString('dd/MM/yyyy')}</#assign>
				<#recover>
					<#assign quoteDueBy></#assign>
				</#attempt>
			</#if>
			<@ui.input "Quotations.QuoteDueBy" quoteDueBy "datepicker" "date-future='true'" "text" readOnly "grid_15 inputsize"/>
			<span class="error errorMessage" rel="Quotations.QuoteDueBy"/>
		</div>
		
		<div class="prefix_1 grid_43">
			<span class="grid_15 gridheaders"><b><@spring.message "questionset_premium_quoted_commission"/></b></span>
			<@ui.dropdown "Quotations.QuoteTermBasis" quotationsTermBasisOptions ui.nullSafe("questionSet.quotations.quoteTermBasis") readOnly />
			<span class="error errorMessage" rel="Quotations.QuoteTermBasis"/>
		</div>
	
	</div>
	
	<@row.right>
		<span class="grid_15 prefix_1"><@spring.message "questionset_quotations_assistive_text"/></span>
	</@row.right>
</@row.container>
