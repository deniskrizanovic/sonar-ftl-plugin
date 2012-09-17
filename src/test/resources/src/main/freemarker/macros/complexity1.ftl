
<#--start with one-->

<option value="${value?html}" <@checkSelected statusValue value/>>${options[value]?string}</option>

<!-- now add another for two -->

    <#if statusValue?is_number>selected="selected"</#if>

<#--now a compound statement for four-->
    <#if statusValue?is_string && statusValue == value>selected="selected"</#if>


<#--add two more, one for attempt, one for recover making 6-->
<#function nullSafe path="" defaultValue="">
    <#attempt>
        <#return path?eval?string>
        <#recover>
            <#return defaultValue>
    </#attempt>
</#function>