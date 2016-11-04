<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%
    String AudioPath = (request.getParameter("audio") == null ) ? "telesur-noticias" : request.getParameter("audio") ;
    String Imagen = (request.getParameter("imagen") == null ) ? "telesur-noticias" : request.getParameter("imagen") ;
    String Titulo = (request.getParameter("titulo") == null ) ? "audio-telesur" : request.getParameter("titulo") ;
%>
<!doctype html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
        <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="http://jwpsrv.com/library/Cs7H6hH+EeWttA4AfQhyIQ.js"></script>
        <link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/css.css"/>
    </head>
    <body>
        <div class="wrap notaAgenda">				
            <div class="nworldtop cont">
                <span class="itacaput" itemprop="articleSection">	
                </span>																											
                <div class="capcredit" itemprop="publisher">
                </div>
            </div>
            <div class="vworldtop cont">
                <div class="mediaNota" style="background-image: url('/arte/audio/TelesurNoticias_930x350.jpg');background-repeat: no-repeat; background-size: cover;">
                    <div id="fotos">
                        <div class="wpImgNA1">
                            <div itemscope="" class=".itemscope" itemtype="http://schema.org/ImageObject">             
                                <cms:img itemprop="contentURL" src="<%=Imagen%>" alt="Smiley face" height="300" width="300"/>
                                <div class="caption" content="Imagenes para contenidos">
                                </div>
                            </div>
                        </div>
                        <div class="wpDataNA">
                            <span class="breadcrumb">
                                <strong>
                                    <span class="itacaput" itemprop="articleSection">   
                                        <div class="blue">
                                            <img class="play" itemprop="contentURL" src="/arte/play.png" width="50" height="50" alt="" title="">   <a class="her"><h1 class="hc1" itemprop="name headline"><%=Titulo%></h1></a>	
                                            <div id="Audios"></div>						
                                        </div>           
                                    </span>
                                </strong>
                            </span>
                            <span class="date">
                                <div class="capdate" itemprop="datePublished">
                                </div>
                            </span>
                        </div>                
                    </div>     
                </div>                             
            </div>
        </div>
        <script>
        var playerInstance = jwplayer("Audios");
        playerInstance.setup({
        file: "<%=AudioPath%>",
        width: "100%",
        height: 30
        });					   
        </script>
    </body>
</html>