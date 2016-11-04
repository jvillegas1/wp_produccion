<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ page language="java" import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
     
<link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/css.css"/>

<%
    String AudioPath = (request.getParameter("audio") == null ) ? "telesur-noticias" : request.getParameter("audio") ;
    String Imagen = (request.getParameter("imagen") == null ) ? "http://www.telesurtv.net/arte/sinFoto_170x105.jpg" : request.getParameter("imagen") ;
    String Titulo = (request.getParameter("titulo") == null ) ? "audio-telesur" : request.getParameter("titulo") ;
       Titulo = new String(Titulo.getBytes("ISO8859_1"), "UTF-8");
    String Category = (request.getParameter("category") == null ) ? "Lo mejor del día" : request.getParameter("category") ;
%>
<!doctype html>
<html>
    <head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
        <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="http://jwpsrv.com/library/Cs7H6hH+EeWttA4AfQhyIQ.js"></script>
       
    </head>
    <body>

        <div class="wrap notaAgenda wrapAudio">				
            <div class="nworldtop cont">
                <span class="itacaput" itemprop="articleSection">	
                </span>																											
                <div class="capcredit" itemprop="publisher">
                </div>
            </div>
            <div class="vworldtop cont">
                <div class="mediaNota" style="background-image: url('/arte/audio/TelesurNoticias_930x350.jpg');background-repeat: no-repeat; background-size: cover;  min-height: 115px;">
                    <div id="fotos">
                        <div class="wpImgNA12">
                            <div itemscope="" class=".itemscope" itemtype="http://schema.org/ImageObject">             
                                <img src="<%=Imagen%>" alt="Smiley face" height="75" width="75"/>
                                <div class="caption" content="Imagenes para contenidos">
                                </div>
                            </div>
                        </div>
                        <div class="wpDataNA" style="  padding:15px 4px 0px 0px !important;">
                            <span class="breadcrumb">
                                <strong>
                                    <span class="itacaput" itemprop="articleSection">   
                                        <div class="blue"><span class="caAudi1"> <%=Category%></span>
                                            <img class="play" itemprop="contentURL" src="/arte/play.png" width="35" height="35" alt="" title="">   <a class="her"><h1 class="fonttitle hc1" itemprop="name headline"><%=Titulo%></h1></a>                                            	
                                        </div>           
                                    </span>
                                </strong>
                            </span>
                        </div>  
                        <span class="date">
                            <div id="Audios"></div>
                            <div class="capdate" itemprop="datePublished">
                            </div>
                        </span>              
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