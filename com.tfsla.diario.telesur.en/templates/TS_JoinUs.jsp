<%@ include file="../elements/TS_Common_Libraries.jsp" %>

<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">joinus</cms:param>
	</cms:include>        		
	
</head>

<body>

	<div id="iframeBox">
	   	<div class="wpClose">
			<a class="close" style="cursor:pointer;" alt="Close" title="Close"><p style="float: right; padding:10px; display:inline-block; color:white">Close</p></a>
		</div>
		<div class="wpIframe"></div>
	</div>

	<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Join Us</cms:param>
		<cms:param name="pageSeccion">joinus</cms:param>
		<cms:param name="agenda">si</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>    
     
	<!-- Container -->
	<div id="container">
	<cms:include page="../elements/TS_Common_LiveBox.jsp" />
		<div class="wrapper"><!--wrapper--> 
		  	
			<!-- Banner 1 -->
			<div class="row clear marginchica"> 
				<div class="banners pos0">				
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">JoinUs</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>					
				</div>
				<div class="bannerMobile">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">JoinUs</cms:param>
						<cms:param name="key">Advert-468x60-a-mobile</cms:param>
					</cms:include>
				</div>      
			</div>
			    
		    	<div class="row clear">   
				<div class="col-mid">				
					<cms:include page="../elements/TS_JoinUs_Videos.jsp" />
		          		
		          		<cms:include page="../elements/TS_JoinUs_Facebook.jsp" />		          												
		          	</div>
		          	<div class="col-mid">		          	          		
		          		<cms:include page="../elements/TS_JoinUs_Twitter.jsp" />					
				</div>
				<div class="row clear"> 
					<div class="col-mid">
						<cms:include page="../elements/TS_JoinUs_Comments.jsp" />						
          				</div>
          				<div class="col-mid">         				
          					<cms:include page="../elements/TS_JoinUs_Pictures.jsp" />          					
          				</div>	           	
				</div>
			</div>
			
			<div class="separador margensep"></div>
			
			<div class="row clear"> 
				<div class="banners">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">JoinUs</cms:param>
						<cms:param name="key">Advert-728x90-a</cms:param>
					</cms:include>
				</div>  
			</div>
			
			<div class="separador margensep"></div>
			
			<div class="row clear"> 
				<div class="col-mid">					
					<cms:include page="../elements/TS_JoinUs_Survey.jsp" /> 
					
					<cms:include page="../elements/TS_JoinUs_Quizes.jsp" /> 
				</div>
				<div class="col-mid">
					<div class="rowInt">
						<cms:include page="../elements/TS_JoinUs_Story.jsp" />	
					</div>
					<div class="rowInt">
          					<div class="cont">
							<div class="txtformju">
								<div class="titboxju rojo">Get in Touch</div>
								<div class="txtstoryju">
									Do you have a story or a photo you want to share? Or if you know of a story you think we’d be interested in featuring, 
									<a href="mailto:telesurenglish@telesurtv.net?subject=Feedback" class="rojo"> please contact us - heres how</a>
								</div>
								<div class="txtstoryju"></div>
							</div>
						</div>    
					</div>
				</div>
			</div>
			
			<div class="separador margensep"></div>
			
			<div class="row clear"> 
				<div class="banners">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">JoinUs</cms:param>
						<cms:param name="key">Advert-728x90-b</cms:param>
					</cms:include>
				</div>  
			</div>
			
			<div class="separador margensep"></div>
			
			<div class="row clear"> 
				<div class="col">
					<cms:include page="../elements/TS_JoinUs_Forum.jsp" />	  	
				</div>  
			</div>
			
			<!-- Banners -->  		
			<div class="row clear">				 
				<div class=" col-mid ">
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-a</cms:param>
							</cms:include>
						</div>
					</div>
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-b</cms:param>
							</cms:include>
						</div>
					</div>   
				</div>
			
				<div class=" col-mid ">
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-c</cms:param>
							</cms:include>
						</div>
					</div>
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-d</cms:param>
							</cms:include>
						</div>
					</div>   
				</div>
			</div>
			  
			<div class="row clear desktop"> 
				<div class=" col-mid ">
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-e</cms:param>
							</cms:include>
						</div>
					</div>
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-f</cms:param>
							</cms:include>
						</div>
					</div>   
				</div>
			
				<div class=" col-mid ">
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-g</cms:param>
							</cms:include>
						</div>
					</div>
					<div class=" col-mid">
						<div class="cont">
							<cms:include page="../elements/TS_Common_Banners.jsp">
								<cms:param name="template">JoinUs</cms:param>
								<cms:param name="key">Show-Promotion-460x260-h</cms:param>
							</cms:include>
						</div>
					</div>   
				</div>
			</div>
			
		</div><!--wrapper-->
	</div><!--conteiner-->
	
	
	<cms:include page="../elements/TS_Common_Footer.jsp" />
	
</body>
<script type="text/javascript">
<!-- script menu -->
var menu = 0
$('#header .btnMobile').click(function(){
	if(menu == 0){
		$('#nav').slideDown(750);	
		menu++
	}else{			
		$('#nav').slideUp( 750, function() {
			$('#nav').removeAttr('style');
		  });
		menu--
	}
});
</script>
</html>