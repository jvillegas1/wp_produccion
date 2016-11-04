<%@ include file="TS_Common_Libraries.jsp" %>
<% 
String newsPath = request.getParameter( "path" ); 
%> 
<c:set var="i" value="0" scope="page"/>

<nt:news path="<%=newsPath%>">
    <h2 class="tit-photo">Related News</h2>
    <nt:related-news size="2"> 
        <c:set var="i" value="${i+1}" />            
        <c:if test="${i<=4 }">
            <div>
            <div class="blue-box">
                <nt:preview-image>                                  
                    <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                    <nt:conditional-include oncondition="${imageDescription != ''}">
                        <amp-img src="<nt:image-path width='400' height='300'  scaletype='2'/>" width="400" height="300" layout="responsive"></amp-img>    
                    </nt:conditional-include>
                    <nt:conditional-include oncondition="${imageDescription == ''}">
                        <amp-img src="<nt:image-path width='400' height='300'  scaletype='2'/>" width="400" height="300" layout="responsive"></amp-img>    
                    </nt:conditional-include>   
                </nt:preview-image>
            </div>
            <h2 class="amp-tit-relacionada"><nt:title value="home"/></h2>
            </div>
        </c:if>
    </nt:related-news>            
</nt:news>  