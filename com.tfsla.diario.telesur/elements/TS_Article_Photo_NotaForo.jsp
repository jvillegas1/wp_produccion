<%@ include file="TS_Common_Libraries.jsp" %>
<nt:news>
	<div class="headEspecial">
		<nt:conditional-include oncondition="${news.homePreview == 'imagen'}">
			<div itemprop="image" itemscope itemtype="http://schema.org/ImageObject" style="height:420px">
				<nt:preview-image>
					<c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
					<nt:conditional-include oncondition="${imageDescription != ''}">
						<meta itemprop="description" content='<nt:image-description/>'>	
						<img itemprop="contentURL" src="<nt:image-path width='100%' height='274' scaletype='2'/>" alt="<nt:image-description/>" />
					</nt:conditional-include>
					<nt:conditional-include oncondition="${imageDescription == ''}">
						<meta itemprop="description" content='${news.titles[news.titleHomeNum]}'>
						<img itemprop="contentURL" src="<nt:image-path width='100%' height='274' scaletype='2' />" alt='${news.titles[news.titleHomeNum]}'/>
					</nt:conditional-include>
				</nt:preview-image>				
			</div>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.homePreview == 'iframe'}">
		<nt:iframe/>
		</nt:conditional-include>
		<nt:conditional-include oncondition="${news.imagepreviewset == 'false' && news.homePreview == 'imagen'}">
			<cms:img src="/arte/sinFoto_420x260.jpg" width="100%" height="400" alt="<nt:title value='home'/>"  />
		</nt:conditional-include>
	
</nt:news>