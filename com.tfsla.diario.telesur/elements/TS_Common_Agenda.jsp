<%@ include file="TS_Common_Libraries.jsp" %>

<%
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 10);
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/system/categories/SubSecciones/multimedia/webspecial/";
%>

<%	
	org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	
	Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = (isProjectOnline) ? "TS_NEWS_ONLINE" : "TS_NEWS_OFFLINE" ;

	String rootPath = request.getScheme() + "://" + request.getServerName();
%>
				                                                              
				                                                             
<style type="text/css">
/*Definimos una clase para <ul> */
ul.columnas {
Float: left;
width: 100%; 
List-style-type: none; 
}

ul.columnas li{
Display:inline; 
Float: left;
Width:50%;} 

</style>

<div class="rowInt">
	<div class="headers redside topicsNews">En Profundidad y Especiales</div>
	<div class="contagend topicsNews">
		<nt:news-list searchindex="<%=index%>" order="user-modification-date desc" size="6" category="/SubSecciones/news/agenda/" >		     
			<div class="col-mid">
				<div class="cont">
					<nt:preview-image>
						<img src="<nt:image-path width="159" height="104" scaletype="2"/>" alt='<nt:image-description/>' title='<nt:image-description/>' longdesc="#"/>
					</nt:preview-image>
					<div class="captionMin">
						<a href="<nt:link/>" title="<nt:title/>" class="her"><h6><nt:title/></h6></a>
					</div>
				</div>
			</div>
		</nt:news-list>
		<!--<iframe src="" width="100%" height="200" frameborder="0" scrolling="no"></iframe>-->

		<!--///////Agenda y Especiales////////////-->
		
		<div class=" listhead cont">
			<ul class="columnas"> 
				<li class="forum2">
					<b>Especiales</b>
				</li>
			</ul>
			<ul class="columnas"> 
				
				<nt:news-list order="user-modification-date" section="multimedia"  category="<%=categoryPath%>"  size="10">   
					<li class="forum2">                                                                 
						<div class="caption">  
							<a href="<nt:link/>" class="her" title="<nt:title value="home"/> " TARGET="_blank"><nt:title value="home"/>
							</a>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div>
					</li>   
				</nt:news-list>  
			</ul>
		</div>
	</div>
</div>
       