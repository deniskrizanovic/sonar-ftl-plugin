<#import "./macros/formUtil.ftl" as formUtil>
<@layout.default>
	<#assign title><@spring.message "label_com_aon_mmbs_insurers_domain_help_title"/></#assign>
		
<h3>${title}</h3>
<#assign supportflow><@spring.url "/images/supportprocess.jpg"/></#assign>
<div class="hero-unit">
<h3>System Inquiry</h3>
<p>
If your enquiry is a system related issue:
Contact your internal system administrator for support.
	<div>For more information: <a href="${supportflow}">Insurer Go-Live Support Process</a></div>
</p>
</div>

<div class="hero-unit">
<h3>Quote Slip Inquiry</h3>
<p>
If your enquiry is a Quotation Slip related query:
Contact the assigned Aon broker via phone or email provided by clicking on the "Broker" contact hyperlink located on the Quotation Slip Information page
</p>
</div>

</@layout.default>
