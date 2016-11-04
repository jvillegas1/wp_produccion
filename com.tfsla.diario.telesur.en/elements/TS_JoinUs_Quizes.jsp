<%@ include file="TS_Common_Libraries.jsp" %>

<% int cont = 0; 
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
Boolean isProjectOnline = cms.getCmsObject().getRequestContext().currentProject().isOnlineProject();
String index = "TS_NEWS_ONLINE_EN";	
if (!isProjectOnline) index = "TS_NEWS_OFFLINE_EN";

%>

<nt:news-list section="joinus" category="/SubSecciones/en/joinus/quizes/" searchindex="<%=index%>">
	<% cont++; %>
</nt:news-list>

<div class="rowInt">
	<div class="headers blue men clear">Quizes</div>
	<div class="cont">
		<% if (cont > 0) { %>
			<nt:news-list order="user-modification-date desc" section="joinus" category="/SubSecciones/en/joinus/quizes/" size="2" searchindex="<%=index%>">					
				<div class="multimedia">
					<div class="txt-quiz">
						<div class="multimedia-tit">
							<h4><nt:title/></h4>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div>
					</div> 
					
					<div class="btnMultimedia">			
						<a rel='<nt:iframe/>' id="masInfo" class="quiz" alt='<nt:title/>' title='<nt:title/>' style="cursor:pointer;">Take Quiz</a>
					</div>                          
				</div>			
			</nt:news-list>
		<% } else { %>
			<div class="multimedia">
				<div class="multimedia-tit"><h4>Currently we don't have Opinion stories. </h4></div>
			</div>
		<% } %>
	</div>
</div>