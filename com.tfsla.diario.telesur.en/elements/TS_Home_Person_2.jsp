<%@ include file="TS_Common_Libraries.jsp" %>
    <div class="block resultados">
        <div class="col">
            <div class="cont conttitle">
                <h6>Argentina Results</h6>
            </div>
            <nt:person-list state="1" size="2" tipo="personas/argentina_Decide/">
                <div class="boxP"> 	                

                    <div class="ImgElec">


                        <a href="" title="">	

                            <img src="<nt:person-image scaletype='2'/>"/>
                        </a>	

                    </div>

                    <div class="overflow">
                        <h3><a href="" alt="" title=""> </a><nt:person-name /><br>(<nt:person-shortdescription />)</h3>	

                        <p >Results
                        <c:set var="divisor"></c:set>

                        <a href="" class="autor" alt="" title=""> 
                            ${divisor} 
                        </a>

                        </p>

                        <div class="captionr">
                            <div class="votes" style="width:<nt:person-custom2 />;"></div>
                            <span class="porcentual"><nt:person-custom2 /></span>
                        </div>


                    </div>
                </div>

            </nt:person-list>       
        </div>
    </div>