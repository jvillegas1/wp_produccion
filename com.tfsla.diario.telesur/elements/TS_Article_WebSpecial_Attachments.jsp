<%@ include file="TS_Common_Libraries.jsp" %>
<!--Begin de las Documentos Adjuntos -->  
<nt:news>
    <!--Caso 1: Inicio  Uno solo elemento Adjunto -->  
    <nt:conditional-include oncondition="${news.filescount == 1 }">			
        <h7>Documento</h7>
    </nt:conditional-include>
    <!--Caso 1: Fin Uno solo elemento Adjunto -->  
    <!--Caso 2: Inicio N  elementos Adjuntos N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->
    <nt:conditional-include oncondition="${news.filescount > 1 }">
        <h7>Documentos</h7>
    </nt:conditional-include>
    <!--Caso 2: Fin N  elementos Adjuntos N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->    
    <div class="margensep"></div>
    <!--Inicio Procedimiento que incluye 1 o  N  elementos Adjuntos. N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->
    <div class="files" id="espAdjuntos">
        <nt:conditional-include >
            <ul>
                <nt:files>
                    <li>											  <!--Se aplica las mejores practicas de imagenes -->  
                        <a href="<nt:file-path/>" alt="<nt:file-title/>" title="<nt:file-title/>" target="_blank"><cms:img src="/arte/IconosPDF.jpg" />&nbsp;<span style="color: #044EAA;"><nt:file-title/></span></a>
                    </li>
                    <div class="margensepinterno"></div>
                </nt:files>										
            </ul>
        </nt:conditional-include>
    </div>
    <!-- Fin Procedimiento que incluye 1 o  N  elementos Adjuntos. N: Significa tener la cantidad que necesitan no esta limitada. desde 2 hasta el infinito -->	
</nt:news>
<!--End de las Documentos Adjuntos -->  
									