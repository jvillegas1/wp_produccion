<%@ include file="TS_Common_Libraries.jsp" %>
<nt:conditional-include oncondition="${news.videoscount == 1 }">  
					<!--Se aplica las mejores practicas de imagenes -->       	
    <a href="#" class="iraVideos"><cms:img src="/arte/ico-videos.png" />Video</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.videoscount > 1 }"> 
				   <!--Se aplica las mejores practicas de imagenes -->        	
    <a href="#" class="iraVideos"><cms:img src="/arte/ico-videos.png"  alt="Videos"/>Videos</a>                 
</nt:conditional-include>                       
<nt:conditional-include oncondition="${news.imagescount == 1 }">
				<!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraFotos"><cms:img src="/arte/ico-fotos.png" />Foto</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.imagescount > 1 }">
			         <!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraFotos"><cms:img src="/arte/ico-fotos.png" />Fotos</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.filescount == 1 }">
				<!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraAdjuntos"><cms:img src="/arte/ico-fotos.png" />Documento</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.filescount > 1 }">
			         <!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraAdjuntos"><cms:img src="/arte/IconosPDF.jpg" />Documentos</a>
</nt:conditional-include>
<nt:news>
    <nt:related-news size="1">
    			        <!--Se aplica las mejores practicas de imagenes -->  
        <nt:conditional-include oncondition="${newslist.size == 1}">
            <nt:conditional-include oncondition="${newslist.position == 1}">
                <a href="#" class="iraRelacionada"><cms:img src="/arte/IconosRel.jpg" />Relacionada</a>
            </nt:conditional-include>
        </nt:conditional-include>
        <nt:conditional-include oncondition="${newslist.size > 1}">
        			<!--Se aplica las mejores practicas de imagenes -->  		      
            <nt:conditional-include oncondition="${newslist.position == 1}">
                <a href="#" class="iraRelacionada"><cms:img src="/arte/IconosRel.jpg" />Relacionadas</a>
            </nt:conditional-include>
        </nt:conditional-include>
    </nt:related-news>	
</nt:news>