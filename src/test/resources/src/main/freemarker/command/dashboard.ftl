<@layout.public>
  <#assign base><@spring.url "/"/></#assign>
  <script type="text/javascript" src="${base}javascript/testhelper.js"><!--ff and opera--></script>
  <script type="text/javascript">var cmd = new Command(jQuery, '${base}');</script>
  <style type="text/css">
  	.command{display:none;}
  	.parameters{
  		max-width:30em;
  		word-wrap:break-word;
  	}
  </style>
  <h4>Command Dashboard:</h4>
  <div id="dashboard">
  <form class="form" name="command">
	  <div class="control-group">
	  	<label class="control-label" for="id">Placement</label><input type="text" class="input-small" id="placementId" name="placementId" value="3"/>
	  	<div class="controls"> 
	  		<button type="button" class="btn btn-danger" onclick="javascript:cmd.loadPlacement();">GWT</button>
	  		<button type="button" class="btn btn-danger" onclick="javascript:cmd.loadPlacement('data');">Data</button>
	  	</div>
	  </div>
  
  	  <div class="control-group">
  	  <label class="control-label" for="login">Login as</label>
  	  <div class="controls btn-group">
  	  		<button type="button" class="btn btn-danger" onclick="javascript:cmd.changeUser('QBE', 'quser1');">QBE</button>
  	  		<button type="button" class="btn btn-danger" onclick="javascript:cmd.changeUser('Lumley', 'luser1');">Lumley</button>
  	  		<button type="button" class="btn btn-danger" onclick="javascript:cmd.changeUser('Global', 'guser1');">Global</button>
  	  		<button type="button" class="btn btn-danger" onclick="javascript:cmd.changeUser('Aon');">Aon</button>
  	  </div>
  	  
	<div class="control-group">
		<label class="control-label" for="refresh">Refresh</label>
		<div class="controls">
			<button type="button" class="btn btn-danger" onclick="javascript:cmd.refreshPlacement('all');">All</button>
			<button type="button" class="btn btn-danger" onclick="javascript:cmd.refreshPlacement();">Individual</button>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="refresh">Create</label>
		<div class="controls">
			<button type="button" class="btn btn-danger" onclick="javascript:cmd.createPlacement();">New Business</button>
			<button type="button" class="btn btn-danger" onclick="javascript:cmd.createPlacement('renewal');">Renewal</button>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="refresh">Application Information</label>
		<div class="controls">
			<button type="button" class="btn btn-danger" onclick="javascript:cmd.appinfo('vhm');">Heavymotor Props</button>
			<button type="button" class="btn btn-danger" onclick="javascript:cmd.appinfo('services');">ATP Services Props</button>
		</div>
	</div>
	
  </form>
  <div id="commandResult" class="command alert"><!--ajax--></div>
  <div>
	  	<div class="">
	  	<#if commands?exists>
	  		<table class="table table-striped-border">
	  			<thead>
	  			<tr><th>Command</th><th>Description</th><th>Parameters</th></tr>
		  <#list commands as cmd>
		  		<tr><td><a href="#">${cmd.name}</a></td> 
		  		<td>${cmd.description}</td>
		  		<td id="parameters_${cmd.name}" class="parameters"></td>
		  		</tr>
		  </#list>
		    </table>
		 </#if>
	  	</div>
   </div>
  </div>

  <script type="text/javascript">
  	<#list commands as cmd>
	cmd.entry.addItem({'name':'${cmd.name}', 'description':'${cmd.description}'});
	</#list>
  </script>
</@layout.public>


