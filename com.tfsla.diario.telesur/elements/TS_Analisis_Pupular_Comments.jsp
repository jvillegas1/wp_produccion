<%@ include file="TS_Common_Libraries.jsp" %>
<%
  /**
  * Blog Page - More Commented
  *
  */
  int cont = 0;
%>
<nt:news-list  order="most-commented" section="analisis" from="7d" age="7d">
	<% cont++; %>
</nt:news-list>

<div class="headers bluegar">Comentarios Populares</div>
<% if (cont > 0) { %>	
	<div class="cont">
		<ul>
			<nt:news-list order="most-commented" size="3" section="analisis" from="7d" age="7d" >
				<li >
					<div class="popbox">
						<div class="titlepopbox">
							<a href="<nt:link />" class="her" alt="<nt:title value="home" />" title="<nt:title value="home" />">
								<nt:title value="home" />
							</a>
						</div>
						<nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
							<div class="autorpopbox">							
								<nt:authors>
									<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
									<c:if test="${internalUser != ''}">
										<nt:user username="${internalUser}">
											<a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a>									
										</nt:user>
									</c:if>	 
									<c:if test="${internalUser == ''}">
							    			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
							    		</c:if>							    		
								</nt:authors>																						
							</div>
						</nt:conditional-include>
					</div>
				</li>
			</nt:news-list>
		</ul>
	</div>
<% } else { %>
	<div class="cont">
		<div class="modnews">
			<div class="titlepopbox">No hay notas con comentarios populares</div>
		</div>
	</div>
<% } %>