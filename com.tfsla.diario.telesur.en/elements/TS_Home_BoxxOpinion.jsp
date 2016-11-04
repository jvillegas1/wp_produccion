<%@ include file="TS_Common_Libraries.jsp" %>
<%
String zona = request.getParameter("category") + "_bloguers"; /** PARAMETRO ZONE!!!! LEVANTAS LA CATEGORIA Y ARMAS LA VARIABLE QUE VAS A USAR EN EL NEWSLIST */
String categoria = "/SubSecciones/news/" + request.getParameter("category") ; /** LEVANTAS LA CATEGORIA QUE DONDE VAS A USAR EN *  */
int size = (zona.equals("bloguers")) ? 2 : 3 ; /**  PARAMETRO SIZE!!!! SE HABIA PEDIDO QUE SI LA CATEGORIA ERA WORD SE MUESTREN DOS NOTAS Y PARA LATINAAMERIA 3 NOTAS */
%>
       	<c:set var="Descript" scope="page"><cms:property name="Title" file="<%=categoria %>" /></c:set> 
	<jsp:useBean id="Descript" type="java.lang.String" /> 
	
        <div class="headers blue"> <% if(Descript.equalsIgnoreCase("Mundo")){ %> Opinion <% }else{%> Blogueros <%}%> </div> 
	<div class="cont"> 
	<nt:news-list size="<%=size %>" zone="opinion" order="priority, user-modification-date" onmainpage="home" >
	                <div itemscope itemtype="http://schema.org/Article" class="news">
	                	<meta itemprop="sameAs url" content="<nt:link/>"/>
				<nt:conditional-include oncondition="${news.imagepreviewset}">
		                      <div itemprop="image" itemscope itemtype="http://schema.org/ImageObject" class="min80">
			                      	<a href="<nt:link/>" class="her" title='<nt:title value="home" />'>
				                   <nt:preview-image>
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
			      				<nt:conditional-include oncondition="${imageDescription != ''}">
			      					<meta itemprop="description" content='<nt:image-description/>'>	
								<img itemprop="contentURL" src="<nt:image-path width='80' height='80'  scaletype='2'/>" alt="<nt:image-description/>" width="80" height="80" />
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
								<img itemprop="contentURL" src="<nt:image-path width='80' height='80'  scaletype='2'/>" alt="alt='${fn:escapeXml(news.titles["home"])}' " width="80" height="80" />
							</nt:conditional-include>
						</nt:preview-image>
			                      	</a>
		                      </div>
		                </nt:conditional-include>
	                      
	                      	<div class="txt-news">
					<div class="new-tit">
						<a href="<nt:link/>" title='<nt:title value="home" />' alt='<nt:title value="home" />' class="her">
							<h4 itemprop="name headline"><nt:title value="home" /></h4>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</a>
					</div>
					<nt:conditional-include oncondition="${news.authorscount > 0 && news.hideAuthor == ' false'}" >
						<p itemprop="author" itemscope="" itemtype="http://schema.org/Person">by
							<c:set var="divisor"></c:set>
							<nt:authors>
								<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
								<c:if test="${not empty internalUser}">
									<nt:user username="${internalUser}">
										<a itemprop="sameAs" href="<nt:user-link-friendly />" class="new-autor" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"> 
											${divisor} <nt:user-firstname/> <nt:user-lastname/> 
										</a>
										<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
									</nt:user>
								</c:if>	 
								<c:if test="${empty internalUser}">
									<a itemprop="sameAs" href="javascript:void(0)" class="new-autor" title="<nt:author-name/>" alt="<nt:author-name/>">
										${divisor} <nt:author-name/> 
									</a>
									<meta itemprop="name" content="<nt:author-name/>"/>
								</c:if>
								<c:set var="divisor">,</c:set>
							</nt:authors>
						</p>
					</nt:conditional-include>	                         
	                                      
	                      	</div>                            
	                 </div> 
                 </nt:news-list>
	</div>