<#macro loadscripts>

  <#assign base_url><@spring.url "/"/></#assign>

  <link rel="stylesheet" type="text/css" href="${base_url}styles/bootstrap.css"/>
  <link rel="stylesheet" type="text/css" href="${base_url}styles/vertex.css"/>
  <link rel="stylesheet" type="text/css" href="${base_url}styles/bootstrap-datepicker.css"/>
  
  <script src="${base_url}javascript/jquery-1.7.1.min.js" type="text/javascript"><!--ff--></script>
  <script src="${base_url}javascript/bootstrap.min.js" type="text/javascript"><!-- required for FF3 and Opera --></script>
  <script src="${base_url}javascript/bootstrap-datepicker.js" type="text/javascript"><!-- required for FF3 and Opera --></script>

</#macro>
