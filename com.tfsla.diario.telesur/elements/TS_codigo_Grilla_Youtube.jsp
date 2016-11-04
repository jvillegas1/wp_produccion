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

<style type="text/css">

.video {
   position: relative;
   padding-bottom: 100%;
   overflow: hidden;
}
	.video iframe{
    position: absolute;
    display: block;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}


	</style>
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
	           <div id="grilla-superior">
		   	<div class="col-3qua">   					
			    <div class="cont">
			        <div class="dest">
			            <div class="img-shows">
			                <div class="txtshow-over desktop">
			                    <div class="title"></div>
			                    <div class="date"></div>
			                    <div class="likeshow"></div>
			                </div>
			                <a class="her" href="#">
			                     <!--<cms:include page="Live_Streaming.Code.jsp" />	-->
			                     <div class="video">
						
						     <iframe width="640" height="360" src="https://www.youtube.com/embed/3NPYmDXXCSU" frameborder="0" allowfullscreen></iframe>
						
					</div>	                     
			                
			                     <cms:include page="TS_Descripcion.jsp" />	
			                  
			                  <div><h1><b>Señal en vivo telesur</b></h1></div>
			                  
			                  <div class="video">
						
						     <iframe width="100%" height="100%" src="http://test.telesur.ultrabase.net/" frameborder="0" allowfullscreen></iframe>
						
					</div>	    
			                     		               
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
		    
		     <!-- <div class="row clear">
		      <div class="col">
		        <div class="conttitle">
		          <div class="cont">
		            <div class="tituloazul">Programas Futuros</div>
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
		    </div>-->
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
			</div>
		</div>
	</div>                         
                            <div class="banners">
					<cms:include page="../elements/TS_Common_Banners.jsp">
						<cms:param name="template">Home</cms:param>
						<cms:param name="key">Advert-728x90-c</cms:param>
					</cms:include>
		            </div>
		            
		           
		            