<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 


	
<nt:news-list order="priority desc,user-modification-date" zone="destacada" onmainpage="home" size="1">
	<%--<c:set var="tags" value="${news.tags}"/>		
		<div id="${tags}" class="itemsTags"></div>--%>
		
		
	<c:set var="tags" value="${news.tags}"/>
	<%--<c:set var="tags2" value="${fn:toLowerCase(tags)}" />
	<c:set var="tags4" value="${fn:replace(tags2,' ', '')}" />
	<c:set var="tags5" value="${fn:replace(tags4,'á', 'a')}" />
	<c:set var="tags6" value="${fn:replace(tags5,'{é', 'e')}" />
	<c:set var="tags7" value="${fn:replace(tags6,'{í', 'i')}" />
	<c:set var="tags8" value="${fn:replace(tags7,'{ó', 'o')}" />
	<c:set var="tags9" value="${fn:replace(tags8,'{ú', 'u')}" />--%>
	<div id="${tags9}" class="itemsTags"></div>
</nt:news-list>
	<script>
		var navegador_url = [];
		var titulo = [];
		var thumbnail_mediano = [];
		var categoria = [];
		var categoriaLink = [];
		var itags; 
		var cont;
		var hashtag ;
		items = [];
		 $(".itemsTags").each(function(){ 
		   itags = $(this).attr("id");  
		  });
		   hashtag = itags.split(",");
                for (x = 0; x < hashtag.length; x++)
                    cont = x;

		<%--
		.- La variable api es utilizada para definir la consulta que se le hará al api en caso de que esten definidos 
		los tags en la nota destacada, en este caso sólo se usa el 1er tag.
		.- La variable urlCategoria se usa para realizar la consulta al api en caso de que la consulta echa con la variable 
		api no traiga resultados, esto con el fin de que el bloque no quede en blanco.		
		 --%>
		var api= "http://multimedia.telesurtv.net/api/clip/?detalle=completo=true&ultimo=6&hashtag="+hashtag[0];
		console.log(api);
		var urlCategoria = "http://multimedia.telesurtv.net/api/clip/?detalle=completo&ultimo=6";
		
		$.ajax({
		    type: "POST",
		    dataType: 'jsonp',
		    url: api,
		    success: function(data){
		    	var len = data.length;
		    	for(var j = 0; j < len; j++){
		    		entry = data[j];
		    		navegador_url.push(entry.url);
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
		  		
		  
		  	
			for(var i = 0; i < len; i++){
				 items.push("<li>"+
				            "<article class='sideNew'>"+
				                "<div class='wpSmallImg'>"+
				                    "<a href='"+navegador_url[i]+"'>"+
				                        "<img src='/arte/ico-play.png' alt='"+titulo[i]+"' class='icoPlay' target='_blank'>"+    
				                        "<img src='"+thumbnail_mediano[i]+"' alt='"+titulo[i]+"' height='82px'>"+
				                    "</a>"+
				                "</div>"+
				                "<div class='overflow'>"+
				                    "<h5>"+
				                        "<a href='"+categoriaLink[i]+"' class='autor' target='_blank'>"+categoria[i]+"</a>"+
				                    "</h5>"+
				                    "<h4>"+
				                        "<a href='"+navegador_url[i]+"' target='_blank'>"+titulo[i]+"</a>"+
				                    "</h4>"+			    		
				                "</div>"+
				                "</article>"+
				            "</li>"); 
		
			}  
			
			$("#bloque-videos2").html(items);
		    }
		});
		
</script> <div class="wpVideos">
	<h6>Video <img src="/arte/i-videos-d2.jpg" alt="Telesur"></h6>
	<ul id="bloque-videos2"></ul>	
 </div>
	
		