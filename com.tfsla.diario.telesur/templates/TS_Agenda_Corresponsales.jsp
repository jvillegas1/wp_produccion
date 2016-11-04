<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<html>
	<head>
	</head>
	<body>
		<script>
		var navegador_url_cor = [];
		var titulo_cor = [];
		var corresponsal_cor = [];
		var corresponsalLink_cor = [];
		var thumbnail_mediano_cor = [];
		items_cor = [];
		var api_cor = "http://multimedia.telesurtv.net/api/clip/?detalle=completo&corresponsal=no_es_nulo&ultimo=6";
		var corresponsalURL = "http://multimedia.telesurtv.net/web/telesur/#!es/lista/noticia/corresponsales--";
		
		$.ajax({
		    type: "POST",
		    dataType: 'jsonp',
		    url: api_cor,
		    success: function(data){
		    	var len = data.length;
		    	for(var j = 0; j < len; j++){
		    		entry = data[j];
		    		navegador_url_cor.push(entry.navegador_url);
		    		titulo_cor.push(entry.titulo);
		    		corresponsal_cor.push(entry.corresponsal.nombre);
		    		corresponsalLink_cor.push(corresponsalURL+entry.corresponsal.slug);
		    		thumbnail_mediano_cor.push(entry.thumbnail_mediano);
		    	}
		  	
		  	items_cor.push("<h6>Corresponsales <img src='/arte/i-corres.jpg' alt='Telesur' ></h6>");
			for(var i = 0; i < len; i++){
				items_cor.push("<article>"+
					    	"<div class='wpSmallImg'>"+
						    	"<a href='"+navegador_url_cor[i]+"' target='_blank'>"+
						    		"<img src='/arte/ico-play.png' alt='"+titulo_cor[i]+"' class='icoPlay'>"+
						    	"</a>"+
						    	"<img src='"+thumbnail_mediano_cor[i]+"' alt='"+titulo_cor[i]+"'>"+
					    	"</div>"+
					    	"<div class='overflow'>"+
					    		"<h4>"+
					    			"<a href='"+navegador_url_cor[i]+"' target='_blank'>"+titulo_cor[i]+"</a>"+
					    		"</h4>"+
					    		"<a href='"+corresponsalLink_cor[i]+"' class='autor' target='_blank'>"+corresponsal_cor[i]+"</a>"+
					    	"</div>"+
					    "</article>");
		
			}  
			$("#corresponsales").html(items_cor);
		    }
		});
		</script>
		
		 <div id="corresponsales" class="block corres clear">     
		 </div>
	</body>
</html>