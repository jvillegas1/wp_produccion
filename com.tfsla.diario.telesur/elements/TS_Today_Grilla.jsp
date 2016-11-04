
<%@ include file="TS_Common_Libraries.jsp" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>
<html>
<head>

	<cms:include page="../elements/TS_Common_Head.jsp" >
		<cms:param name="template">blog</cms:param>
	</cms:include>        	
	<script type="text/javascript">
		function cargarMasNotas(_proxPag, _category, _title, _size){
			
			div = "#bloque_" + _proxPag;
			paginador = "#paginador";
			
			jQuery(paginador).hide();
		       
			$.post("/system/modules/com.tfsla.diario.telesur/elements/TS_Common_NavigationTopic.jsp",
				{ pagina:_proxPag, category:_category, title:_title, size:_size }, function(data){
				$(div).html(data);
			});  
		}	
	</script>

	
 
</head>

<body>
<div class="tagsBar">
<cms:include page="../elements/TS_Common_Header.jsp" >
		<cms:param name="pageTitle">Blogs</cms:param>
		<cms:param name="pageSeccion">blogs</cms:param>
		<cms:param name="agenda">no</cms:param>
		<cms:param name="subMenu">no</cms:param>
		<cms:param name="latest">no</cms:param>       
	</cms:include>


	

     
    <c:import var="xmlDoc" url="http://telesur.cms-medios.com/xml/parrilla.xml"/>     
    <x:parse var="parsedDocument" xml="${xmlDoc}"/>
  <div class="cont">
  </div>
   <!-- telesur SCHEDULE -->
    <div class="row clear">  
    	<div class="col">
        <div class="topsche">
        	<div class="toplsch cont">
       	 	 <img src="images/telesurazul.png" width="309" height="35" alt="">
            </div> 
          <div class="toprsch cont">
          Time Zone <select class="sel1" id="select1">
                              <option>EST</option>
                            </select>
          </div>
        </div>
        
        
        
        
      </div> 
  <div class="cont-tab">
        	<ul class="idTabs newtabw">
                     	<div class="tabnew">
                        <li><a href="#22">Today 22 Oct</a></li>
                        <li><a href="#23">Tuesday 23 Oct</a></li>
                        <li><a href="#24">Wednesday 24 Oct</a></li>
                        <li class="desktop"><a href="#25">Thursday 25 Oct</a></li>
                        <li class="desktop"><a href="#26">Friday 26 Oct</a></li>
                        <li class="desktop"><a href="#27">Saturday 27 Oct</a></li>
                        <li class="desktop"><a href="#28">Sunday 28 Oct</a></li>
                        </div>
                </ul>
        	<ul>
            	<li>
            		<div class="scheduleback">
                    	<div class="schedule1">
                        <div class="sleft">     
			        <x:forEach select="$parsedDocument/root/semana/lunes/programas/programa">			       
		                        <div class="sright">
                            	            <div class="simg1 desktop"><a href="#" class="her"><img src="<x:out select="foto" />" width="301" height="169" alt=""></a></div>
			                    <div class="stitle"><a href="#" class="her"><x:out select="nombre" /></a></div>
                                            <div class="saut"> with <a href="#" class="her">Mario Vasco</a></div>
                                            <div class="scont desktop"><x:out select="sinopsis" /></div>
                                            <div class="sextra desktop"><img src="images/telexcl.png" width="130" height="17" alt=""> </div>
                                 </x:forEach>
                        </div>   
                        </div>
                        </div>
                  </li>  
		  </ul>	     
       </div> 
    </div>
	
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
   
   

