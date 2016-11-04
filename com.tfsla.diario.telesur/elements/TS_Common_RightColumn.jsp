<%@ include file="TS_Common_Libraries.jsp"%>
<% 
   String template = (request.getParameter("template") != null ) ? request.getParameter("template") : "News";
   org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
   String uri = cms.getRequestContext().getUri();
%>

<div class="col-for"><!-- colmna izq col-for -->
	<div class="row clear">  
		<cms:include page="TS_Common_Blocks.jsp">
        		<cms:param name="template"><%=template %>_1</cms:param>
		</cms:include>	
	</div>
	
	
         	
	
		<%--<div class="row clear"> 
			<div class="bannersblog cont">
				<cms:include page="TS_Common_Banners.jsp">
					<cms:param name="template">Analysis</cms:param>
					<cms:param name="key">Advert-300x250-a</cms:param>
				</cms:include>
			</div>              
		</div>--%>
	
					
	<%--<% if (template.equals("Blog") || template.equals("SoyReportero")) { %>
	
		<div class="row clear"> 
			<div class="bannersblog cont">
				<cms:include page="TS_Common_Banners.jsp">
					<cms:param name="template"><%=template %></cms:param>
					<cms:param name="key">Advert-300x250-a</cms:param>
				</cms:include>
			</div>              
		</div>
	<% } else { %>	
		<div class="row clear"> 
			<div class="banners cont">
				<cms:include page="TS_Common_Banners.jsp">
					<cms:param name="template"><%=template %></cms:param>
					<cms:param name="key">Advert-300x250-b</cms:param>
				</cms:include>
			</div>              
		</div>
	<% } %> --%>

	<%
	   if(template.equals("NewsCategory") && uri.equals("/SubSecciones/news/sport/index.html") ){
	%>
	<div class="cont">	            	
        	<cms:include page="TS_Deportes_Starmedia_Ranking.jsp" />        		
     	</div>
	<!-- WIDGET DEPORTES 
	<div class="cont">	            	
        	<cms:include page="TS_Common_Widget_Deportes.jsp" />        		
     	</div>
     	-->
     	<%
     	   }	
     	%>
	<% if (!template.equals("BlogPage")) { %>	
	<div class="cont">	            	
        	<cms:include page="TS_Common_Blocks.jsp">
        		<cms:param name="template"><%=template %>_2</cms:param>
		</cms:include>	                           			
     	</div>
     	<% }  
     	%>
	<%--  <div class="row clear cont"> 
		<div class="col ">
			<div class="banners" style="float:left;">
				<cms:include page="TS_Common_Banners.jsp">
					<cms:param name="template"><%=template %></cms:param>
					<cms:param name="key">Show-Promotion-383x214</cms:param>
		  		</cms:include>
			</div>      
		</div>             
	</div>
	
	<div class="row clear cont"> 
		<div class="col ">
			<div class="banners" style="float:left;">
				<cms:include page="TS_Common_Banners.jsp">
					<cms:param name="template"><%=template %></cms:param>
					<cms:param name="key">Show-Promotion-380x400-a</cms:param>
		  		</cms:include>
			</div>      
		</div>             
	</div> --%>


	<div class="row clear"> 
		<div class="col">
			<cms:include page="TS_Common_Blocks.jsp">
	        		<cms:param name="template"><%=template %>_3</cms:param>
			</cms:include> 
		</div>             
	</div>     
	
	<%--<div class="row clear"> 
		<div class="banners cont">
			<cms:include page="TS_Common_Banners.jsp">
				<cms:param name="template"><%=template %></cms:param>
				<cms:param name="key">Advert-300x250-b</cms:param>
			</cms:include>
		</div>              
	</div> --%>
	
	<div class="row clear"> 
		<div class="col">
			<cms:include page="TS_Common_Blocks.jsp">
	        		<cms:param name="template"><%=template %>_4</cms:param>
			</cms:include> 
		</div>             
	</div> 
</div><!--colfor-->