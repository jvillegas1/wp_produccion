<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html>
<!-- Inicio Head--> 
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">multimediapage</cms:param>
    </cms:include>
    <!--Integración de la nota tipo especial-->
<script type="text/javascript">
    function cargarMasNotas(_pagina, _size) {
        div = "#bloque_" + _pagina;
        paginador = "#paginador";

        jQuery(paginador).hide();

        $.post("/system/modules/com.tfsla.diario.telesur.en/elements/TS_Article_WebSpecial_News_List.jsp",
                {pagina: _pagina, size: _size}, function (data) {
            $(div).html(data);

        });
    }
</script>
<!-- Fin Head --> 

<!-- Incio del Body --> 
    <body>
<!-- Inicio Header--> 
    <cms:include page="../elements/TS_Common_Header.jsp" >            
        <div class="subMenu">
            <cms:param name="pageTitle">Especiales Web</cms:param>
            <cms:param name="pageSeccion">multimedia</cms:param>
            <cms:param name="subMenu"></cms:param>
        </div>        
<!-- Inicio Elemento de Agenda-->     
        <div class="diaryHead"> 
            <cms:param name="agenda">si</cms:param>
            <cms:param name="latest">si</cms:param>
        </div>
<!-- Fin Elemento de Agenda-->   
    </cms:include> 
<!-- Fin Header--> 
<!-- Inicio la caja de señal en vivo--> 
    <cms:include page="../elements/TS_Common_LiveBox.jsp"></cms:include> 
