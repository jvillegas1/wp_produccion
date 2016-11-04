<%
    /**
    *  Search Form
    *
    *
    */
%>

<%@ include file="TS_Common_Libraries.jsp" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

String search_form = ( request.getParameter("search_form") != null ) ? request.getParameter("search_form") : "";
String filter_form = ( request.getParameter("filter_form") != null ) ? request.getParameter("filter_form") : "";
String published_form = ( request.getParameter("published_form") != null ) ? request.getParameter("published_form") : "";
String section_form = ( request.getParameter("section_form") != null ) ? request.getParameter("section_form") : "";
String filter_autor = (request.getParameter("filter_autor") != null ) ? request.getParameter("filter_autor") : "-----" ;  
String autor = request.getParameter("autor");
%>
<div class="blueBar">
	<form name="buscador" class="formSearch1" action="/english/searchOpinion.html" method="post">    	
		<div class="wrapper">
			<div class="row clear">
				<div class="col">
					<div class="cont">
	
						<div class="contesel change1" >
							<div class="filasel" >
								<div class="txtsel">Search:</div>
								<input type="text" name="search_form" value="<%=search_form %>" class="contsearch1"> 
								<input id="subscribe" class="Mobile" type="submit" value="Search" name="submit">
							</div>
						</div>
	
						<div class="contesel">
							<div class="filasel">
								<div class="txtsel">Filter by:</div>
								<select class="sel" id="filter" data-val="<%=filter_form %>" name="filter_form">
									<option value="" >All sections	</option>
									<option value="articles" >Articles</option>
									<option value="interviews" >Interviews</option>
								                 
								</select>
							</div>
						</div>
	
						<div class="contesel  sclear" >
							<div class="filasel">
								<div class="txtsel">Published:</div>
								<select class="sel" id="published" data-val="<%=published_form %>" name="published_form">
									<option value="" >All dates</option>                            
									<option value="7d" >Last week</option>                                                          
									<option value="30d" >Last month</option>
									<option value="1y" >Last year</option>
								</select>
							</div>
						</div>
	
						<div class="contesel change2" >
							<div class="filasel" >
								<div class="txtsel">Author:</div>
							                   
							                    <div class="contesel">
							                      <div class="filasel" id="filasel">
							                       		<cms:include page="TS_Opinion_Author.jsp"/>
							                      </div>
							                  </div>
							                    
							                  
								<div class="desktop">
									<input id="subscribe" type="submit" class="subscribeSearch" value="Search" name="submit">
								
								</div>
							</div>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">	
	$(document).ready(function(){	
		
		$('#filter').on('change',function(e){
			var myselectFilter = $(this).val();
			


			cambiaAutor(myselectFilter);	
		});
	
		function cambiaAutor(myselectFilter){
			
		
			if (myselectFilter == 'interviews') {
				$('#autor').attr('disabled',true);
				$('#autor > option[value="0"]').attr('selected', 'selected');
			} else{
				$('#autor').removeAttr('disabled');
			}
		}
				
	});
</script><!-- fin blueBar -->

<script type="text/javascript">
    var valor="";
        if($("#published").data('val')!=""){
            valor = $("#published").data('val');
            $("#published option[value="+ valor +"]").attr("selected",true);        
        }
    valor="";
        if($("#autor").data('val')!=""){
            valor = $("#autor").data('val');
            $("#autor option[value="+ valor +"]").attr("selected",true);        
        }
        
   valor="";
        if($("#filter").data('val')!=""){
            valor = $("#filter").data('val');
            $("#filter option[value="+ valor +"]").attr("selected",true);        
        }     
        
    valor="";
        if($("#section").data('val')!=""){
            valor = $("#section").data('val')
            $("#section option[value="+ valor +"]").attr("selected",true);        
        }        
        
</script>