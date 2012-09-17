<#import "../macros/formRow.ftl" as row>
<#import "../macros/form.ftl" as ui>
<html>
<body>
<#if !readOnly?exists>
	<#assign readOnly=false/>
</#if>
<form id="questionset" name="questionset">
	<#attempt>
	<#include "vehiclesOfInsurance.ftl"/>
	<#include "descriptionOfCover.ftl"/>
	<#include "extensions.ftl"/>
	<#include "limitsOfLiability.ftl"/>
	<#include "premiumAdjustment.ftl"/>
	<#include "endorsements.ftl"/>
	<#include "endorsementsRestrictCover.ftl"/>
	<#include "additionalEndorsements.ftl"/>
	<#include "quotations.ftl"/>
	<#include "policyWording.ftl"/>
	<#recover>
		Questionsets could not be loaded. Technical Description: ${.error}
	</#attempt>
</form>
</body>
</html>
