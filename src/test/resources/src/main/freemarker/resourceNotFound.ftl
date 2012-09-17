<@layout.public>
<div>
  <#assign title><@spring.message "error_resourcenotfound_title"/></#assign>
  <h4 class="title">${title}</h4>
    <p>
      <@spring.message "error_resourcenotfound_problemdescription" />
    </p>
</div>
</@layout.public>