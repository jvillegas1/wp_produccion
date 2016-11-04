<%@ include file="../elements/TS_Common_Libraries.jsp" %> 
<%
String link = (request.getParameter("link") == null ) ? "" : request.getParameter("link") ;
%>

<div class="barra-wrap" >
		<div class="share-bar">
			<ul>
				<li>
					<div class="gblogrs">
						<div class="num"><span class="fb-comments-count" data-href="http://www.telesurtv.net<%=link%>"</span></div>			
						<cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments" /> 										
					</div>
				</li>
				<li>
					<a class="barra-coment" href="#comsup"  alt="Comments" title="Comments" >
					<div class="share-desc">Comments</div>
					</a>
				</li>
			</ul>
			<div class="barra-addthis-contador">
				
		            <div class="addthis_sharing_toolbox"></div>
			    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55269af806f45371" async="async"></script>	      
		            <script type="text/javascript">var addthis_share = { url_transforms : { shorten: { twitter: 'bitly'} }, shorteners : { bitly : {login:'telesur',apiKey:'R_8925c37a76786f9a5620d8c3f0f9e65c'} }}</script>
			    <script type="text/javascript">var addthis_config = {"data_track_clickback":false};</script>
			</div>
		</div>
		
		<div class="fontlinks">
		<a href="javascript:increaseFontSize();"><cms:img src="/arte/font_size_up.png" width="21" height="21" title="Increases text size"  alt="Increases text size"/></a> - <a href="javascript:decreaseFontSize();"><cms:img src="/arte/font_size_down.png" width="21" height="21" title="Decreases text size" alt="Decreases text size" /></a>
		</div>
</div>