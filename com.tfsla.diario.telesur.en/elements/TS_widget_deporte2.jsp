<div class="col-4quat">
	<div class="cont">
			<select class="fech-marcador white selreg" id="futbol" name="futbol" style="margin-bottom:0;background-color:#6dbc45; max-width: 130px;" onchange="changeSport('futbol')">		 	
		        	<option class="opt" value="">Soccer</option>
		        	<option class="opt" value="0">Champions</option>
		        	<option class="opt" value="1">Brasileirao</option>
		        	<option class="opt" value="2">Libertadores</option>
		        	<option class="opt" value="3">España</option>
		        	<option class="opt" value="4">Primera</option>
		        	<option class="opt" value="5">Sudamericana</option>
		        	<option class="opt" value="6">UEFA</option>
			</select>
			<select class="fech-marcador white selreg" id="beisbol" name="beisbol"style="margin-bottom:0;background-color:#6dbc45; max-width: 130px; margin-left:10px;" onchange="changeSport('beisbol')">		 	
		        	<option class="opt" value="">Baseball</option>
		        	<option class="opt" value="7">MLB</option>
		        	<option class="opt" value="8">LBPRC</option>
			</select>
			<select class="fech-marcador white selreg" id="basket" name="basket" style="margin-bottom:0;background-color:#6dbc45; max-width: 130px; margin-left:10px;" onchange="changeSport('basket')">		 	
		        	<option class="opt" value="">Basketball</option>	        
		        	<option class="opt" value="9">NBA</option>	        	
			</select>
			<select class="fech-marcador white selreg" id="nfl" name="nfl" style="margin-bottom:0;background-color:#6dbc45; max-width: 130px; margin-left:10px;" onchange="changeSport('nfl')">		 	
		        	<option class="opt" value="">Football</option>	        
		        	<option class="opt" value="10">NFL</option>	        	
			</select>
			<select class="fech-marcador white selreg" id="automovilismo" name="automovilismo" style="margin-bottom:0;background-color:#6dbc45; max-width: 130px; margin-left:10px;" onchange="changeSport('automovilismo')">		 	
		        	<option class="opt" value="">Motoring</option>	        
		        	<option class="opt" value="11">Formula 1</option>	        	
			</select>
			<select class="fech-marcador white selreg" id="tenis" name="tenis" style="margin-bottom:0;background-color:#6dbc45; max-width: 130px; margin-left:10px;" onchange="changeSport('tenis')">		 	
		        	<option class="opt" value="">Tennis</option>	        
		        	<option class="opt" value="12">Diary</option>	        	
			</select>
	
		<div style="height:100%; max-height:500px; width:100%;">
			<iframe id="sport-frame" style="width:100%; min-height:300px; height:100%;" src="http://static.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.libertadores.fixture&amp;lang=en_US" ></iframe> 
		</div>
	</div>
</div>
<script type="text/javascript">
      
	var pages = [ "http://staticdev.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.champions.fixture&lang=es_LA",
		        "http://staticdev.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.brasileirao.fixture&lang=es_LA",
			"http://staticdev.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.libertadores.fixture&lang=en_US",
			"http://staticdev.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.espana.fixture&lang=es_LA",
			"http://staticdev.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.primeraa.fixture&lang=es_LA",
			"http://staticdev.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.sudamericana.fixture&lang=es_LA",
			"http://staticdev.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.uefa.fixture&lang=es_LA",
			"http://staticdev.telesurtv.net/html/en/v2/index.html?torneo=mlb&page=fixture&lang=en",
			"http://static.telesurtv.net/html/en/v2/index.html?torneo=lbprc&page=posiciones&lang=en",
			"http://staticdev.telesurtv.net/html/en/v1/en/nba/fixture.html",
			"http://staticdev.telesurtv.net/html/es/v2/index.html?torneo=nfl&page=fixture&lang=es",
			"http://staticdev.telesurtv.net/html/es/v1/es/formulauno/calendario.html",
			"http://staticdev.telesurtv.net/html/en/v1/en/agenda_tenis.html"];
	
	function changeSport(select){	
		var element = document.getElementById(select);	
		var index = element.value;
		var iframe = $('#sport-frame');
		iframe.attr('src', pages[index]);
		element.value = '';
	}
	      
</script>