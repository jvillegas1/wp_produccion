<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE";
%>

<%-- publication="8"--%>
<nt:news-list order="priority desc,user-modification-date desc" publication="8" onmainpage="home" zone="agenda_header" size="4" searchindex="<%=index%>" >

	<nt:conditional-include onposition="1">
		<div class="diaryHead">
		
			<div class="wrap">			
			<div class="agendaHome">
			<a href="/seccion/telesur_agenda" class="agendaSeccion"/> <strong>En Profundidad</strong> </a>
					
			<div class="agendaTit">
			</nt:conditional-include>   				
        		<%-- itemtype="http://schema.org/Article"--%>
        		<a itemprop="name headline" href="<nt:link/>" title="<nt:title value='home'/>">
        		<nt:title value='home'/>
        		</a>	                	
                	<%--<nt:edit-buttons hasNew="true" hasDelete="true"/>               	
                	<div itemprop="sameAs url" style="display:none"><nt:link/></div>--%>
	              		
	<nt:conditional-include onposition="last">
				</div>
				</div>
				<ul class="redes">
					<li><a title="facebook" target="_blank" href="http://facebook.com/teleSUR"><cms:img src="/arte/redes/facebook.png" scaleType="2" alt="facebook" /></a></li>
					<li><a title="twitter" target="_blank" href="http://twitter.com/teleSURtv"><cms:img src="/arte/redes/twitter.png" scaleType="2" alt="twitter" /></a></li>
					<li><a title="Google Plus" target="_blank" href="https://plus.google.com/118206615613074383260/posts"><cms:img src="/arte/redes/gplus.png" scaleType="2" alt="Google Plus" /></a></li>
					<li><a title="Instagram" target="_blank" href="http://instagram.com/telesurtv"><cms:img src="/arte/redes/instagram.png" scaleType="2" alt="Instagram" /></a></li>
					<li><a title="Pinteres" target="_blank" href="http://www.pinterest.com/telesurtv/"><cms:img src="/arte/redes/pinterest.png" scaleType="2" alt="Pinteres" /></a></li>
					<li><a title="YouTube" href="https://www.youtube.com/user/telesurtv"><cms:img src="/arte/redes/youtube.png" scaleType="2" alt="YouTube" /></a></li>
					<li><a title="Paper.li" href="http://paper.li/~/publisher/1e8f8470-82e8-012f-25ad-12313d16b843"><cms:img src="/arte/redes/paperli.png" scaleType="2" alt="Paper.li" /></a></li>
					
				</ul>
			</div>
		</div>
	</nt:conditional-include>
	
</nt:news-list>