<!-- Fin la caja de señal en vivo--> 
 <!-- Inicio de la Noticia  etiqueta que maneja la noticia consultada-->   
    <nt:news>
     <!-- Inicio Elemento de la Foto Previsualización de la noticia--> 
        <section class="especial"> 
         <!-- iMPORTANTE: Se ultilizando las mejores practicas de imagen-->        
            <div class="headEspecial" style="background-image:url(<cms:link><nt:preview-image><nt:image-path /></nt:preview-image ></cms:link>)" > 
          
    <!-- Fin Elemento de la Foto Previsualización de la noticia-->  
                <div class="titleEsp" style="position:absolute">
                    <div class="volanta">Special</div> <cms:include page="../elements/TS_Common_LiveBox.jsp" />
                    <div class="barra-addthis-contador" style="margin-left:300px" >
                    <%-- botones de redes con contador --%>	
		            <div class="addthis_sharing_toolbox"></div>
			    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d89d9e86045509" async="async"></script>
		            <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
			    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>
			</div>                 
                    <h2>  
                        <nt:title value="detail"/>                            
                        <nt:edit-buttons hasNew="true" hasDelete="true"/>                   
                    </h2>
                </div>
            </div>
            <div class="wrap multimedia"> 
                <!-- Inicio side bar Botones Redes Sociales -->
              <%--  <cms:include page="../elements/TS_Common_Addthis-Sidebar-ingles.jsp">
                    <cms:param name="link"><nt:link/></cms:param>
                    <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                </cms:include>  --%>
                <!-- fin side bar Botones Redes Sociales-->
                <div class="boxMmd int"> 
                    <div class="boxEspecial top" id="especialVideo">
                     <!-- Inicio elemento manejo de Anclas -->
                        <div class="aside anchors"> 
                            <cms:include page="../elements/TS_Article_WebSpecial_Anclas.jsp  "/>                                             
                        </div>
                     <!-- Fin elemento manejo de Anclas -->
                     <!-- Inicio de Sumario y Primer Parrafo -->                      
                       <p>
                        <nt:body-splitter>
                            <nt:conditional-include oncondition="${news.hideCopete == 'false' && news.subtitle != ''}">
                                <nt:conditional-include onposition='1'>
                                    <c:set var="copete_1" ><nt:sub-title/></c:set>                        
                                    <%String bodyParagrahp1=pageContext.getAttribute("copete_1").toString();
                                    if((bodyParagrahp1.contains("<p>")) && (bodyParagrahp1.contains("</p>")) ){         
                                    
                                    if(bodyParagrahp1.contains("<p>")){                               
                                        bodyParagrahp1=bodyParagrahp1.replace("<p>","<strong>"); 
                                            } 
                                            bodyParagrahp1=bodyParagrahp1;
                                    if(bodyParagrahp1.contains("</p>")){                               
                                    bodyParagrahp1=bodyParagrahp1.replace("</p>","</strong>"); 
                                    }

                                    bodyParagrahp1=bodyParagrahp1;
                                    }
                                    else {
                                    bodyParagrahp1="<strong>"+bodyParagrahp1+"</strong>";
                                    }                     
                                    %>
                                    <%=bodyParagrahp1%>
                                </nt:conditional-include>     
                            </nt:conditional-include>   
                        </nt:body-splitter>               
                        <nt:body-splitter>			
                            <nt:conditional-include onposition='1'>
                                <c:set var="bodyP" scope="page"><nt:body-paragraph/></c:set>    				 
                                <%String bodyParagrahp=pageContext.getAttribute("bodyP").toString();
                                if(bodyParagrahp.contains("<p>")){                                  
                                    bodyParagrahp=bodyParagrahp.replace("<p>",""); 
                                    } 
                                     bodyParagrahp=bodyParagrahp;
                                    if(bodyParagrahp.contains("<strong>")){                               
                                        bodyParagrahp=bodyParagrahp.replace("<strong>","<b>"); 
                                            } 
                                            bodyParagrahp=bodyParagrahp;
                                     if(bodyParagrahp.contains("</strong>")){                               
                                     bodyParagrahp=bodyParagrahp.replace("</strong>","</b>"); 
                                            } 
                                            bodyParagrahp=bodyParagrahp;                              
                                                                 
                                    %>
                                    <%=bodyParagrahp%>        																			
                            </nt:conditional-include>  					
                        </nt:body-splitter>		    	
                        </p>
                        <!-- End de Sumario y Primer Parrafo -->  
                        <!-- Inicio del Texto Enriquesido se excluye el Primer Parrafo -->                     	 
                        <nt:body-splitter>  
                            <nt:conditional-exclude onposition='1'>	                                        
                                <c:set var="bodyP" scope="page"><nt:body-paragraph/></c:set>                                   
                                <%String bodyParagrahp=pageContext.getAttribute("bodyP").toString();
                                String bodyPa=""; 
                               
                               if((bodyParagrahp.contains("<blockquote>")) && (bodyParagrahp.contains("<p>"))){                                  
                                        bodyParagrahp=bodyParagrahp.replace("<p>",""); 
                                        bodyParagrahp=bodyParagrahp.replace("<blockquote>","<div class='aside'><blockquote>");
                                        } 
                                        bodyParagrahp=bodyParagrahp;                             
                               if((bodyParagrahp.contains("<strong>"))){                               
                                        bodyParagrahp=bodyParagrahp.replace("<strong>","<b>");                                       
                                        } 
                                        bodyParagrahp=bodyParagrahp; 
                               if((bodyParagrahp.contains("</strong>"))){                               
                                        bodyParagrahp=bodyParagrahp.replace("</strong>","</b>");                                       
                                        } 
                                        bodyParagrahp=bodyParagrahp;                                                                      
                               if((bodyParagrahp.contains("<hr"))){                               
                                        bodyParagrahp=bodyParagrahp.replace("<hr","<hr style='margin-left:150px; margin-right:120px'");                                       
                                        } 
                                        bodyParagrahp=bodyParagrahp;        
                               if((bodyParagrahp.contains("</p>")) && (bodyParagrahp.contains("</strong>"))){                               
                                        bodyParagrahp=bodyParagrahp.replace("</strong>","</b>");                                       
                                        } 
                                        bodyParagrahp=bodyParagrahp;                               
                               if((bodyParagrahp.contains("href")) && (bodyParagrahp.contains("<a"))){                                  
                                        bodyParagrahp=bodyParagrahp.replace("<a","&nbsp;<span style='color: #005580;'><a"); 
                                        } 
                                        bodyParagrahp=bodyParagrahp;
                               if((bodyParagrahp.contains("</a>"))){                                  
                                        bodyParagrahp=bodyParagrahp.replace("</a>","</span></a>"); 
                                        } 
                                        bodyParagrahp=bodyParagrahp;
                               
                               if((bodyParagrahp.contains("<div")) && (bodyParagrahp.contains("background:#eee;border:1px"))){                                                 
                                      
                                        bodyParagrahp=bodyParagrahp.replace("<div","<div class='destacado'");
                                         } 
  				           bodyParagrahp=bodyParagrahp; 
  			        if((bodyParagrahp.contains("destacado")) && (bodyParagrahp.contains("<b>"))){                                                 
                                      
                                        bodyParagrahp=bodyParagrahp.replace("<b>","<h3>");
                                         } 
  				           bodyParagrahp=bodyParagrahp; 
  				if((bodyParagrahp.contains("destacado")) && (bodyParagrahp.contains("</b>"))){                                                 
                                      
                                        bodyParagrahp=bodyParagrahp.replace("</b>","</h3><p>");
                                         } 
  				           bodyParagrahp=bodyParagrahp; 		   
                               if(bodyParagrahp.contains("<p")){                                  
                                            bodyParagrahp=bodyParagrahp.replace("<p","<div class='aside'></div><p"); 
                                       } 
                                        bodyParagrahp=bodyParagrahp; 
                               if((bodyParagrahp.contains("destacado")) && (bodyParagrahp.contains("<p"))){                                                 
                                      
                                        bodyParagrahp=bodyParagrahp.replace("<div class='aside'></div><p","<p");
                                         } 
  				           bodyParagrahp=bodyParagrahp; 	                               
                            
                               if((bodyParagrahp.contains("<p")) && (bodyParagrahp.contains("style='text-align:center'>"))){                     
                                        bodyParagrahp=bodyParagrahp.replace("<p style='text-align:center'> ","<p style='margin: 10px 200px'>");
                                       } 
                                        bodyParagrahp=bodyParagrahp;
                               
                               if((bodyParagrahp.contains("blockquote")) && (bodyParagrahp.contains("twitter-tweet"))){                     
                                        bodyParagrahp=bodyParagrahp.replace("<blockquote","<div class='picture-twitter'><blockquote");
                                       } 
                                        bodyParagrahp=bodyParagrahp;
                                               
   			       if(bodyParagrahp.contains("</blockquote>")){                             
                                        bodyParagrahp=bodyParagrahp.replace("</blockquote>","</blockquote></div>");
                                       } 
                                        bodyParagrahp=bodyParagrahp;
                               
                                if((bodyParagrahp.contains("</blockquote>")) && (bodyParagrahp.contains("</div>"))){   
                                        bodyParagrahp=bodyParagrahp.replace("<div class='aside'></div>","");
                                        } 
                                        bodyParagrahp=bodyParagrahp;
                                if((bodyParagrahp.contains("destacado")) && (bodyParagrahp.contains("</div>"))){   
                                        bodyParagrahp=bodyParagrahp.replace("</div>","</div><div class='aside'></div>");
                                        } 
                                        bodyParagrahp=bodyParagrahp;  
                                        
                               if((bodyParagrahp.contains("<iframe ")) && (bodyParagrahp.contains("youtube"))){ 
                                        bodyParagrahp=bodyParagrahp.replace("height="," class='picture-youtube' id='picture' height=");										 	 	
                                        String[] cortos= bodyParagrahp.split(" ");
                                              for (int i = 0; i < cortos.length; i++) {
                                                     if (cortos[i].contains( "height=")) {
                                                                cortos[i]="height='400px'";
                                                         }
                                         	     if (cortos[i].contains( "width=")) {
                                                                 cortos[i]="width='630px'></iframe></p>";
                                                          }
                                                                bodyPa=bodyPa+" "+ cortos[i];
                                                          }
                                                        bodyParagrahp=bodyPa;
                                } 
                                                                                                        
                                bodyParagrahp=bodyParagrahp; 
                              
                                if((bodyParagrahp.contains("video0_wrapper"))){   
                                        bodyParagrahp=bodyParagrahp.replace("100%","65%");                                       
                                        } 
                                        
                                        bodyParagrahp=bodyParagrahp; 
                                if((bodyParagrahp.contains("<figure")) && (bodyParagrahp.contains("image"))){   
                                        bodyParagrahp=bodyParagrahp.replace("<figure","<div");
                                        bodyParagrahp=bodyParagrahp.replace("image","imagen");                         
                                        } 
                                        bodyParagrahp=bodyParagrahp;
                                if((bodyParagrahp.contains("destacado")) && (bodyParagrahp.contains("imagen"))){   
                                            bodyParagrahp=bodyParagrahp.replace("imagen","img");                         
                                        } 
                                        bodyParagrahp=bodyParagrahp;        
                                 if((bodyParagrahp.contains("</figure>"))){   
                                        bodyParagrahp=bodyParagrahp.replace("</figure>","</div>");                                       
                                        } 
                                        
                                        bodyParagrahp=bodyParagrahp;  
                                 
                                 if((bodyParagrahp.contains("<figcaption></figcaption>"))){   
                                        bodyParagrahp=bodyParagrahp.replace("<figcaption></figcaption>","");                                       
                                        } 
                                        
                                   bodyParagrahp=bodyParagrahp;  
                                    if((bodyParagrahp.contains("<img"))){   
                                        bodyParagrahp=bodyParagrahp.replace("<img","<img id='picture'");                                       
                                        }                                  
                                   bodyParagrahp=bodyParagrahp;  
                                   if((bodyParagrahp.contains("text-align:center"))){   
                                        bodyParagrahp=bodyParagrahp.replace("text-align:center","");                                       
                                        }                                        
                                   bodyParagrahp=bodyParagrahp;                                    
                                %>
                                <%=bodyParagrahp%>                               
                                      </nt:conditional-exclude>                             
                               </nt:body-splitter>
                           </div>  
                                     
                                                 
                         <!-- End del Texto Enriquesido se excluye el Primer Parrofo -->  
