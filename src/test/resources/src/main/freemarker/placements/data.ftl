<@layout.simple>
  <#assign base><@spring.url "/"/></#assign>
  <script type="text/javascript" src="${base}javascript/je-jsoneditor-min.js"><!--ff--></script>
  <script type="text/javascript" src="${base}javascript/je-interface.js"><!--ff--></script>
  <link rel="stylesheet" type="text/css" href="${base}styles/je-interface.css"><!-- link --></link>
  <link rel="stylesheet" type="text/css" href="${base}styles/je-jsoneditor.css"><!-- link --></link>
  <div id="header">
  Placement Id: ${opportunityId!''}
  </div>
  <div id="auto">
  <div id="contents">
    <div id="jsonformatter"><!-- ff holder --></div>

    <div id="splitter"><!-- split holder --></div>

    <div id="jsoneditor"><!-- edit holder --></div>
    
    <script type="text/javascript">
      main.load({
    	  json: ${text!''},
    	  contextPath: '${main!''}'
      });
      main.resize();
    </script>
  </div>
  </div>
<div id="footer">
  <div id="footer-inner"><!-- ff -->
  </div>
</div>  
<script type="text/javascript">
  main.resize();
</script>  
</@layout.simple>

