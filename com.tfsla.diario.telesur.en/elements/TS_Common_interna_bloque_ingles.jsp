<%@ include file="TS_Common_Libraries.jsp"%>
<% 
   String template = (request.getParameter("template") != null ) ? request.getParameter("template") : "News";
   org.opencms.jsp.CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
   String uri = cms.getRequestContext().getUri();
%>

<div class="cont"> 
	<div class="cxenseINT"> 
    		<div id="cx_7145773dc2f79464f0a49490dd08cc1fa2db6350" style="display:none"></div>
		<script type="text/javascript">
		    var cX = cX || {}; cX.callQueue = cX.callQueue || [];
		    cX.callQueue.push(['insertWidget', {
		        widgetId: '7145773dc2f79464f0a49490dd08cc1fa2db6350',
		        insertBeforeElementId: 'cx_7145773dc2f79464f0a49490dd08cc1fa2db6350',
		        width: 290, height: 1003, renderTemplateUrl: 'auto'
		    }]);
		
		    // Async load of cx.js
		    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
		    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
		    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
		</script>
	</div>
	
	<div class="redesINT"> 
		<script type='text/javascript' src='//dsms0mj1bbhn4.cloudfront.net/assets/pub/shareaholic.js' data-shr-siteid='79181583964337ffb1ff71a90ee9c654' data-cfasync='false' async='async'></script>
		<div class='shareaholic-canvas' data-app='follow_buttons' data-app-id='23925799'></div>		
	</div>
</div>
<div class="banners cont">
		<cms:include page="TS_Common_Banners.jsp">
			<cms:param name="template"><%=template %></cms:param>
			<cms:param name="key">Advert-300x250-a</cms:param>
		</cms:include>
</div>  