<!-- Box Video -->              
<cms:include page="../elements/TS_Article_WebSpecial_Page_Video.jsp"></cms:include>
<!-- Fin Box Video -->        
<!-- Box Fotos -->                     
<cms:include page="../elements/TS_Article_WebSpecial_Page_Photo.jsp"></cms:include>
<!-- Fin Box Fotos -->
<!--Attachments-->                
<cms:include page="../elements/TS_Article_WebSpecial_Attachments.jsp"/>                
<!-- Fin Attachments --> 
<!--Relation-->	
<cms:include page="../elements/TS_Article_WebSpecial_Relation.jsp"/>
<!-- Fin Relation -->  
				<!--valoraciones-->
				  <div class="valorarNews">
				                <a title="Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
				                    <cms:img src="/arte/simegusta.jpg" alt="Me Gusta" title="Me Gusta" /> <span><nt:news-positive-valorations allowvaloration="true" /></span>
				                </a> 
				
				                <a title="No Me Gusta" onclick="makeVoteExterior(this)" style="cursor:pointer;">
				                    <cms:img src="/arte/nomegusta.jpg" style="top:7px" alt="No Me Gusta" title="No Me Gusta" /> <span><nt:news-negative-valorations allowvaloration="true" /></span>
				                </a>                              
				            </div>
				             <div id="container">
				                  <div class="wrapper">
				                    <cms:include page="../elements/TS_Article_Comments.jsp" />
				                </div>
				            </div>
				<!--fin de valoraciones-->
				
				<div class="sharemob">											
				<cms:include page="../elements/TS_Common_redes_mobile.jsp" >
				<cms:param name="link"><nt:link/></cms:param>
				<cms:param name="titulo"><nt:title value="detail" /></cms:param>
				</cms:include>	
			</div>




<!--ESPECIALES-->
</br> </br>
<h7>Specials</h7>
<div class="margensep"></div>
<div class="margensep separador"></div>	           
<cms:include page="../elements/TS_Article_WebSpecial_News_List.jsp"/>
<div class="banners pos1"></div><!-- banners posicion 1 -->
</div>
</section>
</nt:news>
<cms:include page="../elements/TS_Common_Footer.jsp" />
</body>
</html>                                                     