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
    <a href="#" class="iraFotos"><cms:img src="/arte/ico-fotos.png" />Photo</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.imagescount > 1 }">
			         <!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraFotos"><cms:img src="/arte/ico-fotos.png" />Photos</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.filescount == 1 }">
				<!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraAdjuntos"><cms:img src="/arte/ico-fotos.png" />Document</a>
</nt:conditional-include>
<nt:conditional-include oncondition="${news.filescount > 1 }">
			         <!--Se aplica las mejores practicas de imagenes -->  
    <a href="#" class="iraAdjuntos"><cms:img src="/arte/IconosPDF.jpg" />Documents</a>
</nt:conditional-include>
<nt:news>
    <nt:related-news size="1">
    			        <!--Se aplica las mejores practicas de imagenes -->  
        <nt:conditional-include oncondition="${newslist.size == 1}">
            <nt:conditional-include oncondition="${newslist.position == 1}">
                <a href="#" class="iraRelacionada"><cms:img src="/arte/IconosRel.jpg" />Related Article</a>
            </nt:conditional-include>
        </nt:conditional-include>
        <nt:conditional-include oncondition="${newslist.size > 1}">
        			<!--Se aplica las mejores practicas de imagenes -->  		      
            <nt:conditional-include oncondition="${newslist.position == 1}">
                <a href="#" class="iraRelacionada"><cms:img src="/arte/IconosRel.jpg" />Related News</a>
            </nt:conditional-include>
        </nt:conditional-include>
    </nt:related-news>	
</nt:news>