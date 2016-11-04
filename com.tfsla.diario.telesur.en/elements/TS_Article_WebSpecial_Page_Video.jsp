<%@ include file="TS_Common_Libraries.jsp" %> 
<% String width = "800" ;
String height = "449" ;
int contadorVideo = 1;
int contadorT = 0;
%>
<nt:news>
<!-- Inicio Caso 1: Solo un Video incluido en la Nota --> 
     
    <nt:conditional-include oncondition="${news.videoscount == 1 }">
     <h7>&nbsp;</h7> 
         <div class="boxEspecial fotos" id="espVideos">     
             <div class="aside"> 
             <div class="margensep"></div>
              </br></br><h7>Video</h7>                 	
                <nt:conditional-include oncondition="${news.videosyoutubecount > 0}"> 
                 <nt:video-youtube>   
                    <span><nt:video-title/></span>                    
                </nt:video-youtube> 
                </nt:conditional-include> 
                 <nt:conditional-include oncondition="${news.videosembeddedcount > 0}">
                 <nt:video-embedded> 
                 	<span><nt:video-title/></span> 
                 </nt:video-embedded>   
                 </nt:conditional-include>
             </div>                 
            </div>
            <div class="fotoEspecial">  
                    <ul>           
                        <c:set var="videopath" value="" />                                                                      
                        <nt:video-flash>                                
                            <div class="wpImgNA">
                                <c:set var="videopath"><nt:video-path/>,<nt:video-thumbnail/>,<nt:video-title/></c:set>
                                <meta itemprop="name" content='<nt:video-title/>' />
                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                <meta itemprop="thumbnailUrl" content="<nt:video-thumbnail/>" />
                                <meta itemprop="contentURL" content="<nt:video-path/>" />
                                <meta itemprop="keywords" content="<nt:video-tags/>" /> 
                                <meta itemprop="duration" content="<nt:video-duration/>" />
                                <meta itemprop="bitrate" content="<nt:video-bitrate/>" />                       
                                <cms:include page="TS_Common_VideoFlash.jsp">
                                    <cms:param name="video">${videopath}</cms:param>
                                    <cms:param name="imagen"><nt:video-thumbnail/></cms:param>
                                    <cms:param name="titulo"><nt:video-title/></cms:param>
                                    <cms:param name="width" value="100%"/>
                                    <cms:param name="height" value="<%=height %>"/>
                                </cms:include>
                            </div>                                
                        </nt:video-flash>         
                        <nt:video-youtube>                               
                            <div class="wpImgNA">
                                <meta itemprop="name" content='<nt:video-title/>' />
                                <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                <meta itemprop="thumbnailUrl" content="//i1.ytimg.com/vi/<nt:video-youtubeid/>/hqdefault.jpg" />
                                <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                <iframe id="player<%=contadorVideo%>" class="iframeYT" width="82%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                                <% contadorVideo++; %>                       
                           </div>                                
                        </nt:video-youtube>        
                        <nt:video-embedded>                               
                            <div class="wpImgNA">
                                <meta itemprop="name" content='<nt:video-title/>' />
                                <nt:video-code />     
                            </div>                                
                        </nt:video-embedded>
                    </ul>
                </div>
            
        
    </nt:conditional-include>
 <!-- Fin Caso 1: Solo un Video incluido en la Nota --> 
 <!-- Inicio Caso 2: A Partir de Dos Videos incluido en la Nota Pueden tener N cantidad de videos la Nota. N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->  
    <nt:conditional-include oncondition="${news.videoscount > 1 }"><div class="margensep"></div>         
        <h7>Videos</h7> 
        <div class="margensep"></div>                      
        <div class="block videos" id="espVideos"> 
            <c:set var="videopath" value="" />  
            <nt:conditional-include oncondition="${news.videosyoutubecount > 0}">          
                <nt:video-youtube>
                    <article class="important" id="<%= contadorVideo %>">                             
                        <div class="wpVid ">                               
                            <meta itemprop="name" content='<nt:video-title/>' />
                            <meta itemprop="publisher" content="<nt:video-publisher/>" />
                            <meta itemprop="thumbnailUrl" content="//i.ytimg.com/vi/<nt:video-youtubeid/>/mqdefault.jpg" />                                                        
                            <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                            <iframe id="player<%=contadorVideo%>" class="iframeYT" width="100%" height="<%=height %>" src="//www.youtube.com/embed/<nt:video-youtubeid/>?enablejsapi=1&version=3&playerapiid=player<%=contadorVideo%>" frameborder="0" allowfullscreen> </iframe>
                            <% contadorVideo++; %>                                                                        
                        </div> 
                        <hgroup  id="VideohGroup">                                                          				
                            <h3><a href="#videos1"><nt:video-title/></a></h3>
                        </hgroup>
                    </article>
                </nt:video-youtube>                          
            </nt:conditional-include>                                                                     
            <nt:conditional-include oncondition="${news.videosembeddedcount > 0}">  
                <nt:video-embedded> 
                    <article class="important" id="<%= contadorVideo %>">                                       
                        <div class="wpVid">
                            <meta itemprop="name" content='<nt:video-title/>' />
                            <nt:video-code />
                            <% contadorVideo++; %>  
                        </div> 
                        <hgroup  id="VideohGroup">                                                          				
                            <h3><a href="#videos1"><nt:video-title/></a></h3>
                        </hgroup>
                    </article>                                      
                </nt:video-embedded>
            </nt:conditional-include>
            <div class="aside">
        <div class="noteSpecial">               
                <ul class="idTabs">
                 <div  class='' style="width:320px; height:480px; overflow-x:hidden; overflow-y:auto;">
                        <li>
                        <nt:conditional-include oncondition="${news.videosyoutubecount > 0}"> 
                            <nt:video-youtube>  
                                <article class="sideNew">           	          	
                                    <div class="wpSmallImg">     
                                        <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">
                                            <meta itemprop="name" content='<nt:video-title/>' />
                                            <meta itemprop="publisher" content="<nt:video-publisher/>" />
                                            <meta itemprop="thumbnailUrl" content="//i.ytimg.com/vi/<nt:video-youtubeid/>/mqdefault.jpg" />
                                            <meta itemprop="duration" content="<nt:video-duration/>" />                                            					
                                            <meta itemprop="contentURL" content="http://www.youtube.com/v/<nt:video-youtubeid/>" />
                                            <!--Se aplica las mejores practicas de imagenes -->  	
                                            <img src="<cms:link>/arte/ico-play.png</cms:link>" alt="Telesur" class="icoPlay"></a>
                                             <!-- Se aplica las mejores practicas , no es necesario agregar tags para escalar las imagenes, ya que el tag de newstag lo hace automáticamente -->	 
                                            <img src="//i.ytimg.com/vi/<nt:video-youtubeid/>/mqdefault.jpg" alt="Telesur" height="82">
                                        </div>	
                                        <% contadorT ++; %>                                                                                     
                                    </div>                                                                  
                                    <div class="overflow">
                                        <c:set var="duracion" ><nt:video-duration/></c:set>                                      
                                        <h4><a href="#<%= contadorT %>" onclick="StopVideos();"><nt:video-title/></a></h4>                           
                                                           	                  
                                    </div>
                                </article>
                            </nt:video-youtube>
                        </nt:conditional-include>
                        <nt:conditional-include oncondition="${news.videosembeddedcount > 0}"> 
                            <nt:video-embedded>
                                <article class="sideNew">         	          	
                                    <div class="wpSmallImg">     
                                        <div itemprop="video" itemscope itemtype="http://schema.org/VideoObject">   
                                            <meta itemprop="name" content='<nt:video-title/>' />
                                             <!--Se aplica las mejores practicas imagenes-->                              
                                            <img src="<cms:link>/arte/ico-play.png</cms:link>" alt="Telesur" class="icoPlay"></a>
                                            <!-- Se aplica las mejores practicas , no es necesario agregar tags para escalar las imagenes, ya que el tag de newstag lo hace automáticamente -->					
                                            <img src='<nt:video-thumbnail scaletype="4"/>'  height="82" alt="Telesur"></a>      
                                        </div>
                                        <% contadorT ++; %>  
                                    </div>                                                                              
                                    <div class="overflow"> 
                                        <h4><a href="#<%= contadorT %>" onclick="StopVideos();"><nt:video-title/></a></h4>            
                                    </div>
                                </article>
                            </nt:video-embedded>
                        </nt:conditional-include>
                        </li>
                     </div> 
                </ul>          
           </div>
           </div>
        </div>
    </nt:conditional-include>
<!-- Fin Caso 2: A Partir de Dos Videos incluido en la Nota Pueden tener N cantidad de videos la Nota. N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->  
</nt:news>
<!-- Inicio Script: Stop de Videos -->  
<script type="text/javascript">
    $(window).load(function () {
        //error
        $('.prev, .next').removeAttr('style');
    });
    function StopVideos() {
        var YTid;
        $(".iframeYT").each(function () {
            YTid = $(this).attr("id");
            $('#' + YTid)[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');            
        });
      
    }

    $(document).ready(function () {
        $("body").on("click", ".flex-next,.flex-prev", function () {
            StopVideos();
        });
    });
</script>
<!-- Fin Script: Stop de Videos --> 