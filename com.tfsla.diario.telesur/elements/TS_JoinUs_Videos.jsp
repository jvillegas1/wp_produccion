<%@ include file="TS_Common_Libraries.jsp" %>

<div class="cont destCam">
	<nt:news-list onmainpage="section" section="joinus" zone="streaming" size="5">
		<nt:conditional-include onposition="first">
			<div class="cont-tab">
				<ul class="idTabs newtabw">
					<div class="tabnew">
		</nt:conditional-include>							
						<nt:conditional-include oncondition="${newslist.position == 1}">
							<li><a href="#One">Cámara 1</a></li>						
						</nt:conditional-include>
						<nt:conditional-include oncondition="${newslist.position == 2}">
							<li><a href="#Two">Cámara 2</a></li>
						</nt:conditional-include>
						<nt:conditional-include oncondition="${newslist.position == 3}">
							<li><a href="#Three">Cámara 3</a></li>
						</nt:conditional-include>
						<nt:conditional-include oncondition="${newslist.position == 4}">
							<li><a href="#Four">Cámara 4</a></li>
						</nt:conditional-include>
						<nt:conditional-include oncondition="${newslist.position == 5}">
							<li><a href="#Five">Cámara 5</a></li>
						</nt:conditional-include>
		<nt:conditional-include onposition="last">										
					</div>
				</ul>
			</div>
			<div class="clear"></div>
		</nt:conditional-include>	
	</nt:news-list>	
	
	<nt:news-list order="priority desc, user-modification-date desc" onmainpage="section" section="joinus" zone="streaming" size="5">
		<nt:conditional-include oncondition="${newslist.position == 1}">
			<div id="One" class="img-destnew jvid">
				<iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>				
				<div class="videoDesc">
					<nt:title/>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${newslist.position == 2}">
			<div id="Two" class="img-destnew jvid">
				<iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>
				<div class="videoDesc">
					<nt:title/>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${newslist.position == 3}">
			<div id="Three" class="img-destnew jvid">
				<iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>
				<div class="videoDesc">
					<nt:title/>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${newslist.position == 4}">
			<div id="Four" class="img-destnew jvid">
				<iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>
				<div class="videoDesc">
					<nt:title/>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${newslist.position == 5}">
			<div id="Five" class="img-destnew jvid">
				<iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>
				<div class="videoDesc">
					<nt:title/>
					<nt:edit-buttons hasNew="true" hasDelete="true"/>
				</div>
			</div>
		</nt:conditional-include>
	</nt:news-list>
</div>