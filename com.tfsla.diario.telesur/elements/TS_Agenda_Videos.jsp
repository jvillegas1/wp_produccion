<%@ include file="TS_Common_Libraries.jsp" %>
<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 5);
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );

%>
<script>
var navegador_url = [];
var titulo = [];
var thumbnail_mediano = [];
var categoria = [];
var categoriaLink = [];
items = [];
var api = "http://multimedia.telesurtv.net/api/clip/?detalle=completo&seleccionado=true&ultimo=6";
var urlCategoria = "http://multimedia.telesurtv.net/web/telesur/#!es/lista/noticia/";

$.ajax({
    type: "POST",
    dataType: 'jsonp',
    url: api,
    success: function(data){
    	var len = data.length;
    	for(var j = 0; j < len; j++){
    		entry = data[j];
    		navegador_url.push(entry.navegador_url);
    		titulo.push(entry.titulo);
    		thumbnail_mediano.push(entry.thumbnail_mediano);    		
    		if(entry.categoria != null){
    			categoria.push(entry.categoria.nombre);
    			categoriaLink.push(urlCategoria+entry.categoria.nombre);
    		}else{
    			categoria.push("Noticias");
    			categoriaLink.push(urlCategoria+"noticias");
    		}
    	}
  	
  	items.push("<h6>Videos <img src='/arte/i-videos.jpg' alt='Telesur' ></h6>");
	for(var i = 0; i < len; i++){
		items.push("<article>"+
			    	"<div class='wpSmallImg'>"+
				    	"<a href='"+navegador_url[i]+"'>"+
				    		"<img src='/arte/ico-play.png' alt='"+titulo[i]+"' class='icoPlay'>"+
				    	"</a>"+
				    	"<img src='"+thumbnail_mediano[i]+"' alt='"+titulo[i]+"'>"+
			    	"</div>"+
			    	"<div class='overflow'>"+
			    		"<a href='"+categoriaLink[i]+"' class='autor'>"+categoria[i]+"</a>"+
			    		"<h4>"+
			    			"<a href='"+navegador_url[i]+"'>"+titulo[i]+"</a>"+
			    		"</h4>"+			    		
			    	"</div>"+
			    "</article>");

	}  
	$("#bloque-videos-agenda").html(items);
    }
});

</script>

 <div id="bloque-videos-agenda" class="block vid clear">     
 </div>