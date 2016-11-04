<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<%
//Recibo los valores de una redireccion por ejemplo: /personas/personName-personId

String personName = (request.getParameter("personName") != null ) ? request.getParameter("personName") : "" ;
String personId = (request.getParameter("personId") != null ) ? request.getParameter("personId") : "" ;

//nombre sin guiones para mostrar en los carteles
String personFriendly = personName.replace("-", " ");
%>
<%--
<%=personId%>
<%=personName%>
--%>
<div class="row clear">		
	<nt:person personid="<%=personId%>">			
		<div class="cont"> 

			<h9 class="h2p"><nt:person-name/></h9><br>
		<div class="contPers">              
		        <div class="col-qua"> 
		    		<div class="imapers">
				<figure class="entry-media clearfix">
					<c:set var="personImage" scope="page"><nt:person-image/></c:set>
					<nt:conditional-include oncondition="${personImage != ''}">
						<a><img src="<nt:person-image width='120' height='120' scaletype='2'/>" alt="<nt:person-name/>" title="<nt:person-name/>" width="120" height="120" /></a>
					</nt:conditional-include>
					<nt:conditional-include oncondition="${personImage == ''}">
						<a><img src="/arte/perfil_user.jpg" alt="<nt:person-name/>" title="<nt:person-name/>" width="120" height="120" scaleType="2"/></a>
					</nt:conditional-include>
				</figure>                	
		       		</div>
		      	</div>	 
		       	
			<div class="datasearch">
		    		<nt:conditional-include oncondition="${persona.shortdescription != ''}">
		                 	<h2 class="h3p"><nt:person-shortdescription/></h2>  
		        	</nt:conditional-include>
		       	</div>    
		       	   
		     	<div class="col-3qua">         
		          	<nt:conditional-include oncondition="${persona.longdescription != ''}">	
					<h2 class="h3p"><nt:person-longdescription/></h2>
				</nt:conditional-include>
			</div>    
		</div>
		</div>
</nt:person> 
</div>


<%-- Noticias relacionadas a Persona--%>

<div class="row clear">	
	<div class="cont">
		<div class="titlereg">New of <strong> <%=personFriendly%></div>
	
	<div class="noResultado" style="display:none">
		<h2 class="noResul">No se encontraronos...</h2>
	</div>
								
	<div class="ressearch" itemscope itemtype="http://schema.org/Article">
		<ul>
		<nt:news-list order="user-modification-date desc" size="4" persons="<%=personName%>" publication="9" state="publicada">
				
		<c:set var="videoscount" scope="page">${news.videoscount}</c:set>
                <jsp:useBean id="videoscount" type="java.lang.String" /> 
				
		<li>	
			<div class="imgsearch" itemscope itemtype="http://schema.org/ImageObject">
				<a href="${news.link}" class="her" alt='<nt:title value="home"/>'>
					<nt:preview-image>	
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
								<nt:conditional-include oncondition="${imageDescription != ''}">
									<meta itemprop="description" content='<nt:image-description/>'>	
									<img itemprop="contentURL" src="<nt:image-path width="170" height="105" scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' >
								</nt:conditional-include>
								<nt:conditional-include oncondition="${imageDescription == ''}">
									<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>	
									<img itemprop="contentURL" src="<nt:image-path width="170" height="105" scaletype='2'/>" alt='${news.titles[news.titleSectionNum]}' title='${fn:escapeXml(news.title)}' >
								</nt:conditional-include>
					</nt:preview-image>												
					<nt:conditional-exclude oncondition="${news.imagepreviewset}">
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<cms:img src="/arte/sinFoto_170x105.jpg" width="170" height="105" alt='${fn:escapeXml(news.title)}' title='${fn:escapeXml(news.title)}' />
					</nt:conditional-exclude>
				</a>
			</div>	
			
			<div class="txtsearch1">
			
				<div class="datesearch">
                            		<p class="fechasearch" itemprop='datePublished'> <nt:last-modified format="dd/MM/yyyy" type="descriptive" /></p>
                            		<% if(!videoscount.equals("0") && !videoscount.equals("") && !videoscount.equals(" ") && !videoscount.equals(null)){ %><a class="imgsearch2 desktop"><cms:img src="/arte/playvideo.png" width="22" height="16" alt="Esta nota tiene video" title="Esta nota tiene video" /></a> <% } %>
                        	</div>
				
				<div class="titsearch">
					<p class="titsearch2" itemprop="name headline"><a href="${news.link}" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><nt:title value="home"/></a></p> 					                
					<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
						<p class="autsearch" itemprop="author" itemscope itemtype="http://schema.org/Person">									
							<nt:authors>
							<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
							<c:if test="${internalUser != ''}">
								<nt:user username="${internalUser}">
									<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
									<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
									<a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>								
								</nt:user>
							</c:if>	 
							<c:if test="${internalUser == ''}">
								<meta itemprop="name" content="<nt:author-name/>"/>
								<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
							</c:if>							    		
							</nt:authors>									
						</p>
					</nt:conditional-include>
				</div>
				
				<div class="clear"></div>
					<nt:edit-buttons hasNew="true" hasDelete="true"/> 
					<div class="contsearch" itemprop="description alternativeHeadline"><nt:sub-title maxlength="150" fullword="true" endchars="..."/></div>				
				</div>
				
		</li>
		</nt:news-list>
		</ul>
	 	</div>
	</div> 