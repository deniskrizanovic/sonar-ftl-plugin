<#import "./macros/util.ftl" as util/>
<#import "./macros/formUtil.ftl" as formUtil/>
<@layout.public>
  <#assign title><@spring.message "security_login_title"/></#assign>
  <@util.login_status/>
	<#assign form_url><@spring.url "/resources/j_spring_security_check"/></#assign>
<form name="f" action="${form_url}" method="POST" class="form form-horizontal">
  <@formUtil.textBox name="j_username" label="security_login_form_name_message" class="username"/>
  <@formUtil.textBox name="j_password" label="security_login_form_password_message" type="password" class="password"/>
  <@formUtil.submitButton code="button_login" class="loginButton"/>
</form>
</@layout.public>

