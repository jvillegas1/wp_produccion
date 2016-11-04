<%@ include file="TS_Common_Libraries.jsp" %>

<nt:news>  	
	<nt:authors>
		<c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
		<jsp:useBean id="internalUser" type="java.lang.String" />
		
		<nt:conditional-include oncondition="${internalUser != ''}">
			<nt:user username="${internalUser}">
				<div class="cont conttitle">
					<div class="titsoyrep">Perfil del Bloguero</div>									
					<div class="contsp">
						<div class="topsoyrepo">
							<div class="leftsp"> 
								<a href="<nt:user-link-friendly />" class="her">	
									<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] != null && ntuser.infoextra['USER_PICTURE'] != ' '}">
									  	<img src="<nt:user-image width='80' height='78' scaletype='2' />" width="80px" height="78px" alt='<nt:user-firstname/> <nt:user-lastname/>' title='<nt:user-firstname/> <nt:user-lastname/>' />
									</nt:conditional-include>
									<nt:conditional-include oncondition="${ntuser.infoextra['USER_PICTURE'] == null}">
										<cms:img src="/arte/perfil_user.jpg" width="80px" height="78px" alt='<nt:user-firstname/> <nt:user-lastname/>' title='<nt:user-firstname/> <nt:user-lastname/>' />  
									</nt:conditional-include> 
								</a>										 
							</div>
							<div class="rightsp">
								<div class="autrepo"> 		
									<a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"> <nt:user-firstname/> <nt:user-lastname/> </a>
					           		</div>
					           		<nt:conditional-include oncondition="${ntuser.infoextra['USER_COUNTRY'] != null && ntuser.infoextra['USER_COUNTRY'] != ''}">
			           					<div class="cityrepo">
			           						<c:set var="desCateg" scope="page">
			           							<cms:property name="Title" file="${ntuser.infoextra['USER_COUNTRY']}" />
			           						</c:set>
										${desCateg}
			           					</div>
			           				</nt:conditional-include>
			           				
			           				<!-- start like fb --> 
								<div class="fbblogrs">
                  							<div id="fb-root"></div>
									<script>(function(d, s, id) {
							                      var js, fjs = d.getElementsByTagName(s)[0];
							                      if (d.getElementById(id)) return;
							                      js = d.createElement(s); js.id = id;
							                      js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&appId=717538144973953&version=v2.0";
							                      fjs.parentNode.insertBefore(js, fjs);
							                    }(document, 'script', 'facebook-jssdk'));
							                </script>
                    
						                    <div class="fb-like" data-href="www.telesurtv.net<nt:user-link-friendly />" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div>
						                  </div>
						                  <!-- end like fb -->
								 
							</div>

		          				<nt:conditional-include oncondition="${ntuser.infoextra['USER_DESCRIPTION'] != null && ntuser.infoextra['USER_DESCRIPTION'] != ''}">
			          				<div class="txtprofileblog clear">${ntuser.infoextra['USER_DESCRIPTION']}</div>
			          			</nt:conditional-include>
			          					          		
						</div>
											
						<% int cont = 0; %>
						<nt:news-list author="${internalUser}">   
							<% cont++; %>
						</nt:news-list>
						
						<% if (cont > 1) { %>
							<div class="botsoyrepo" >
							
								<%-- Este codigo es utilizado para no mostrar la noticia en la que estamos parados --%>
								<c:set var="presentUrl" scope="page">${news.link}</c:set> 
								<jsp:useBean id="presentUrl" type="java.lang.String" />
								
								<div class="autrepo blue margrep">Más artículos de este bloguero</div>	
												
								<ul id="slideVerticalBlog" style="width: 335px !important;">						
									<nt:news-list order="user-modification-date desc" author="${internalUser}">  								
										<c:set var="friendlyUrl" scope="page">${news.link}</c:set> 
										<jsp:useBean id="friendlyUrl" type="java.lang.String" />
										<% if(!friendlyUrl.equals(presentUrl)) { %>	
											<li style="width: 335px !important;">
												<div class="notsoyrep"><a href="<nt:link />" class="her" alt="<nt:title value="home" />" title="<nt:title value="home" />"><nt:title value="home" maxlength="45" fullword="true" endchars="..." /> </a></div>
											</li>
										<% } %>
									</nt:news-list>
								</ul>
								
							</div>
						<% } %>
						<% if (cont > 4) { %>
							<a href="#" id="next_blogger" class="slide_next"></a> 
						<% } %>
					</div>
				</div>		
			</nt:user>
		</nt:conditional-include>
	</nt:authors>	
</nt:news>
<!-- Vertical Carrousel -->
<script type="text/javascript">
$(function() {						
	$('#slideVerticalBlog').ulslide({
		width: 335,
		height: 12,
		effect: {
			type: 'carousel', // slide or fade
			axis: 'y',        // x, y
			showCount: 4
		},
		nextButton: '.slide_next',
		prevButton: '#slide_prev',
		duration: 800,
	});
});
</script>