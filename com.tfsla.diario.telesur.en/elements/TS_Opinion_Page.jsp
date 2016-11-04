<%@ include file="TS_Common_Libraries.jsp" %>

<%
org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
request.setCharacterEncoding("UTF-8");

/** Variables de session para mantener la ruta de navegacion del usuario*/
session.setAttribute("seccion","opinion");
session.setAttribute("url",cms.getRequestContext().getUri());	

String category = request.getParameter("category");  
int size = ( request.getParameter("size") != null ? Integer.parseInt(request.getParameter("size")) : 2 );
int pagina = ( request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 );
int position = 0;
String categoryPath = "/SubSecciones/en/opinion/"+category+"/"; 
%>
<%
if(category.equals("articles")){
%>
<%-- List Articles --%>
<nt:news-list order="user-modification-date desc" section="opinion" page="<%=pagina%>" category="<%=categoryPath%>" size="<%=size%>" publication="9">
	<!--Noticia -->
	<div class="news lineanews margop" itemscope itemtype="http://schema.org/Article">
	     	<div class="opitxt">
			<nt:conditional-include oncondition="${news.authorscount > 0 && news.hideAuthor == 'false'}">
		        	<div class="auopi" itemprop="author" itemscope itemtype="http://schema.org/Person">
		        		<nt:authors>
										<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
										<c:if test="${internalUser != ''}">
											<nt:user username="${internalUser}">
												<meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
												<meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
												<a href="/english<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>						
											</nt:user>
										</c:if>	 
										<c:if test="${internalUser == ''}">
											<meta itemprop="name" content="<nt:author-name/>"/>
								    			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
								    		</c:if>	
								    		<c:set var="variable" value="news-total-comments" />
				    						<nt:conditional-include oncondition="${variable.equals(0)}"> 
								    		<div class="gblogrs">
							                           	<div class="num"><nt:news-total-comments/></div>
							                           	<cms:img src="/arte/globe-red.png" scaleColor="transparent" width="31" height="27" alt="Comentarios"/>
							                        </div>	
							                        </nt:conditional-include>					    		
									</nt:authors>	
			        </div>
			</nt:conditional-include>
			<div class="titopi" itemprop="name headline">
				<a href="<nt:link/>" class="her" title="<nt:title value="section"/>"><nt:title value="section"/></a>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
			</div>
			<nt:conditional-include oncondition="${news.hideCopete == 'false'}">
				<div class="contopi" itemprop="description alternativeHeadline">
					<nt:sub-title maxlength="150" endchars="..." />
				</div>
			</nt:conditional-include>
	        </div>
	        <div class="opimg">
	        	<div class="sharop">
	                    	<div class="share-rs desktop" style="padding-bottom: 5px;">
					<cms:include page="TS_Common_AddThis.jsp" >
						<cms:param name="link"><nt:link/></cms:param> 
						<cms:param name="titulo"><nt:title value="section"/></cms:param>       
					</cms:include>
		                </div>
	           	</div>
	           	
		    	<div class="imgop" itemscope itemtype="http://schema.org/ImageObject">
				<a href="<nt:link/>" class="her">
					<nt:preview-image>
						<nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
				    			<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					      		<nt:conditional-include oncondition="${imageDescription != ''}">
					      			<meta itemprop="description" content='<nt:image-description/>'>	
				    				<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="243" height="137" />" width="243" height="137" alt="<nt:image-description/>" title="<nt:image-description/>">
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="243" height="137" />" width="243" height="137" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}' />
							</nt:conditional-include>
				                </nt:conditional-include>
				     	</nt:preview-image>
					<nt:conditional-exclude oncondition="${news.imagepreviewset}">
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<cms:img src="/arte/sinFoto_170x105.jpg" width="243" height="137" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
					</nt:conditional-exclude>
				</a> 
		       	</div>
	       </div>
	</div>
</nt:news-list>
		
<% 
} if(category.equals("interviews")){
%>
<%-- List Interviews --%>
<nt:news-list order="user-modification-date desc" section="opinion" page="<%=pagina%>" category="<%=categoryPath%>" size="<%=size%>" publication="9">
	<!--Not -->
	<div class="news lineanews margop" itemscope itemtype="http://schema.org/Article">
		<div class="opi2img" itemscope itemtype="http://schema.org/ImageObject">
			<a href="<nt:link/>" class="her" title="<nt:title value="section"/>"> 
				<nt:preview-image>
					<nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
						<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
			      			<nt:conditional-include oncondition="${imageDescription != ''}">
			      				<meta itemprop="description" content='<nt:image-description/>'>	
							<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="135" height="135" />" width="135" height="135" alt="<nt:image-description/>"/>
						</nt:conditional-include>
						<nt:conditional-include oncondition="${imageDescription == ''}">
							<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
							<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="135" height="135" />" width="135" height="135" alt='${news.titles[news.titleSectionNum]}'/>
						</nt:conditional-include>
	
					</nt:conditional-include>
				</nt:preview-image>
				<nt:conditional-exclude oncondition="${news.imagepreviewset}">
					<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
					<cms:img src="/arte/sinFoto_170x105.jpg" width="340" height="340" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
				</nt:conditional-exclude>
			</a>
		</div>
		<div class="txtopi2">
			<div class="conttitpi2">
				<div class="titopi2" itemprop="name headline">
					<a href="<nt:link/>" title="<nt:title value="section"/>" class="her"> <nt:title value="section"/></a>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
				<div class="globe">
				<c:set var="variable" value="news-total-comments" />
				<nt:conditional-include oncondition="${variable.equals(0)}"> 
					<div class="gblogrs">
						<div class="num"><nt:news-total-comments/></div>
						<cms:img  src="/arte/globe-red.png" scaleColor="transparent" width="31" height="27" alt="Comments"/>
					</div>
				</nt:conditional-include>
				</div>
			</div>
            		<nt:conditional-include oncondition="${news.hideCopete == 'false'}">   
				<div class="contopi2" itemprop="description alternativeHeadline">
					<nt:sub-title maxlength="150" endchars="..." />
				</div>
			</nt:conditional-include>
			<div class="rs" style="clear: both;">
				<div class="sharop">
					<div class="share-rs desktop">
						<cms:include page="TS_Common_AddThis.jsp" >
							<cms:param name="link"><nt:link/></cms:param> 
							<cms:param name="titulo"><nt:title value="section"/></cms:param>       
						</cms:include>
					</div>
				</div>
			</div>
			
		</div>		  
	</div> 
</nt:news-list>
	
<%
} if(category.equals("context")){
%>

<%-- List Context --%>
<nt:news-list order="user-modification-date desc" section="opinion" page="<%=pagina%>" category="<%=categoryPath%>" size="<%=size%>" publication="9">
	<nt:conditional-include oncondition="${newslist.absoluteposition == 1 && newslist.page == 1}">
		<div class="context1" itemscope itemtype="http://schema.org/Article">
			<div class="imgcont1" itemscope itemtype="http://schema.org/ImageObject">
				<a href="<nt:link/>" class="her" title="<nt:title value="section"/>">
					<nt:preview-image>
						<nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
							<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
							<nt:conditional-include oncondition="${imageDescription != ''}">
								<meta itemprop="description" content='<nt:image-description/>'>	
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="340" height="340" />" width="340" height="340" alt="<nt:image-description/>">
							</nt:conditional-include> 								
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="340" height="340" />" width="340" height="340" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}' />
							</nt:conditional-include>
						
						</nt:conditional-include>
					</nt:preview-image>
					<nt:conditional-exclude oncondition="${news.imagepreviewset}">
						<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
						<cms:img src="/arte/sinFoto_170x105.jpg" width="340" height="340" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
					</nt:conditional-exclude>
				</a> 
			</div>
			<div class="titcon1" itemprop="name headline">
				<a href="<nt:link/>" class="her" title="<nt:title value="section"/>"><nt:title value="section"/></a>
				<nt:edit-buttons hasNew="true" hasDelete="true"/>
			</div>		
		        <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
				<div class="txtcon1" itemprop="description alternativeHeadline">
		           		<nt:sub-title maxlength="150" endchars="..." />
		       		</div>
		        </nt:conditional-include>
		</div>
	</nt:conditional-include>
	
	<nt:conditional-include oncondition="${newslist.absoluteposition >= 2 && newslist.page == 1}">
		<div class="context2" itemscope itemtype="http://schema.org/Article">
		        <div class="imgcont2" itemscope itemtype="http://schema.org/ImageObject"> 
	            		<a href="<nt:link/>" class="her" title="<nt:title value="section"/>">
		            		<nt:preview-image>
						<nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
		            				<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
				      			<nt:conditional-include oncondition="${imageDescription != ''}">
				      				<meta itemprop="description" content='<nt:image-description/>'>	
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="153" height="153" />" alt="<nt:image-description/>"/>
							</nt:conditional-include>
							<nt:conditional-include oncondition="${imageDescription == ''}">
								<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
								<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="153" height="153" />" width="153" height="153" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
							</nt:conditional-include>
					        </nt:conditional-include>
					</nt:preview-image>
					<nt:conditional-exclude oncondition="${news.imagepreviewset}">
						<cms:img src="/arte/sinFoto_170x105.jpg" width="153" height="153" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
					</nt:conditional-exclude>
	            		</a> 
		        </div>
		        <div class="txtopi3">
		                <div class="titcon2" itemprop="name headline">
		                	<a href="<nt:link/>" class="her" title="<nt:title value="section"/>"><nt:title value="section"/></a>
		                	<nt:edit-buttons hasNew="true" hasDelete="true"/>
		                </div>						
		                <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
			                <div class="txtcon2" itemprop="description alternativeHeadline">
			               		<nt:sub-title maxlength="130" endchars="..."/>
			                </div>
		                </nt:conditional-include>
		        </div>    
		</div>
	</nt:conditional-include>
	
	<nt:conditional-include oncondition="${newslist.absoluteposition >= 2 && newslist.page >= 2}">
		<div class="context2" itemscope itemtype="http://schema.org/Article">
		        <div class="imgcont2"  itemscope itemtype="http://schema.org/ImageObject">
		            		<a href="<nt:link/>" class="her" title="<nt:title value="section"/>">
			   			<nt:preview-image>
			            			<nt:conditional-include oncondition="${news.imagepreviewset == 'true'}">
			            				<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					      			<nt:conditional-include oncondition="${imageDescription != ''}">
					      				<meta itemprop="description" content='<nt:image-description/>'>	
									<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="153" height="153" />" alt="<nt:image-description/>"/>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${imageDescription == ''}">
									<meta itemprop="description" content='${news.titles[news.titleSectionNum]}'>
									<img itemprop="contentURL" src="<nt:image-path scaletype="2" width="153" height="153" />" width="153" height="153" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
								</nt:conditional-include>
		        				</nt:conditional-include>
		     				</nt:preview-image>
						<nt:conditional-exclude oncondition="${news.imagepreviewset}">
							<cms:img src="/arte/sinFoto_170x105.jpg" width="153" height="153" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleSectionNum]}'/>
						</nt:conditional-exclude>
		            		</a> 
		        </div>
		        <div class="txtopi3">
		                <div class="titcon2" itemprop="name headline">
		                	<a href="<nt:link/>" class="her" title="<nt:title value="section"/>"><nt:title value="section"/></a>
		                	<nt:edit-buttons hasNew="true" hasDelete="true"/>
		                </div>						
		                <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
			                <div class="txtcon2" itemprop="description alternativeHeadline">
			               		<nt:sub-title maxlength="130" endchars="..."/>
			                </div>
		                </nt:conditional-include>
		        </div>
		</div>
	</nt:conditional-include>
	
	<nt:conditional-include oncondition="${newslist.absoluteposition == 3}">
	<div class="row clear"> 
	    	<div class="banners cont">
		      	<cms:include page="../elements/TS_Common_Banners.jsp">
		        	<cms:param name="template">Opinion</cms:param>
		        	<cms:param name="key">Advert-300x250</cms:param>
			</cms:include>
	        </div>  
	</div>    
	</nt:conditional-include>	
	
</nt:news-list> 
<%			 
}
%>