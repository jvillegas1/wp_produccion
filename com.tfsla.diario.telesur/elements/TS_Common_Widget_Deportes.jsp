<style>
	.sport-bt{		
		margin-bottom:0;
		background-color:#6dbc45;
		max-width: 120px;
		font-size: 12px;
	}
</style>
<div class="col-4quat">
	<div class="cont">
			<select class="fech-marcador white selreg sport-bt" id="futbol" name="futbol" onchange="changeSport('futbol')">		 	
		        	<option class="opt" value="">Futbol</option>
		        	<option class="opt" value="0">Champions</option>
		        	<option class="opt" value="1">Brasileirao</option>
		        	<option class="opt" value="2">Libertadores</option>
		        	<option class="opt" value="3">España</option>
		        	<option class="opt" value="4">Primera</option>
		        	<option class="opt" value="5">Sudamericana</option>
		        	<option class="opt" value="6">UEFA</option>
			</select>
			<select class="fech-marcador white selreg sport-bt" id="beisbol" name="beisbol" onchange="changeSport('beisbol')">		 	
		        	<option class="opt" value="">Beisbol</option>
		        	<option class="opt" value="7">MLB</option>
		        	<option class="opt" value="13">LVBP</option>
		        	<option class="opt" value="14">LBDOM</option>
		        	<option class="opt" value="15">LMB</option>
		        	<option class="opt" value="16">Serie del Caribe</option>
			</select>
			<select class="fech-marcador white selreg sport-bt" id="basket" name="basket" onchange="changeSport('basket')">		 	
		        	<option class="opt" value="">Basket</option>	        
		        	<option class="opt" value="8">NBA</option>	        	
			</select>
			<select class="fech-marcador white selreg sport-bt" id="nfl" name="nfl" onchange="changeSport('nfl')">		 	
		        	<option class="opt" value="">Futbol Americano</option>	        
		        	<option class="opt" value="9">NFL</option>	        	
			</select>
			<select class="fech-marcador white selreg sport-bt" id="formula" name="formula" onchange="changeSport('formula')">		 	
		        	<option class="opt" value="">Automovilismo</option>	        
		        	<option class="opt" value="10">Formula 1</option>
		        	<option class="opt" value="12">Dakar</option>	        	
			</select>
			<select class="fech-marcador white selreg sport-bt" id="tenis" name="tenis" onchange="changeSport('tenis')">		 	
		        	<option class="opt" value="">Tenis</option>	        
		        	<option class="opt" value="11">Agenda</option>	        	
			</select>
	
		<div style="height:100%; max-height:500px; width:100%;">
			<iframe id="sport-frame" style="width:100%; min-height:300px; height:100%;" src="http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.champions.fixture&lang=es_LA" ></iframe> 
		</div>
	</div>
</div>

<script type="text/javascript">
      
	var pages = [   "http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.champions.fixture&lang=es_LA",
		        "http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.brasileirao.fixture&lang=es_LA",
			"http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.libertadores.fixture&lang=es_LA",
			"http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.espana.fixture&lang=es_LA",
			"http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.primeraa.fixture&lang=es_LA",
			"http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.sudamericana.fixture&lang=es_LA",
			"http://static.telesurtv.net/html/es/v3/index.html?channel=deportes.futbol.uefa.fixture&lang=es_LA",
			"http://static.telesurtv.net/html/es/v2/index.html?torneo=mlb&page=fixture&lang=es",
			"http://static.telesurtv.net/html/es/v1/es/nba/fixture.html",
			"http://static.telesurtv.net/html/es/v2/index.html?torneo=nfl&page=fixture&lang=es",
			"http://static.telesurtv.net/html/es/v1/es/formulauno/calendario.html",
			"http://static.telesurtv.net/html/es/v1/es/agenda_tenis.html",
			"http://static.telesurtv.net/html/es/v1/dakar/calendario.html",
			"http://static.telesurtv.net/html/es/v2/index.html?torneo=lvbp&page=fixture&lang=es",
			"http://static.telesurtv.net/html/es/v2/index.html?torneo=lbdom&page=fixture&lang=es",
			"http://static.telesurtv.net/html/es/v2/index.html?torneo=lmb&page=fixture&lang=es",
			"http://static.telesurtv.net/html/es/v2/index.html?torneo=seriedelcaribe&page=fixture&lang=es"];
	
	function changeSport(select){
		var element = document.getElementById(select);	
		var index = element.value;
		var iframe = $('#sport-frame');
		iframe.attr('src', pages[index]);
		element.value = '';
	}
	      
</script>