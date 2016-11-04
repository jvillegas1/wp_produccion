<%@ include file="TS_Common_Libraries.jsp" %>
<%
  /**
  * Join Us - Comentarios Populares - Seccion NEWS
  *
  */
  int cont = 0;
%>
<nt:news-list order="most-commented" section="news" from="7d" age="7d" publication="9">
	<% cont++; %>
</nt:news-list>

<div class="rowInt">
	<div class="headers blue">Your comments</div>
	<% if (cont > 0) { %>
		<div class="cont">
			<nt:news-list order="most-commented" size="3" section="news" from="7d" age="7d" publication="9">
				<div class="commentboxjs">
					<div class="blueju"><a href="<nt:link />" class="her" alt='<nt:title value="home" />' title='<nt:title value="home" />'> <nt:title value="home" /> </a></div>
					<div class="graybox">
						<div class="leftboxju">
							<nt:authors>
								<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
								<jsp:useBean id="internalUser" type="java.lang.String" />
								
								<nt:conditional-include oncondition="${internalUser != ''}">
									<nt:user username="${internalUser}">
									
										<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_NOMBRE'] == 'TRUE' || empty ntuser.infoextra['USER_MOSTRAR_NOMBRE']}">
											<c:set var="usuario" scope="page"> <nt:user-firstname/> <nt:user-lastname/> </c:set>
										</nt:conditional-include>
										
										<nt:conditional-include oncondition="${ntuser.infoextra['USER_MOSTRAR_APODO'] == 'TRUE'}">
											<c:set var="usuario" scope="page"> <nt:user-nickname/> </c:set>
										</nt:conditional-include>
									
										<a href="/english<nt:user-link-friendly />" class="her">
											<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] != null && ntuser.infoextra['USER_PICTURE'] != ' '}">
											  	<div class="commprof"><img src="<nt:user-image width='56' height='56' scaletype='2' />" width="56" height="56" alt='${usuario}' title='${usuario}' /></div>   
												<div class="nameju">${usuario}</div>
											</nt:conditional-include>
											<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] == null}">
												<div class="commprof"><cms:img src="/arte/perfil_user.jpg" width="56" height="56" alt='${usuario}' title='${usuario}' />   </div>
												<div class="nameju">${usuario}</div>
											</nt:conditional-include>
										</a>
									</nt:user>
								</nt:conditional-include>
								<nt:conditional-include oncondition="${internalUser == ''}">
									<div class="commprof"><cms:img src="/arte/perfil_user.jpg" width="56" height="56" alt='<nt:author-name/>' title='<nt:author-name/>' /></div>			
									<div class="nameju"><nt:author-name/></div>
								</nt:conditional-include>
							</nt:authors>
						</div>
						<div class="rightboxju">
							<div class="comtxtju"><nt:sub-title maxlength="150" fullword="true" endchars="..."/></div>  
							<div class="rsju">
								<ul>
									<li>${news.commentcount} Replies</li>
									<li>
										<cms:include page="TS_Common_AddThis.jsp" >
											<cms:param name="link"><nt:link/></cms:param> 
											<cms:param name="titulo"><nt:title value="home"/></cms:param>       
										</cms:include>
									</li>
								</ul>
			                                </div>  
						</div>
					 </div>                   
				</div>
			</nt:news-list>    
		</div> 
	<% } else { %>
		<div class="cont">
			<div class="modnews">
				<div class="titlepopbox">Currently we don't have more "Most commented" stories. </div>
			</div>
		</div>
	<% } %>
</div>
