<%@ include file="TS_Common_Libraries.jsp" %>

 <div class="block resultados">
    	<div class="col">
      	<div class="cont conttitle">
        	<h6>Argentina Results</h6>
        </div>
    
        	<div class="flexslider2 carousel">
        	<div class="flex-viewport2" style="overflow: hidden; position: relative;">
              <ul class="slides2">
              <nt:person-list state="1" tipo="personas/argentina_Decide/" >
                <li>
                <div class="data">
                 <div class="imagenr">                	
                  <a href="http://www.telesurtv.net/english/index.html">   <h2 class="h2r"><nt:person-name /><br>(<nt:person-shortdescription />)</h2></a>
                </div>
                </div>
               <div class="imagenr">                	
                   <a href="http://www.telesurtv.net/english/index.html"> <img src="<nt:person-image width='270' height='150' scaletype='2' />" width="270" height="150" /></a>
                </div>
                <!--<a href="#" class="her">-->
                  	 <div class="captionr">
                  	 <div class="votes" style="width:<nt:person-custom2 />;"></div>
                  	 <span class="porcentual"><nt:person-custom2 /></span>
                  	 </div>
                 <!--</a>-->
 
                 </li>

                    </nt:person-list>          
              </ul>  
              </div> <!--flex viwport-->
              
			</div>
            
        </div>
      </div>  
      

 



                    
                   
                    
 