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
                <h7>Photos</h7>
                <div class="margensep"></div>
                <nt:image-gallery>
                    <span><nt:image-description/></span>                        
                    <nt:conditional-include oncondition="${sourceDescription != ''}">  
                        </br><small>Photo:<nt:image-source/></small>                                     
                    </nt:conditional-include>        		
            </div>   	                   	
            <div class="fotoEspecial">                     
                <ul>             	 
                     <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />                   
              </nt:image-gallery>                   
                </ul>      
            </div> 
            </div>         
        </nt:conditional-include>
   
   
        <nt:conditional-include oncondition="${news.imagescount > 1 }">   
        <h7>&nbsp;</h7>
        <div class="boxEspecial fotos" id="espFotos"> 

            <div class="aside">
            <h4> Photos </h4>
	  <img class="icotitIMG" src="/arte/icon-img-red.jpg" alt="Fotos">
	 <small><a class="source_red" href="https://twitter.com/teleSURtv?ref_src=twsrc%5Etfw">@telesurenglish</a></small>
		</div>   
            
                

            <div class="overflow">                
                <div class="fotoEspecial">                     
                    <ul class="slides altmax"> 
                        <nt:image-gallery>
                       	       	                                                 
                            <li data-thumb="<nt:image-path width='<%=width %>'  height='<%=height %>'  scaletype='2'/>"  style="float: left; display: block; width: 801px;" class="prueba" alt='<nt:image-description/>' 
                            
                                title='<nt:image-description/>' width="<%=width %>" height="<%=height %>">
                              
                            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                            <c:set var="sourceDescription" scope="page"><nt:image-source/></c:set>
                            <nt:conditional-include oncondition="${imageDescription != ''}">   
                                <img itemprop="contentURL" src="<nt:image-path width='<%=width %>' height='<%=height %>'  scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' width="<%=width %>" height="<%=height %>" />                  
                                <p><nt:image-description/>
                                <nt:conditional-include oncondition="${sourceDescription != ''}">  
                                    | Photo <nt:image-source/>
                                </nt:conditional-include>
                                </p>
                         
                            </nt:conditional-include>
                              
                        </nt:image-gallery>
                        </li>                   
                    </ul>         
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