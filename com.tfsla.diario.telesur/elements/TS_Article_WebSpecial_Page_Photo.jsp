<%@ include file="TS_Common_Libraries.jsp" %> 
<% String width = "798" ;
String height = "449" ;
int contadorFoto = 0;
%>
<nt:news>
<!-- Inicio Caso 1: Solo una Foto incluido en la Nota -->  
   
        <nt:conditional-include oncondition="${news.imagescount == 1 }"> 
         <h7>&nbsp;</h7>
         <div class="boxEspecial fotos" id="espFotos"> 
            <div class="aside">
                <h7>Foto</h7>
                <div class="margensep"></div>
                <nt:image-gallery>
                    <span><nt:image-description/></span>                        
                    <nt:conditional-include oncondition="${sourceDescription != ''}">  
                        </br><small>Foto:<nt:image-source/></small>                                     
                    </nt:conditional-include>        		
            </div>   	                   	
            <div class="fotoEspecial">                     
                <ul><!-- IMPORTANTE: utilizo las mejores practicas: No es necesario agregar tags para escalar las imagenes, ya que el tag de newstag lo hace automáticamente, 
                	 pero se le pueden pasar a newstag 'image-path' todos los parámetros detallados anteriormente. 
                	 ref: https://projects-308321000001771055.wiki.zoho.com/Imagenes---dentro---del---cms---medios.html-->                	 
                     <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />                   
              </nt:image-gallery>                   
                </ul>      
            </div> 
            </div>         
        </nt:conditional-include>
   
<!-- Fin Caso 1: Solo una Foto incluido en la Nota -->   
<!-- Inicio Caso 2: N cantidad de  Fotos incluido en la Nota. Pueden incluir n cantidad Fotos. N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->                  
   
        <nt:conditional-include oncondition="${news.imagescount > 1 }">   
        <h7>&nbsp;</h7>
        <div class="boxEspecial fotos" id="espFotos"> 
            <h7>Fotos</h7>       		
            <div class="margensep"></div>         	
            <div class="overflow">                
                <div class="fotoEspecial">                     
                    <ul class="slides altmax"> 
                        <nt:image-gallery>
                       	    <!--IMPORTANTE: utilizo las mejores practicas:  No es necesario agregar tags para escalar las imagenes, ya que el tag de newstag lo hace automáticamente, 
                	    pero se le pueden pasar a newstag 'image-path' todos los parámetros detallados anteriormente. 
                	    ref: https://projects-308321000001771055.wiki.zoho.com/Imagenes---dentro---del---cms---medios.html -->                 	                                           
                            <li data-thumb="<nt:image-path width='<%=width %>'  height='<%=height %>'  scaletype='2'/>"  style="float: left; display: block; width: 801px;" class="prueba" alt='<nt:image-description/>' 
                            
                                title='<nt:image-description/>' width="<%=width %>" height="<%=height %>">
                              
                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                            <c:set var="sourceDescription" scope="page"><nt:image-source/></c:set>
                            <nt:conditional-include oncondition="${imageDescription != ''}">   
                                <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />                  
                                <p><nt:image-description/>
                                <nt:conditional-include oncondition="${sourceDescription != ''}">  
                                    | Foto <nt:image-source/>
                                </nt:conditional-include>
                                </p>
                            </nt:conditional-include>
                              
                        </nt:image-gallery>
                        </li>                   
                    </ul>         
                </div>          
            </div> 
            </div> 
        </nt:conditional-include> 
<!-- Fin Caso 2: N cantidad de  Fotos incluido en la Nota. Pueden incluir n cantidad Fotos. N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->                  
    
</nt:news>
<script type="text/javascript">
	$(window).load(function(){
  		$('.slides').flexslider({
    			animation: "slide",
      			animationLoop: false,
      			itemWidth: 170,
      			itemMargin: 5,
      			pausePlay: true,
      			start: function(slider){
				$('.slides').removeClass('altmax');
			}
  		});
	});
</script>