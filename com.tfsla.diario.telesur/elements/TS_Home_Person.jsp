<%@ include file="TS_Common_Libraries.jsp" %>


 <div class="block resultados">
    	<div class="col">
      	<div class="cont conttitle">
        	<h6>Resultados Perú</h6>
        </div>
    
        	<div class="flexslider2 carousel">
        	<div class="flex-viewport2" style="overflow: hidden; position: relative;">
              <ul class="slides2">
              <nt:person-list state="1" tipo="personas/Peru_decide/" >
                <li>
                <div class="data">
                 <div class="imagenr">                	
                  <a href="http://www.telesurtv.net/">   <h2 class="h2r"><nt:person-name /><br>(<nt:person-shortdescription />)</h2></a>
                </div>
                </div>
               <div class="imagenr">                	
                   <a href="http://www.telesurtv.net/"> <img src="<nt:person-image width='270' height='150' scaletype='2' />" width="270" height="150" /></a>
                </div>
                <!--<a href="#" class="her">-->
                  	 <div class="captionr">
                  	 <div class="votes" style="width:<nt:person-custom2 />;"></div>
                  	 <span class="porcentual">Resultado 1: <nt:person-custom1 /></span></br>
                  	 <span class="porcentual">Resultado 2: <nt:person-custom2 /></span>
                  	 </div>
                 <!--</a>-->
 
                 </li>

                    </nt:person-list>          
              </ul>  
              </div> <!--flex viwport-->
              
			</div>
            
        </div>
      </div>  
      

 



                    
                   
                    
 