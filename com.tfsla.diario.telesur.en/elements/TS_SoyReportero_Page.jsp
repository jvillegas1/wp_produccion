<%@ include file="TS_Common_Libraries.jsp" %>

<%
int pagina  = ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
int size = ( request.getParameter("size") != null ) ? Integer.parseInt(request.getParameter("size")) : 7;
%>

<!-- Se utiliza el nt identico al TS_SoyReportero_Destcada.jsp, para excluir la noticia que esta en la zona destacada -->
<nt:news-list section="imreporter" order="priority desc,user-modification-date desc" onmainpage="section" zone="destacada" size="1" > 
	<c:set var="excludeLink" scope="page">${news.link}</c:set>
	<jsp:useBean id="excludeLink" type="java.lang.String" />
</nt:news-list>

<div class="row clear">
	<div class="col">
		<div class="rowInt">
			<div class="cont">
				<nt:news-list section="imreporter" order="user-modification-date desc" size="<%=size%>" page="<%=pagina%>" state="publicada" publication="9">
					<c:set var="friendlyUrl" scope="page">${news.link}</c:set> 
					<nt:conditional-exclude oncondition="${friendlyUrl == excludeLink}">
						<div class="news lineanews2" itemscope itemtype="http://schema.org/Article">
							<div class="reponews" itemscope itemtype="http://schema.org/ImageObject">
									<nt:preview-image>            
										<a href="<nt:link/>" class="her">
											<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
											<nt:conditional-include oncondition="${imageDescription != ''}">
												<meta itemprop="contentURL" itemprop="description" content='<nt:image-description/>'>   
												<img src="<nt:image-path width="268" height="139" scaletype='2'/>" alt='<nt:image-description/>' title='<nt:image-description/>' >
											</nt:conditional-include>
											<nt:conditional-include oncondition="${imageDescription == ''}">
												<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
												<img itemprop="contentURL" src="<nt:image-path width="268" height="139" scaletype='2'/>" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}' >
											</nt:conditional-include>
										</a>
									</nt:preview-image>
									<nt:conditional-include oncondition="${news.imagepreviewset == 'false'}">
										<a href="<nt:link/>">
											<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
											<cms:img src="/arte/sinFoto_420x260.jpg" width="268" height="139" alt="${news.titles[news.titleSectionNum]}" title="${news.titles[news.titleSectionNum]}" scaleType="2"/>
										</a>
									</nt:conditional-include>                                                
							</div>
							<div class="txt-news">
								<div class="new-tit" itemprop="name headline">
									<h3><a href="<nt:link/>" class="new-tit"><nt:title value="section"/></a></h3>
									<nt:edit-buttons hasNew="true" hasDelete="true"/>
								</div>
								<nt:authors>
									<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
									 
									<jsp:useBean id="internalUser" type="java.lang.String" />
									
									<nt:user username="${internalUser}">
										<div class="new-bajada2" itemprop="author" itemscope itemtype="http://schema.org/Person" />
											<div class="autrepo">	
												<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
												<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>	
												
												<c:set var="urlFrendly" scope="page"><nt:user-link-friendly /></c:set>
												<jsp:useBean id="urlFrendly" type="java.lang.String" />		
												<%
												String urlFrendlyClean=urlFrendly.replace("-", " ");
												%> 																			
												
												<nt:conditional-include oncondition="${internalUser != 'anonymousUser'}">                            
                                               							<a href="/english<%=urlFrendlyClean%>" class="her"><nt:user-firstname/> <nt:user-lastname/></a>
                                                						</nt:conditional-include>	
                                                						
                                                						<nt:conditional-include oncondition="${internalUser == 'anonymousUser'}">                            
                                                						<a href="/english<%=urlFrendlyClean%>" class="her"> teleSUR </a>
                                                						</nt:conditional-include>						
												
											</div>
											<nt:conditional-include oncondition="${ntuser.infoextra['USER_COUNTRY'] != null && ntuser.infoextra['USER_COUNTRY'] != ''}">
						           					<div class="cityrepo">
						           						<c:set var="desCateg" scope="page">
						           							<cms:property name="Title" file="${ntuser.infoextra['USER_COUNTRY']}" />
						           						</c:set>
													${desCateg}												
												</div>
						           				</nt:conditional-include>
										</div>
									</nt:user>
								</nt:authors>
								<div class="new-link">
									<div class="sharepo">
										<div class="blogrs">
										 
										 <nt:conditional-include oncondition="${news.commentcount > 0}"> 
											<div class="gblogrs desktop">											
												<div class="num desktop">${news.commentcount}</div>
												<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" />
											</div>
										</nt:conditional-include>	
										<nt:conditional-include oncondition="${news.commentcount == 0}"> 
											<div class="gblogrs desktop">&nbsp;&nbsp;</div>								
										</nt:conditional-include>							
																									
										<div class="fbreport desktop">
												<cms:include page="TS_Common_AddThis.jsp" >
													<cms:param name="link"><nt:link/></cms:param> 
													<cms:param name="titulo"><nt:title value="section"/></cms:param>       
												</cms:include>
											</div>
										</div>
										<div class="repoarrow">
											<div class="img">
												<cms:img src="/arte/down-arrow2.png" width="20" height="11" alt="Don't Likes" title="Don't Likes" />
											</div>
											<div class="txt"><nt:news-negative-valorations/></div>
										</div>
										<div class="repoarrow">
											<div class="img">
												<cms:img src="/arte/up-arrow.png" width="20" height="11" alt="Likes" title="Likes" />
											</div>
											<div class="txt"><nt:news-positive-valorations/></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</nt:conditional-exclude>
					
					<nt:conditional-include onposition="last">
						<c:set var="hayMas" value="false"/>
						
						<nt:conditional-include oncondition="${newslist.size == 7}">
							<nt:news-list section="imreporter" size="<%=size%>" page="<%=pagina+1%>" state="publicada">						
								<c:set var="hayMas" value="true"/>								
							</nt:news-list>	
							
							<c:if test="${hayMas == 'true'}" >
								<div id="bloque_<%=pagina+1%>"></div>
								
								<div class="cont" id="paginador" > 
									<a class="btnrepsm" href="javascript:cargarMasNotas('<%=pagina+1%>','<%=size%>');"><img src="/arte/down-arrow.png" width="24" height="13" alt="See more reports" title="See more reports" />See more reports</a>
								</div>	
							</c:if>	
						</nt:conditional-include> 
					</nt:conditional-include> 
					
				</nt:news-list>
			</div>
		</div>
	</div>
</div>