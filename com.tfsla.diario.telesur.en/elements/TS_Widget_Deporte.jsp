<div class="col-4quat">
	<div class="cont">
			<select class="fech-marcador white selreg" id="futbol" name="futbol"  onchange="changeSport('futbol')">		 	
		        	<option class="opt" value="">Soccer</option>
		        	<option class="opt" value="0">UEFA</option>		        	
		        	<option class="opt" value="1">Copa Am&eacute;rica</option>
		        	<option class="opt" value="2">Libertadores</option>
		        	<option class="opt" value="3">Copa Gold</option>
			</select>
			<select class="fech-marcador white selreg" id="beisbol" name="beisbol" onchange="changeSport('beisbol')">		 	
		        	<option class="opt" value="">Baseball</option>
		        	<option class="opt" value="4">MLB</option>
		        	<option class="opt" value="5">LBPRC</option>
			</select>
			<select class="fech-marcador white selreg" id="basket" name="basket"  onchange="changeSport('basket')">		 	
		        	<option class="opt" value="">Basketball</option>	        
		        	<option class="opt" value="6">NBA</option>	        	
			</select>
			<select class="fech-marcador white selreg" id="nfl" name="nfl"  onchange="changeSport('nfl')">		 	
		        	<option class="opt" value="">Football</option>	        
		        	<option class="opt" value="7">NFL</option>	        	
			</select>
			<select class="fech-marcador white selreg" id="automovilismo" name="automovilismo"  onchange="changeSport('automovilismo')">		 	
		        	<option class="opt" value="">Motoring</option>	        
		        	<option class="opt" value="8">Formula 1</option>	        	
			</select>
			<select class="fech-marcador white selreg" id="tenis" name="tenis"  onchange="changeSport('tenis')">		 	
		        	<option class="opt" value="">Tennis</option>	        
		        	<option class="opt" value="9">Diary</option>	        	
			</select>
	
		<div style="height:100%; max-height:500px; width:100%;">
			<iframe id="sport-frame" style="width:100%; min-height:300px; height:100%;" src="http://static.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.uefa&lang=en_US"></iframe> 
		</div>
	</div>
</div>
<script type="text/javascript">
      
	var pages = [   "http://static.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.uefa&lang=en_US",
			"http://static.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.copaamerica&lang=en_US",
			"http://static.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.libertadores&lang=en_US",
			"http://static.telesurtv.net/html/en/v3/index.html?channel=deportes.futbol.copaoro&lang=en_US",
			"http://static.telesurtv.net/html/en/v2/index.html?torneo=mlb&page=posiciones&lang=en",
			"http://static.telesurtv.net/html/en/v2/index.html?torneo=lbprc&page=posiciones&lang=en",
			"http://static.telesurtv.net/html/en/v1/en/nba/fixture.html",
			"http://static.telesurtv.net/html/en/v2/index.html?torneo=nfl&page=fixture&lang=en",
			"http://static.telesurtv.net/html/en/v1/en/formulauno/calendario.html",
			"http://static.telesurtv.net/html/en/v1/en/agenda_tenis.html"];
	
	function changeSport(select){	
		var element = document.getElementById(select);	
		var index = element.value;
		var iframe = $('#sport-frame');
		iframe.attr('src', pages[index]);
		element.value = '';
	}
	      
</script>