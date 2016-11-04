<%@ include file="TS_Common_Libraries.jsp" %>

<% String template = (request.getParameter("template") != null ) ? request.getParameter("template") : "News"; %>

<div class="col-for"><!-- colmna izq col-for -->
	<div class="row clear">  
		<cms:include page="TS_Common_Blocks.jsp">
        		<cms:param name="template"><%=template %>_1</cms:param>
		</cms:include>	
	</div>	
	

	<%--	<div class="row clear"> 
			<div class="bannersblog cont">
				<cms:include page="TS_Common_Banners.jsp">
					<cms:param name="template">Analysis</cms:param>
					<cms:param name="key">Advert-300x250-a</cms:param>
				</cms:include>
			</div>              
		</div>  --%>
	
	
	<%-- if (template.equals("BlogPage") || template.equals("Blog") || template.equals("SoyReportero") || template.equals("SoyReporteroPage") || template.equals("AnalisisPage")) { %>
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
	<% } --%>

	<div class="cont">	            	
        	<cms:include page="TS_Common_Blocks.jsp">
        		<cms:param name="template"><%=template %>_2</cms:param>
		</cms:include>	                           			
     	</div>

	<%-- <div class="row clear cont"> 
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
	</div>--%>
	
	<div class="row clear"> 
		<div class="col">
			<cms:include page="TS_Common_Blocks.jsp">
	        		<cms:param name="template"><%=template %>_4</cms:param>
			</cms:include> 
		</div>             
	</div> 
</div><!--colfor-->