<%@ include file="TS_Common_Libraries.jsp" %>

<% int cont = 0; %>

<nt:news-list section="joinus" category="/SubSecciones/joinus/quizes/">
	<% cont++; %>
</nt:news-list>

<div class="rowInt">
	<div class="headers blue men clear">Tu opinión</div>
	<div class="cont">
		<% if (cont > 0) { %>
			<nt:news-list  order="user-modification-date desc" section="joinus" category="/SubSecciones/joinus/quizes/" size="2">						
				<div class="multimedia">
					<div class="txt-quiz">
						<div class="multimedia-tit">
							<h4><nt:title/></h4>
							<nt:edit-buttons hasNew="true" hasDelete="true"/>
						</div>
					</div> 
					
					<div class="btnMultimedia">			
						<a rel="<nt:iframe/>" id="masInfo" class="quiz" alt='<nt:title/>' title='<nt:title/>' style="cursor:pointer;">Opina</a>
					</div>                          
				</div>			
			</nt:news-list>
		<% } else { %>
			<div class="multimedia">
				<div class="multimedia-tit"><h4>En estos momentos no tenemos temas de opinion</h4></div>
			</div>
		<% } %>
	</div>
</div>