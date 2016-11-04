<%@ include file="TS_Common_Libraries.jsp" %>
<%
	org.opencms.jsp.CmsJspActionElement cmsO = new CmsJspActionElement(pageContext, request, response);
	Boolean isProjectOnline = cmsO.getCmsObject().getRequestContext().currentProject().isOnlineProject();
	String index = "TS_NEWS_ONLINE_EN"; 
	if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";
%>

<%-- publication="9" --%>
<nt:news-list order="priority desc,user-modification-date desc" publication="9" onmainpage="home" zone="agenda_header" size="4" searchindex="<%=index%>">

	<nt:conditional-include onposition="1">
		<div class="diaryHead">
			<div class="wrap">
				<div class="agendaHome">
					<a href="/english/section/telesur_agenda/" class="agendaSeccion"/><strong>In Depth</strong></a>
					
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
					<li><a title="facebook" target="_blank" href="https://www.facebook.com/telesurenglish"><cms:img src="/arte/redes/facebook.png" scaleType="2" alt="facebook" /></a></li>
					<li><a title="twitter" target="_blank" href="https://twitter.com/telesurenglish"><cms:img src="/arte/redes/twitter.png" scaleType="2" alt="twitter" /></a></li>
					<li><a title="Google Plus" target="_blank" href="https://plus.google.com/111711418326585120017/posts"><cms:img src="/arte/redes/gplus.png" scaleType="2" alt="Google Plus" /></a></li>
					<li><a title="Instagram" target="_blank" href="http://instagram.com/telesurenglish"><cms:img src="/arte/redes/instagram.png" scaleType="2" alt="Instagram" /></a></li>
					<li><a title="Pinteres" target="_blank" href="http://www.pinterest.com/TeleSUReng/"><cms:img src="/arte/redes/pinterest.png" scaleType="2" alt="Pinterest" /></a></li>
					<li><a title="YouTube" target="_blank" href="https://www.youtube.com/user/telesurenglish"><cms:img src="/arte/redes/youtube.png" scaleType="2" alt="YouTube" /></a></li>
				</ul>
			</div>
		</div>
	</nt:conditional-include>
	
</nt:news-list>