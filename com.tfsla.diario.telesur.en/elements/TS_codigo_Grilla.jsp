<%@ include file="TS_Common_Libraries.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


	<script>
            function send(sdia, all, tz) {            
	    	$("#grilla").load( 'helper.html?day=' + sdia + '&all=' + all + '&tz=' + tz  );
            }
            
            function changeTimeZone(sdia, all){
            	var index = document.getElementById("selectTimeZones").selectedIndex;
		var text = document.getElementById("selectTimeZones").options;
                $("#grilla").load( 'helper.html?day=' + sdia + '&all=' + all + '&tz=' + text[index].value );
                $("#header-parrilla").load( 'helper_header.html?day=' + sdia + '&all=' + all + '&tz=' + text[index].value );
    	    }
    		
    	    setInterval(function() {$("#header-parrilla").load( 'helper_header.html')},300000);
        </script>

<script>
    $(document).ready(function () {
        $("#tit-svivo").addClass("menuA savivoAct");
        $("#btn-svivo").addClass("savivoAct");
        $("#svivo2").html('<cms:include page="Live_Streaming.Code.jsp" />');


        if ((screen.width >= 320) && (screen.width <= 980)) {
            $("#btn-svivo").addClass("savivoAct");
        }
        else {
         

        }


        //señal en vivo
        $("#btn-svivo").click(function () {
		$("#svivo2").html('<cms:include page="Live_Streaming.Code.jsp" />');
		$("#saudio").html("");
		$("#tit-svivo").addClass("menuA savivoAct");
		$("#tit-saudio").removeClass("menuA savivoAct");
		$("#tit-svivo").addClass("menuA savivoAct");
		$("#btn-svivo").addClass("savivoAct");
		$("#btn-saudio").removeClass("menuA savivoAct");
		$("#svivo2").addClass("video");
		$("#saudio").css({height: "0px"});
	            if ((screen.width >= 320) && (screen.width <= 980)) {
	                $("#btn-svivo,#tit-svivo").addClass("savivoAct");
	                $("#btn-saudio,#tit-saudio").removeClass("savivoAct");
	            }
        });

        //solo audio
        $("#btn-saudio").click(function () {
            $("#saudio").html("");
            $("#saudio").append('<cms:include page="Live_Streaming_Code_SoloAudio.jsp" />');
            $("#svivo2").html("");
            $("#tit-saudio").addClass("menuA savivoAct");
            $("#tit-svivo").removeClass("menuA savivoAct");
            $("#btn-svivo").removeClass("savivoAct");
            $("#btn-saudio").addClass("savivoAct");
            $("#svivo2").removeClass("video");
            $("#saudio").css({height: "295px"});
	            if ((screen.width >= 320) && (screen.width <= 980)) {
	                $("#btn-saudio,#tit-saudio").addClass("savivoAct");
	                $("#btn-svivo").removeClass("savivoAct");
	            }
        });
    });
</script>


 <div id="container">
            <div class="wrapper">                
            <div class="row clear">
		<div class="separador"></div>
	          <div class="banners adv970">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Home</cms:param>
						<cms:param name="key">Advert-950x90</cms:param>
					</cms:include>
	           </div> 
	           <div class="separador"></div>
	           <div  id="grilla-superior">
		   	<div  id="grilla-superior-streming" class="col-3qua">   					
			    <div class="cont">
			        <div class="dest">
			            <div class="img-shows">
			                <div class="txtshow-over desktop">
			                    <div class="title"></div>
			                    <div class="date"></div>
			                    <div class="likeshow"></div>
			                </div>
			                  <!--menu solo audio-->
		                                <ul class="soloaudio">
		                                    <li class="soloaudioli">
		                                        <a id="btn-svivo" href="#"><img src="/export/sites/telesur/arte/ico-en-vivo.png" width="18" height="18" alt=""></a> <span id="tit-svivo">Live</span>
		                                    </li>
		                                    <li class="soloaudioli">
		                                        <a  id="btn-saudio" href="#"><img src="/arte/AUDIO_.png" width="18" height="18" alt=""></a> <span id="tit-saudio">Audio Only</span>
		                                    </li>
		                                </ul>
		                                <!--Fin menu solo audio-->
		                            <div class="saudiovivo">
	                                    <div id="saudio"></div>
	                                </div>
	                                <a id="svivo" class="her"	 href="#">
	                                    <%-- <cms:include page="Live_Streaming.Code.jsp" />		--%>                     
						 <div id="svivo2" class="video">
					</div> 		                     
			                
			                     <cms:include page="TS_Descripcion.jsp" />			               
			                </a> 
			            </div>
			            <div class="blue bold1 desktop"></div>
			            <p class="txtno desktop"></p>
			        </div>
			    </div>
			 </div>    
			 <div class="col-qua">   					
			    <div id= "header-parrilla" class="cont"> 
                		<cms:include page="../templates/TS_Common_Header_Parrilla.jsp" />
                	    </div>
                	</div>	 
                   </div>
		</div>
		
		
		<div class="separador"></div>	
			<!-- Future Shows -->
		    <!--
		      <div class="row clear">
		      <div class="col">
		        <div class="conttitle">
		          <div class="cont">
		            <div class="tituloazul">Future Shows</div>
		          </div>
		          
		          <nt:news-list order="priority desc, user-modification-date desc" onmainpage="section" section="joinus" zone="streaming" size="4">
		              <nt:conditional-include oncondition="${newslist.position < 5}">
		              <nt:conditional-include oncondition="${newslist.position < 2}">
		              	<div>
		            		<ul>
			    	 </nt:conditional-include>
			              <li style="width: 25%; float: left;">
			                <div class="cont"> <iframe width="100%" src="<nt:generic-news-value element="HTTP_Stream"/>" frameborder="0" allowfullscreen></iframe>
			                  <div class="titfutur"> <a href="#" class="her"></a> </div>
			                </div>
			              </li>
		            <nt:conditional-include oncondition="${newslist.position == 4}">
		            </ul>
			  </nt:conditional-include>
			  </nt:conditional-include>		   
		        </nt:news-list>
		          </div>        
		        </div>
		      </div>
		    </div>
		    -->
		    <!-- fin Future Shows -->
			
			    
			<!--<div class="separador"></div>-->
			<div class="banners">
						<cms:include page="../elements/TS_Common_Banners.jsp">
							<cms:param name="template">Home</cms:param>
							<cms:param name="key">Advert-728x90-a</cms:param>
						</cms:include>
			</div>
			<div class="separador"></div>	
                
                               	
	                <div id="grilla"> 
				<cms:include page="../templates/TS_Codigo_Grilla_Helper.jsp" />
				
				
				<%-- include de html de la grilla de domingo 26 octubre --%>
				<%-- <cms:include page="../templates/GrillaDomingo26_ingles.jsp" /> --%>
				
			</div>
		</div>
	</div>                         
                            <div class="banners">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Home</cms:param>
						<cms:param name="key">Advert-728x90-c</cms:param>
					</cms:include>
		            </div>
		            