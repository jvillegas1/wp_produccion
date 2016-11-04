<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 

<html>
	<head>	
	</head>
	<body>
	
	<nt:news-list order="priority desc,user-modification-date" zone="destacada" onmainpage="home" size="1">
	
	<div class="block" itemscope itemtype="http://schema.org/Article">
	
	
	<c:set var="tags" value="${news.tags}"/>
		
				
				
			</div>
			<!--<h4> <nt:tags/></h4>-->
			
			<div id="${tags}" class="itemsTags"></div>
		</article>
	

	</div>
</nt:news-list>
	<script>
		var navegador_url = [];
		var titulo = [];
		var thumbnail_mediano = [];
		var categoria = [];
		var categoriaLink = [];
		var itags; 
		items = [];
		 $(".itemsTags").each(function(){
		  // alert($(this).attr("id"));
		   itags = $(this).attr("id");
		   //alert("este es el: "+itags);
		  });

		var api = "http://multimedia.telesurtv.net/api/clip/?detalle=completo&seleccionado=true&ultimo=5&tag="+itags;
		//alert(api);
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
		  	
		  	
		  	items.push("<a href='/seccion/programas/index.html'><img src='/arte/head-video.jpg' width='100%' class='tit'></a><div class='wpVideos'><h6>Video <img src='/arte/i-videos.jpg' alt='Telesur'></h6><ul>");

		  	
			for(var i = 0; i < len; i++){
				 items.push("<li>"+
				            "<article class='sideNew'>"+
				                "<div class='wpSmallImg'>"+
				                    "<a href='"+navegador_url[i]+"'>"+
				                        "<img src='/arte/ico-play.png' alt='"+titulo[i]+"' class='icoPlay' target='_blank'>"+    
				                        "<img src='"+thumbnail_mediano[i]+"' alt='"+titulo[i]+"'>"+
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
			
			items.push("</ul></div>");
			$("#bloque-videos").html(items);
		    }
		});
		
	</script>
		 <aside id="bloque-videos" class="v3"></aside>
	</body>
</html>