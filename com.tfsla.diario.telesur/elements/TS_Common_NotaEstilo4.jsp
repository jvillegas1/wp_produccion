<%@ include file="TS_Common_Libraries.jsp" %>

<% String path = (request.getParameter("path") != null ) ? request.getParameter("path") : "" ; %>	

<nt:news path="<%=path%>" >
	<div class="news" itemscope itemtype="http://schema.org/Article">                                      	
	      <div class="txt-newslit">
	         <div class="new-tit" itemprop="name headline"><h4><a href="<nt:link/>" class="new-tit" alt='<nt:title value="section"/>' title='<nt:title value="section"/>'><nt:title value="section"/></a></h4></div>
	         <nt:edit-buttons hasNew="true" hasDelete="true"/>
	         <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
	         	<div class="new-bajada" itemprop="description alternativeHeadline"><nt:sub-title/></div>  
	         </nt:conditional-include>            
	      </div>
	      <nt:conditional-include oncondition="${news.hideComments == false}">
			<div class="width15">						
				<div class="gblogrs">
					<div class="num">${news.commentcount}</div>
					<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comentarios" title="Comentarios" />
				</div>						
			</div> 
		</nt:conditional-include>    
	</div>  
</nt:news>