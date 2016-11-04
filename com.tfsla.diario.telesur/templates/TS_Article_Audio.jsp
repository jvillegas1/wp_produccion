<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html>
    <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
        <cms:param name="template">article</cms:param>  
        <cms:param name="copy">no</cms:param>      
    </cms:include>	

    <nt:comments-init/>	
		<script src="http://jwpsrv.com/library/Cs7H6hH+EeWttA4AfQhyIQ.js"></script>
</head>

<body>

<cms:include page="../elements/TS_Common_Header.jsp" >
    <cms:param name="pageTitle">Nota</cms:param>  
    <cms:param name="pageSeccion">audio</cms:param>
    <cms:param name="subMenu">si</cms:param>   
    <cms:param name="agenda">si</cms:param>
    <cms:param name="latest">no</cms:param>      
</cms:include>

<nt:news>

<div class="row clear ">
		<div class="bannerMobile fondobl">
			<cms:include page="../elements/TS_Common_Banners.jsp">
				<cms:param name="template">Audio</cms:param>
				<cms:param name="key">Advert-468x60-c-mobile</cms:param>
			</cms:include>
		</div>
	</div>	


    <!-- Container -->
    <div id="container">
        <cms:include page="../elements/TS_Common_LiveBox.jsp" />

            <!--wrapper--> 
            <div class="wrapper">
            
              <!-- Banner 1 -->
			<div class="row clear marginchica">
		    		<div class="banners pos0">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Audio</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
				</div>       
			</div>

                <!-- side bar -->

                <cms:include page="../elements/TS_Common_Addthis-Sidebar.jsp">
                    <cms:param name="link"><nt:link/></cms:param>
                    <cms:param name="titulo"><nt:title value="detail" /></cms:param>
                </cms:include>

 		<!-- side bar -->

                <div itemscope itemtype="http://schema.org/Article">
                    <meta itemprop='isFamilyFriendly' content='True'/>
                    <meta itemprop='url sameAs' content='<nt:link/>'/>
                    <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>
                    
                    <!-- Destacado -->
                    <div class="row clear">

		
	
	           
                        <!-- inicio worldtop -->
                        <div class="wrap notaAgenda">				

                            <div class="nworldtop cont">
                                <span class="itacaput" itemprop="articleSection">	
                                    <a href="/seccion/<nt:section-name/>" class="her" alt="<nt:section-description/>" title="<nt:section-description/>"><nt:section-description/></a>						
                                    <nt:categories>
                                    <c:set var="categoria" scope="page"><nt:category-description/></c:set>
                                        <nt:conditional-include onposition="first">
                                            <c:set var="id"><nt:category-name/></c:set>
                                                <% 	
                                                String id =  pageContext.getAttribute("id").toString();
                                                id = id.replaceAll("/system/categories","");
                                                %>	
                                            <a href="<%=id%>" class="her" alt="<nt:category-description/>" title="<nt:category-description/>"> > <nt:category-description/></a>									
                                        </nt:conditional-include>
                                    </nt:categories>								
                                </span>																											
 				<c:if test="${categoria == 'Lo Mejor Del Dia'}">
 				<c:set var="imagen" scope="page">LoMejorDelDia_930x350.jpg</c:set>
 				</c:if>
 				<c:if test="${categoria == 'Blog del Dia'}">
 				<c:set var="imagen" scope="page">BlogAlDia_930x350.jpg</c:set>
 				</c:if>
 				<c:if test="${categoria == 'teleSUR Noticias'}">
 				<c:set var="imagen" scope="page">TelesurNoticias_930x350.jpg</c:set>
 				</c:if>

                                <%--autor por opinion--%>


                                <div class="capcredit" itemprop="publisher">

                                </div>


                            </div>

                            <%--fin de autor--%>
                            <nt:edit-buttons hasNew="true" hasDelete="true"/>	
                            
                            <div class="vworldtop cont">

 					<div class="mediaNota" style="background-image: url('/arte/${imagen}');background-repeat: no-repeat; background-size: cover;">
                                            
                                                <cms:include page="../elements/TS_Audio_Multimedia.jsp" />
                                          
                                           
                                        </div>
                                    

                                <div class="capworldtop">
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fin worldtop -->


                        <!-- inicio widget interno Cxense -->
                        <div class="col-300a">
                            <div class="row clear"> 
                                <cms:include page="../elements/TS_Audio_Destacamos.jsp"> </cms:include>
                            </div>
                        </div>
                        <!-- ifin widget interno Cxense -->


                        <!-- inicio colmna izq col-six -->        
                        <div class="col-six">
                            <div class="cont bordercountry">
                                <div class="dest cont">

                                    <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
                                        <div class="subtitle" itemprop="description alternativeHeadline"><nt:sub-title/></div>                                        
                                    </nt:conditional-include>

                                    <div class="capworldtop">
                                        <div class="caplw">
                                            <br>
   
                                         
                                                <nt:conditional-include oncondition="${news.hideAuthor == 'false'}">
                                                    <div class="capaut" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                                        <nt:authors>
                                                            <c:set var="internalUser" scope="page"><nt:author-internaluser/></c:set>
                                                            <c:set var="authorName" scope="page"><nt:author-name/></c:set>
                                                            <c:if test="${internalUser != ''}">
                                                                <nt:user username="${internalUser}">
                                                                    <meta itemprop="name" content="<nt:user-firstname/> <nt:user-lastname/>"/>
                                                                    <meta itemprop="sameAs" content="<nt:user-link-friendly/>"/>
                                                                    Por: <span class="itacaput"><a href="<nt:user-link-friendly />" class="her" alt="<nt:user-firstname/> <nt:user-lastname/>" title="<nt:user-firstname/> <nt:user-lastname/>"><nt:user-firstname/> <nt:user-lastname/></a></span>									
                                                                </nt:user>
                                                            </c:if>	 
                                                            <c:if test="${internalUser == '' && authorName != ''}">
                                                                <meta itemprop="name" content="<nt:author-name/>"/>
                                                                Por: <span class="itacaput"><a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a></span>
                                                            </c:if>
                                                            <br/>
                                                        </nt:authors>
                                                    </div>
                                                </nt:conditional-include>
                                          
 
                                        </div>
                                        <cms:include page="../elements/TS_Article_Comments_Audio.jsp" />
                                    </div>
                                </div>

                                <div class="separador margensep"></div>
                            </div>																

                      
                        </div>
                        <!-- fin colmna izq col-six -->
				<div class="row clear">
					
					<div class="banners">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">BlogPage</cms:param>
							<cms:param name="key">Advert-728x90-a</cms:param>
						</cms:include>       
					</div>	
				</div>
                        <!--COLUMNA DERECHA -->
	
                        <!--FIN COLUMNA DERECHA -->
                    </div>
                    <!-- Fin Destacado -->
                </div>


            </div><!--wrapper-->  
            			
   
       
       
    </div><!--conteiner-->
                                       
                                    <nt:audio>
                                   
                                    <div id="Audio"></div>

					<script>
					var playerInstance = jwplayer("Audio");
					    playerInstance.setup({
					        file: "http://wp.telesurtv.net<nt:audio-path/>",
					        width: 490,
					        height: 30
					    });
					    

					</script>					                                    					                         
					
					</nt:audio>
				  
 </nt:news>

<cms:include page="../elements/TS_Common_Footer.jsp" />

</body>
<script type="text/javascript">
<!-- script menu -->
    var menu = 0
    $('#header .btnMobile').click(function () {
        if (menu == 0) {
            $('#nav').slideDown(750);
            menu++
        } else {
            $('#nav').slideUp(750, function () {
                $('#nav').removeAttr('style');
            });
            menu--
        }
    });
</script>
</html>