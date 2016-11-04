<%@ include file="TS_Common_Libraries.jsp" %>
          <c:set var="i" value="0" scope="page"/>

<nt:news>
<div id="contents">
	<div class="page-title" id="espRelacionada">
        <h7>Related Stories</h7>
</div>
    <!-- Portfolio -->
   <div class="containerRelacionado">
    <nt:related-news size="2"> 
     <c:set var="i" value="${i+1}" />            
 
<c:if test="${i<=4 }">

   <div class="viewRelacionado">  
            <nt:preview-image>                                  
                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                    <nt:conditional-include oncondition="${imageDescription != ''}">
                    <div class="numberRelacionado">${i}</div>
                        <img src="<nt:image-path width="100%" height="100%" scaletype="2" />" alt='<nt:image-description/>' title='<nt:image-description/>'>
                    </nt:conditional-include>
                    <nt:conditional-include oncondition="${imageDescription == ''}">
                    <div class="numberRelacionado">${i}</div>
                        <img src="<nt:image-path width="100%" height="100%" scaletype="2" />" alt='${news.titles[news.titleHomeNum]}' title='${news.titles[news.titleHomeNum]}'>
                    </nt:conditional-include>   
            </nt:preview-image>
                <div class="maskRelacionado">
                    <h3 class="titRelacionada"><nt:title value="home"/></h3>  
                    <a href="<nt:link/>" class="info">See more</a>    
                </div>
            </div>
 </c:if>

    </nt:related-news>       
        </div>
        </div>     
</nt:news>  

  