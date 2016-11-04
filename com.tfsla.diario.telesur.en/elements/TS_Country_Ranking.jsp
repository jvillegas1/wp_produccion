<%@ include file="TS_Common_Libraries.jsp" %>
<%   
org.opencms.jsp.CmsJspXmlContentBean cms = new
org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
 
String category = cms.property("subSeccion");
int contNotaU = 0;
int contNotaS = 0;
int contNotaR = 0;
%>
<div class="desktop">
	<div class="cont-tab">
		<ul class="idTabs newtabw">
			<div class="tabnew">
				<li><a href="#Latest" alt="Latest" title="Latest">Latest</a></li>
				<li><a href="#MostRead" alt="Most read" title="Most read">Most read</a></li>
				<li><a href="#MostShared" alt="Most share" title="Most share">Most share</a></li>
			</div>
		</ul>
	</div>
	<div id="Latest">	          	
	        <ul>
	        	<nt:news-list order="user-modification-date desc" size="10" category="<%=category%>" publication="9">
	        		<%contNotaU++;%>			    		
	            		<li class="forum3"><a href="<nt:link/>" class="her" alt="<nt:title value="home"/>" title="<nt:title value="home"/>"><nt:title value="home"/></a></li>           		
			</nt:news-list>
			<% if (contNotaU == 0) { %>
				<div class="forum">At the moment there are no notes of "Latest". </div>
			<% } %>	
	        </ul>
	</div>	 
	<div id="MostRead">	          	
		<ul>
		 	<nt:news-list order="most-read" size="10" category="<%=category%>" publication="9">
		 		<%contNotaS++;%>			
		   		<li class="forum3"><a href="<nt:link/>" class="her" alt="<nt:title value="home"/>" title="<nt:title value="home"/>"><nt:title value="home"/></a></li>
			</nt:news-list>
			<% if (contNotaS == 0) { %>
				<div class="forum">At the moment there are no notes of " Most Read". </div>
			<% } %>	
		</ul>
	</div>
	<div id="MostShared">	          	
	       <ul>
	            	<nt:news-list order="most-positive-evaluations" size="10" from="7d" age="7d" category="<%=category%>" publication="9">
	            		<%contNotaR++;%>		
	            		<li class="forum3"><a href="<nt:link/>" class="her" alt="<nt:title value="home"/>" title="<nt:title value="home"/>"><nt:title value="home"/></a></li>
			</nt:news-list>
			<% if (contNotaR == 0) { %>
				<div class="forum">At the moment there are no notes of "Most Share".</div>
			<% } %>	
	        </ul>
	</div>
</div>