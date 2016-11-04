<%-- 
    Document   : newjsp
    Created on : 10/11/2014, 11:02:02 AM
    Author     : ysanchez
--%>     
<script language="JavaScript">
    function seleccionar() {
        document.getElementById("myDIV2").style.display = "block";
        document.getElementById("close").style.display = "block";
        document.datos.texto.focus();
	document.datos.texto.select();

    }
	    
    function closeVentana(){
	document.getElementById("myDIV2").style.display = "none";
	document.getElementById("close").style.display = "none";

    }
	</script>

<%@ include file="TS_Common_Libraries.jsp" %>


<nt:news>
    <% String width = "300" ;
    String height = "300" ;
    int contadorFoto = 0;
    int contadorVideo = 0;
    %>
    <nt:conditional-include oncondition="${news.sectionname == 'imreporter'}">
    <%  
    width = "540" ; 
    height = "304" ; 
    %>
    </nt:conditional-include>
	<nt:categories>
		<c:set var="categoriDescription" scope="page"><nt:category-description/></c:set>
	</nt:categories>
    <nt:conditional-include oncondition="${news.imagescount == 0 && news.videoscount == 0}">
        <div id="fotos">

                    <div class="wpImgNA1">
                        <nt:preview-image>
                            <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">             
                                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                                <c:set var="image" scope="page"><cms:link>wp.telesurtv.net<nt:image-path width="<%=width %>" height="<%=height %>" scaletype='2'/></cms:link></c:set>
                                <c:set var="imagaudio" scope="page"><cms:link><nt:image-path width="<%=width %>" height="<%=height %>" scaletype='2'/></cms:link></c:set>
                                <nt:conditional-include oncondition="${imageDescription != ''}">    
                                    <img itemprop="contentURL" src="<nt:image-path width="<%=width %>" height="<%=height %>" scaletype='2'/>"  alt='<nt:image-description/>' title='<nt:image-description/>'>
                                    <div class="caption" content='<nt:image-description/>'>
                                      
                                    </div>
                                </nt:conditional-include>
                                <nt:conditional-include oncondition="${imageDescription == ''}">
                                    <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                                        <img itemprop="contentURL" src="<nt:image-path width="<%=width %>" height="<%=height %>" scaletype='2'/>" alt='${news.titles[news.titleDetailNum]}' title='${news.titles[news.titleDetailNum]}'>
                                </nt:conditional-include>   
                            </div>
                              </nt:preview-image> 
				<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">			
				    <cms:img src="/arte/sinFoto_420x260.jpg" width="<%=width %>" height="<%=height %>" alt="<nt:title value='home' scaletype='2'/>"  />
				</nt:conditional-include> 
                    </div>
                    <div class="wpDataNA">
                    
                        <span class="breadcrumb">
                            <strong>
                                <span class="itacaput" itemprop="articleSection">   
                                                         <div class="blue">
                            <nt:news>  <img  class="play" itemprop="contentURL" src="/arte/play.png"  width="50" height="50" alt='' title='' >   <a class="her"><h1 class="hc1" itemprop="name headline"><nt:title value="detail"/></h1></a>	</nt:news>
                                 							
                                </div>           
                                </span>
                            </strong>
                        </span>
                        <span class="audioDate">
                            <nt:conditional-include oncondition="${news.hideTime == 'false'}">
                                <div class="capdate" itemprop="datePublished">
                                    <fmt:setLocale value="en_US"/>
                                    <fmt:formatDate pattern="d MMMM yyyy" value="${news.lastModificationDate}" />
                                    </div>
                            </nt:conditional-include>
                        </span>
                        <div id="Audio"></div>
                         					<nt:news>
                                   	 <nt:audio>          
					                                    					                         
						<span class="breadcrumb"><span class="itacaputi" itemprop="articleSection">   <nt:audio-title/></span></span>
						

                        <div class="redesi">
                       		<!-- Go to www.addthis.com/dashboard to customize your tools -->
				<div class="addthis_sharing_toolbox"></div>
                       		
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d8a3fe30014e2d" async="async"></script>
				<script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
			    	<script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>

                       		
                       		<%-- <cms:include page="../elements/TS_Common_AddThis.jsp" >
                                        <cms:param name="link"><nt:link/></cms:param> 
                                        <cms:param name="titulo"><nt:title value="section"/></cms:param>       
                                    </cms:include> --%>
                        
                        					</nt:audio>
				   </nt:news>
				  
                        </div>
                                    <nt:tags-list separator=",">
                                        <nt:conditional-include onposition="1">
                                         <c:set var="tag" scope="page"><nt:tags-item/></c:set>
                                        </nt:conditional-include>
                                    <form class="tagform" action="/english/section/audio/index.html" method="post">
                                    <input  type="hidden" name="search_form" value="<nt:tags-item/>">
                                    <button class="btna btn-tag" type="submit" alt="<nt:tags-item/>" title="<nt:tags-item/>" itemprop="title"><nt:tags-item/></button>
                                    </form>			                    

                                        <nt:conditional-include onposition="last">
                                           						
                                        </nt:conditional-include>
                                    </nt:tags-list >                 
                    </div>
                     <nt:audio> 
                                     <script>
				function get_short_url(long_url, login, api_key, func)
				{
				    $.getJSON(
				        "http://api.bitly.com/v3/shorten?callback=?", 
				        { 
				            "format": "json",
				            "apiKey": api_key,
				            "login": login,
				            "longUrl": long_url
				        },
				        function(response)
				        {
				            func(response.data.url);
				        }
				    );
				}

				var login = "telesur";
				var api_key = "R_8925c37a76786f9a5620d8c3f0f9e65c";
				var long_url = "http://www.telesurtv.net${imagaudio}";
				
				get_short_url(long_url, login, api_key, function(short_url) {				 
				    document.getElementById('myDIV2').value = '<iframe frameborder="0" height="180" scrolling="auto" src="http://www.telesurtv.net/seccion/audio/audio/index.html?audio=http://www.telesurtv.net<nt:audio-path/>&imagen='+short_url+'&titulo=${news.titles[news.titleDetailNum]}&category=${categoriDescription}" width="100%"></iframe>'
				});
				</script>
	                    <div class="embed">
	                      	    <div class="cerrar" id="close" style="display:none;"><a href="javascript:closeVentana();">X</a></div> 
	                      	 
	                      	    <c:set var="codigoEmbed" scope="page"> <iframe frameborder='0' height='180' scrolling='auto' src='' width='100%'></iframe></c:set>
		                   
				
		                    <form name="datos">
					<input type="text" id="myDIV2" class="codeEmbed" name="texto" size="40" maxlength="256" value="${codigoEmbed}" style="display:none;">
				    </form>
			           <input  type="button" class="btn-embed" value="</> Embed" onClick="seleccionar();">
			           <a href="<nt:audio-path/>" target="_blank" download="teleSUR-Audio.mp3"  class="btn-embed" role="button" title="Download"> Download</a>
				<a class="btn-rss" target="_blank" href="/english/rss/podcasting/Rss_Programs.xml?prog=${tag}">Subscribe </a>
		           </div>
	           </nt:audio>  

        </div>
    </nt:conditional-include>                           
</nt:news>