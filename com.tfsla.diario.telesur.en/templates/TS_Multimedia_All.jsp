<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<!doctype html>
<html>
    <head>
    <cms:include page="../elements/TS_Common_Head.jsp" >
            <cms:param name="template">multimedia</cms:param>
        </cms:include>    
</head>
<body>   
<cms:include page="../elements/TS_Common_Header.jsp" >            
    <div class="subMenu">
        <cms:param name="pageTitle">teleSUR - Multimedia</cms:param>
        <cms:param name="pageSeccion">multimedia</cms:param>
        <cms:param name="subMenu"></cms:param>
    </div> 
    <div class="diaryHead"> 
        <cms:param name="agenda">si</cms:param>
        <cms:param name="latest">si</cms:param>
    </div>
</cms:include> 
<cms:include page="../elements/TS_Common_LiveBox.jsp"></cms:include>  	
<section>           
 
  <div class="wrap multimedia">
        <div class="boxMmd">
            <cms:include page="../elements/TS_Multimedia_All.jsp">
            <cms:param name="destacada">destacadawebspecial</cms:param>
             	<cms:param name="category">webspecial</cms:param>
                <cms:param name="titulo">Specials</cms:param>
                <cms:param name="etiqueta">Special</cms:param>
                <cms:param name="nombre">index</cms:param>               
            </cms:include>
            <div id="reload-listado">
                <cms:include page="../elements/TS_Common_Listado_Multimedia_All.jsp">					
                    <cms:param name="category">webspecial</cms:param>                    
                </cms:include>
            </div>
            <cms:include page="../elements/TS_Multimedia_All.jsp">
            	<cms:param name="destacada">galleries</cms:param>
             	<cms:param name="category">galleries</cms:param>
		<cms:param name="titulo">Galleries</cms:param>
		<cms:param name="etiqueta">Gallery</cms:param>
		<cms:param name="nombre">index</cms:param>
		<cms:param name="imagen">i-imgs</cms:param>				
            </cms:include>
            <div id="reload-listado">
                <cms:include page="../elements/TS_Common_Listado_Multimedia_All.jsp">					
                    <cms:param name="category">galleries</cms:param>		   
                </cms:include>
            </div>
            <cms:include page="../elements/TS_Multimedia_All.jsp">
            <cms:param name="destacada">destacadainfografic</cms:param>
             	<cms:param name="category">infographics</cms:param>
		<cms:param name="titulo">Infographics</cms:param>
		<cms:param name="etiqueta">Infographic</cms:param>
		<cms:param name="nombre">index</cms:param>					
            </cms:include>
            <div id="reload-listado">
                <cms:include page="../elements/TS_Common_Listado_Multimedia_All.jsp">					
                    <cms:param name="category">infographics</cms:param>		    
                </cms:include>
            </div>            
        </div>     
        <div class="banners">
            <cms:include page="../elements/TS_Common_Banners.jsp">
                <cms:param name="template">Multimedia</cms:param>
                <cms:param name="key">Advert-728x90-c</cms:param>
            </cms:include>
        </div>          
    </div>         
</section>   	       
<cms:include page="../elements/TS_Common_Footer.jsp"></cms:include> 
</body>
</html>