<%-- IMPORTANTE
     - Para previsualizar una noticia no puede usarse newstags 
     - Los elementos incluidos en este template tampoco pueden traer ningún dato de la noticia usando newstags
     - Este no es el template de nota, es vista previa, por lo que hay elementos de la nota que no deberían incluirse (Ej: comentarios, encuestas)
     - Este template abre como popup dentro del formulario de subí tu post, por lo tanto:
           + se deshabilitan los links
           + se sacan elementos js que pudieran interferir con las funciones js del formulario
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.jsp.CmsJspLoginBean,
	org.opencms.file.CmsUser,
	org.opencms.main.OpenCms,
	org.opencms.file.CmsObject,
	org.opencms.file.CmsFile,
	org.opencms.xml.content.CmsXmlContent,
	org.opencms.xml.content.CmsXmlContentFactory,
	org.opencms.xml.types.I_CmsXmlContentValue,
	java.util.Date,
	java.util.Iterator,
	java.util.List,
	java.util.ArrayList,
	java.text.SimpleDateFormat,
	com.tfsla.webusersposts.service.*,
	com.tfsla.webusersposts.common.*"
%>
<%
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
CmsObject cmso = cms.getCmsObject();

String idNoticia = request.getParameter("id");
Boolean preview = request.getParameter("preview") != null ? Boolean.parseBoolean(request.getParameter("preview")) : false;
if(idNoticia == null || idNoticia.trim().equals("")) {
	response.sendRedirect("/");
}
try {
	PostsService service = new PostsService();
	XmlUserPost post = service.getXmlPost(idNoticia, cmso);
	
	// List<String> fuentes = post.getSources();
	List<String> imagenes = post.getImages();
	List<String> embedded = post.getVideos();
	
	int multimediaItmes = embedded.size() + imagenes.size();
	int videos = embedded.size();
%>

<!-- ELEMENTOS QUE HACEN FUNCIONAR EL PREVIEW Y GENERAN LA CORRECTA VISUALIZACION-->
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/fonts/fonts.css</cms:link>" rel="stylesheet" type="text/css" />   
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/reset.css</cms:link>" rel="stylesheet" type="text/css" />
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/css.css</cms:link>" rel="stylesheet" type="text/css" /> 
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/vertical.css</cms:link>" rel="stylesheet" type="text/css" />
<link href="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/css/flexslider.css</cms:link>" rel="stylesheet"  type="text/css" media="screen" />
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/jquery.10.2.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/tabs.min.jquery.js</cms:link>"></script>
<script src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/slides.min.jquery.js</cms:link>"></script>
<script> 
$(function(){ 
	$("#slidesVid").slides({ 
		preload: true, 
		play: false, 
		generateNextPrev: true 
	}); 
}); 
$(function(){ 
	$("#slidesImg").slides({ 
		preload: true, 
		play: false, 
		generateNextPrev: true 
	}); 
}); 
$(function(){
        $("#slides").slides({
            preload: true,
            play: false,
            generateNextPrev: true
        });
    });
</script>
<!-- FIN -->

<!-- ELEMENTOS DE LA NOTICIA -->
<div class="cont">
	<div class="blue w80">
		<a class="her"><h1><%=post.getTitle()%></h1></a>
	</div>
	
	<% if(imagenes.size()>0 || videos>0 ){ %>
		<div class="bloque-multimedia repor clear">
			<% if(multimediaItmes>1){ %>
				<div class="cont-tabs">
					<ul class="idTabs"> 
						<% if( imagenes.size() > 1 || ( imagenes.size() == 1 && videos > 0 ) ) { %>
							<li class="fotos"><a href="#fotos" alt="Fotos" title="Fotos">FOTOS</a></li>
						<% } %>
						<% if( videos > 1 || ( videos == 1 && imagenes.size() > 0 ) ) { %>
							<li class="videos"><a href="#videos" alt="Videos" title="Videos">VIDEOS</a></li>
						<% } %>
					</ul>                     
				</div><!--tags-nota-int-->	
			<% } %>
								
			<% if(imagenes.size()>0){ %>
			<% int cantImg = 1; %>
				<div id="fotos">
					<div id="slidesImg">
                    				<div class="slides_container">
							<%
							Iterator it = imagenes.iterator();
							while(it.hasNext()){
							      String value = (String)it.next();
							      String ImgPath = cms.link(value+"?__scale=w:460,h:305,t:2");
							%> 
								<div><img src="<%=ImgPath%>" /></div>
							<% } %>						
							<%cantImg ++ ;%>
						</div>
					</div>
				</div>
			<% } %>
			
			<% int itemPosition = 1 ; %>
			<% if(videos > 0 ) { %>
				<div id="videos">
					<div id="slidesVid">
	            				<div class="slides_container">
	            				<% if(embedded.size()>0){ 
		            
					                Iterator it3 = embedded.iterator();
										  
							while(it3.hasNext()) {
								String videoE = (String)it3.next();
						%>	
					    			<div><%=videoE%></div>
					    			<% itemPosition++;%>
						<%
					    		 }  
					    	 }  
					    	 
					    	 for(String videoEmbedded : embedded) { 
							String imgVideo  = videoEmbedded;
							if(videoEmbedded.indexOf("http://www.youtube.com/embed/") > -1 ) {
							    String videoCode[] = videoEmbedded.split("www.youtube.com/embed/");
							    String videoThumbnail[] = videoCode[1].split("rel");
						%>
					     		<div>
							     	<object width="100%" height="305">
									<param name="movie" value="http://www.youtube.com/v/<%=videoThumbnail%>?version=3&amp;color=orange&amp;modestbranding=1&amp;hl=es_MX&amp;rel=0">
									<param name="allowFullScreen" value="true">
									<param name="allowscriptaccess" value="always">
									<embed src="http://www.youtube.com/v/<%=videoThumbnail%>?version=3&amp;color=orange&amp;modestbranding=1amp;hl=es_MX&amp;rel=0" type="application/x-shockwave-flash" width="100%" height="305" allowscriptaccess="always" allowfullscreen="true">
								</object>
							</div>
						<%	
					     		}  	
						     	if(videoEmbedded.indexOf("player.vimeo.com/video/") > -1 ) {
								String videoCode[] = videoEmbedded.split("player.vimeo.com/video/");
								String videoThumbnail[] = videoCode[1].split("rel");
								imgVideo = "http://vimeo.com/api/v2/video/" + videoThumbnail[0].replaceAll("\\?","") + ".json"; 
								String idvideo = videoThumbnail[0].replaceAll("\\?","");
						%>
								<div>
								<script type="text/javascript">
									function vimeoLoadingThumb(id){    
										var url = "http://vimeo.com/api/v2/video/" + id + ".json?callback=showThumb";
										var id_img = "#vimeo-" + id;
										var script = document.createElement( 'script' );
										script.type = 'text/javascript';
										script.src = url;
										
										$(id_img).before(script);
									}
										
										
									function showThumb(data){
										var id_img = "#vimeo-" + data[0].id;
										$(id_img).attr('src',data[0].thumbnail_medium);
								}
								</script> 
							
								<span class="post-player"><i class="icon"></i></span>		
								<img id="vimeo-<%=idvideo %>" src="" alt="TITULO"  width="135" height="100" />							
								<script type="text/javascript">
								  vimeoLoadingThumb(<%=idvideo %>);
								</script>
								</div>
							<% } %>
						<% } %>
						</div>
					</div>
				</div>
			<% } %>
		</div>
	<% } %>
	<%--########### FIN GALERIAS ########### --%>
</div>
			
<div class="cont">
	<div class="txt_newworld">
		<%=post.getBody()%>
	</div>
	
	<%--########### INICIO PALABRAS CLAVES - NUBE DE TAGS ########### --%>
	<%
	String[] clavesArr = post.getKeywords().split(",");
	
	if(clavesArr.length > 0){
	%>
		<div class="tagBarNews">
			<h4>Tags</h4>
	<%	
			for(String c : clavesArr){ 
				out.println("<a class=\"tags\" title=\""+c+"\">"+c+"</a>");
			}
	%>					
		</div>
	<% } %>			
	<%--########### FIN PALABRAS CLAVES - NUBE DE TAGS ########### --%>
</div>
<!-- FIN -->
<script> 
$( window ).load(function() {
	// error
	$(".prev, .next").removeAttr("style"); 
});
</script> 

<%		
				
} catch (Exception e) {
	out.println("No se pudo recuperar la nota - e:" + e );
}
			
%>