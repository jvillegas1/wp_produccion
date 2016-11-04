<%@ include file="TS_Common_Libraries.jsp" %>
<!--Begin de las Nota Relacionada -->  
<nt:news>
    <c:set var="i" value="0" scope="page"/>
    <nt:related-news size="10">	
        <nt:conditional-include oncondition="${newslist.size > 4}">
            <c:set var="i" value="${i+1}" />			
            <c:if test="${i==1 }">
                <!-- mid TOPICS -->
                <div class="relation">
                    <h7>Noticias Relacionadas</h7>
                    <div class="margensep"></div>                      
                    <div class="" id="espRelacionada">				
                        <ul class="list">
                            </c:if>				
                            <li>						                                                 <!--Se aplica las mejores practicas de imagenes -->     
                            	<a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><cms:img src="/arte/IconosRel.jpg" /><nt:title value="home"/></a>
                            </li>	
                            <div class="margensepinterno"></div>
                            </nt:conditional-include>
                            <nt:conditional-include oncondition="${newslist.size <= 4}">
                                <c:set var="i" value="${i+1}" />
                                <c:if test="${i==1 }">
                      <div class="relation">					
                                <h7>Noticias Relacionadas</h7>
                                <div class="margensep"></div>                      
                                <div class="" id="espRelacionada">   
                     <ul class="list">
                                </c:if>
                                 <li>                                                                                              <!--Se aplica las mejores practicas de imagenes -->  
                                  <a href="<nt:link/>" class="her" alt='<nt:title value="home"/>' title='<nt:title value="home"/>'><cms:img src="/arte/IconosRel.jpg" /><nt:title value="home"/></a>
                                 </li>	
                                 <div class="margensepinterno"></div>						
                             </nt:conditional-include>
                              </nt:related-news>
                                    <c:if test="${i > 0}">								 
                                      </ul>
                                            <a href="#" id="slide_next2"></a>			
                                        </div>
                             <div class="margensep"></div>
               </c:if>								
</nt:news>
<!--End de las Nota Relacionada -->  