<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<% 
String newsPath = request.getParameter( "path" ); 
%> 
<nt:news path="<%=newsPath%>"> 
<!doctype html>
<html ⚡>
<head>
    <meta charset="utf-8">
    <title><nt:title value="detail" />|<nt:section-description/>|teleSUR</title>
    <link rel="canonical" href="www.telesurtv.net<nt:link/>">
    <style amp-custom>

        @import url(https://fonts.googleapis.com/css?family=Acme);
        body {
            margin: 0;
            font-family: 'Georgia', Serif;
            overflow-x: hidden;
            position: relative;
        }

        h1 {
            width: 90%;
            font-family: "PostoniStandardBold", Georgia, serif;
            font-size: 30px;
            font-weight: normal;
            margin: 0px auto;
            margin-bottom: 20px;
            line-height: 1.1em;
            word-spacing: -.02em;
            color: #000000;
        }

        p {
            width: 90%;
            margin: 0px auto;
            font-family: Georgia,serif;
            font-size: 16px;
            margin-bottom: 20px;
            color: #000000;
            line-height: 1.5em;
        }

        a {
            color: #2C6CB4;
            line-height: 1.5em;
            bottom-border: 1px #d5d5d5;
            text-decoration: none;
        }

        .pad-bottom {
            margin-bottom: 20px;
        }

        .ad-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }


        .content-container {
            width: 100%;
            max-width: 600px;
            min-height: 600px;
            margin: 0 auto;
        }

        .masthead {
            width: 100%;
            display: block;
            text-align: center;
            position: relative;
            z-index: 3;
        }



        /**stylos**/
        body {
            background-color: #f0f0f0;
        }

        * {
            font-family: 'Slabo 27px', Serif;
        }

        p {
            font-family: 'Lato';
            color: #333;
            size: 18px;
        }

        .lightbox {
            background: #333;
        }

        .lightbox-content {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
        }

        .lightbox amp-img {
            width: 100%;
        }

        .lightbox-content p {
            color: #fff;
            padding: 15px;
        }

        .header-image {
            position: absolute;
            margin-left: -86px;
            margin-top: -50px;
        }

        .amp-header-image{
            position: relative;
            background-color: #000;
        }

        .amp-content {
            padding: 20px;
            margin: 0px auto;
            display: flex;
            align-items: center;
        }

        .amp-article{
            width: 100%;
            max-width: 600px;
            min-height: 600px;
            margin: 0 auto;
        }

        .ad-container {
            text-align: center;
            margin: 20px;
        }

        .content {
            display: flex;
            justify-content: center;
        }

        .title-section {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0,0,0,0.5);
            padding: 15px;        
        }
        .title-section amp-img {
            border-radius: 50%;
        }
        .title-section h1 {
            color: #fff;
        }

        .section {
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px 0px 0px;
            box-shadow: 0 2px 2px #ccc;
            border-top: 10px solid #F37022;
        }


        /**stylos*/
        @media (min-width: 1024px){
            .tablethead{
                margin-left: 0px !important;
            }
        }
        @media (min-width: 768px) {
            .masthead {
                margin-bottom: 5%;
            }
            .mobilehead{ display: none; 
            }
            .tablethead{margin-left: -107px;
            }
        }

        .subhead, h2, h3, h4, h5, h6 {
            width: 90%;
            margin: 0px auto;
            display: block;
            font-family: Georgia,serif;
            font-size: 16px;
            margin-bottom: 20px;
            color: #000000;
            line-height: 1.5em;
            font-weight: 700;
        }
        .tit-photo {
            font-size: 29px;
            font-weight: bold;
            line-height: 0.7em !important;

        }

        .intro {
            display: block;
            font-family: "FranklinITCProLight","Myriad Set Pro", "Lucida Grande", "Helvetica Neue", "Helvetica", "Arial", "Verdana", "sans-serif";
            font-size: 16px;
            margin-bottom: 16px;
            line-height: 1.1em;
            color: #2a2a2a;
        }

        .center {
            text-align: center;
        }

        .carousel-caption {
            font-family: "FranklinITCProLight";
            font-size: 10pt;
            color: #6a6a6a;
            overflow: auto;
            text-align: left;
        }

        .line {
            width: 25%;
            margin-left: 5%;
        }

        .footer-background {
            width: 100%;
            background-color: rgb(87, 84, 84);
            padding: 20px 0px;
        }

        .footer-container {
            font-family: "FranklinITCProLight";
            max-width: 600px;
            margin: 0 auto;
        }

        .footer-link:link,.footer-link:visited {
            font-family: "FranklinITCProLight";
            font-size: 10pt;
            line-height: 20px;
            color: #ffffff;
            text-decoration: none;
        }
        .btnLang, .btnLangmenu{
            border: 1px solid rgba(172,172,172,0.3);
            color: #fff;
            position: absolute;
            font-size: 14px;
            width: 50px;
            text-align: left;
            border-radius: 3px;
            cursor: pointer;
            float: left;
            padding: 7px 10px;
            background: #fff
        }
        .btnLangmenu{
            width: 60px;
        }
        .btnFooter{
            position: relative;
            width: 304px;
            padding: 10px 130px 40px 117px;
            color: #fff;
            margin-left: -78px
        }
        .btnMenu{
            margin-left: -108px !important;
            width: 60px !important;
        }
        .btnLang a, .btnLangmenu a {
            color: #1C2036 !important;
            font-weight: bold;
            text-align: center !important;
        }



        .border-container {
          padding-top: 6px;
          padding-bottom: 6px;
      }

      .right-border {
          border-right: 1px solid #f0f0f0;
          padding: 6px 4%;
      }

      .fa {
          display: inline-block;
          font: normal normal normal 14px/1 FontAwesome;
          font-size: 1.6em;
          text-rendering: auto;
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;
      }



      .navButton, .navClose { position: absolute; top: 0; left: 0; z-index: 3; background-color: transparent; border: none; outline: none; color: #fff; font-size: 30px; line-height: 1.5em; text-align: left; display: block; padding: 5px 0 0 10px; cursor: pointer;}
      .navClose { z-index: -1; visibility: hidden; }
      .navButton:focus { opacity: 0; }
      .navFrame { background-color: rgb(87, 84, 84); border: 0; padding: 0; margin: 0; position: absolute; top: 0; left: 0; width: 385px; min-height: 100%; box-sizing: border-box; z-index: 2; text-align: left; display: block; transform: translateX(-390px); -webkit-transform: translateX(-390px); transition: transform 500ms cubic-bezier(0, 1,0,1); }
      .sitenav {  width: 385px; position: absolute; top: 45px; right: 0; transform: translateX(-150px); -webkit-transform: translateX(-150px); transition: transform 500ms cubic-bezier(0, 1,0,1); }
      #navscrim {position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; z-index: 1; background-color: #999; opacity: 0; transition: opacity 250ms cubic-bezier(0, .67,0,.67); pointer-events: none; }

      .content-container,
      .footer-background {
       transition: transform 250ms cubic-bezier(0, .67,0,.67);
       transform-origin: 50% 0%;
   }
   .navButton:focus ~ .navFrame {
       transform: translateX(-85px);
       -webkit-transform: translateX(-85px);
   }

   .navButton:focus ~ .navFrame .sitenav {
       transform: translateX(0);
       -webkit-transform: translateX(0);
   }

   .navFrame:active,
   .navButton:focus ~ .navClose {
       z-index: 3;
       visibility: visible;
   }
   .navFrame:active ~ .content-container,
   .navButton:focus ~ .content-container,
   .navFrame:active ~ .footer-background,
   .navButton:focus ~ .footer-background {
       transform: scale(0.98) translateX(5px);
       -webkit-transform: scale(0.98) translateX(5px);
   }

   .navFrame:active ~ #navscrim,
   .navButton:focus ~ #navscrim,
   .navFrame:active ~ #navscrim,
   .navButton:focus ~ #navscrim {
       opacity: 0.75;
       pointer-events: auto;
   }


   .side-nav {
    font-size: 16px;
    font-family: 'Open Sans', sans-serif;
    list-style: none;
    padding-left: 115px;
}

.sitenav .side-nav li {
    list-style-type: none;
    line-height: 1.1em;
    font-size: 14px;
}

.sitenav .side-nav li a {
 width: auto;
 display: inline-block;
 color: #f7f7f7;
 padding: 3px 6px 3px 6px;
}

#sections-menu-off-canvas {
}

#sections-menu-off-canvas li {
    margin-bottom: 10px;
}

#sections-menu-off-canvas li a {
    font-family: 'Acme', sans-serif;
    font-size: 14px;
    font-weight: bold;
    text-transform: none;
    color: #f7f7f7;
    text-decoration: none;
    width: auto;
    border-radius: 4px
}

#site-attribution-off-canvas-menu {
    border-top: 1px solid rgba(255,255,255,0.1);
    padding-top: 20px;
    margin: 0;
}

#site-attribution-off-canvas-menu li {
    font-size: 14px;
}

#site-attribution-off-canvas-menu li a {
    text-decoration: none;
    font-family: "FranklinITCProLight", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;
}

#site-attribution-off-canvas-menu li:last-child {
    padding-bottom: 50px;
}
.site-attribution{
    list-style-type: none;
}
.most-read {
    width:90%;
    margin:0 auto;
}
.most-read .label-kicker {
    font-size: 1rem;
    font-family: "FranklinITCProBold", "HelveticaNeue", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
}
.most-read .title:before {
    width: 2rem;
    background-color: #2A2A2A;
    content: "";
    display: block;
    height: 0.25rem;
    margin-bottom: 0.625rem;
}
.most-read .def-feed {
    font-family: "FranklinITCProLight", "HelveticaNeue", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    margin-bottom: 5px;
    list-style: none;
    padding: 15px;
    padding: 15px;
    border: 1px solid #e9e9e9;
    border-bottom-color: #d5d5d5;
    border-bottom-width: 2px;
    border-radius: 4px;
}

.most-read .def-feed > li {
    counter-increment: feed-item;
    position: relative;
    padding: 10px 0 10px 0;
}

.most-read .def-feed > li + li {
    border-top: 1px solid #ccc;
}

.most-read .def-feed .number {
    font-size: 22px;
    color: #000000;
    position: absolute;
    top: 10px;
    left: 0;
    padding-top: 0;
    font-family: "FranklinITCProBold", "HelveticaNeue", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
}

.most-read .headline {
    color: #000000;
    font-size: 15px;
    font-weight: normal;
    line-height: 18px;
    display: inline-block;
    margin: 0px 70px 0px 25px;
    min-height: 60px;
}
.most-read .def-feed a {
    text-decoration: none;
    display: flex;
    flex-direction: row;
}
.most-read .def-feed a > amp-img {
    flex-shrink: 0;
    position: absolute;
    right: 0px;
}

/**custon*/
.blue-box, .red-box, .green-box {
  width: 100%;
  height: 209px;
  margin-bottom: 13%;
}
.blue-box {
  background: #fff;
}
.green-box {
  background: green;
}
.red-box {
  background: red;
}
.amp-tit-relacionada {
 color: #FFF;
 background: rgba(0,0,0,0.5);
 font-size: 16px;
 padding: 20px 15px;
 z-index: 9;
 line-height: 18px;
 width: calc(100% - 31px);
 margin-top: calc(100% - 395px);
 position: relative;
}
.lightbox amp-img {
  width: 100%;
}

.image{
    margin-left: 10px;  
}
.image img {
    width: 100%;
}
</style>
<meta name="amp-3p-iframe-src" content="">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no,minimal-ui">
<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
<script type="application/ld+json">
  {
    "@context": "http://schema.org",
    "@type": "NewsArticle",
    "mainEntityofPage": "",
    "headline": "Kasich: ‘My Republican Party doesn’t like ideas’",
    "datePublished": "2016-04-21T00:49:00",
    "dateModified": "2016-04-21T13:46:33",
    "description": "Ohio governor puts forward conservative agenda, opposes D.C. vote",
    
    "image": {
        "@type": "ImageObject",
        "url": "",
        "width": 3000,
        "height": 2001
    },
    
    "author": {
        "@type": "Person",
        "name": "David Weigel"
    },
    "publisher": {
        "@type": "Organization",
        "name": "The Washington Post",
        "logo": {
            "@type": "ImageObject",
            "url": "",
            "width": 344,
            "height": 60
        }
    }
}
</script>
<script custom-element="amp-twitter" src="https://cdn.ampproject.org/v0/amp-twitter-0.1.js" async></script>
<script custom-element="amp-youtube" src="https://cdn.ampproject.org/v0/amp-youtube-0.1.js" async></script>
<script custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js" async></script>
<script custom-element="amp-audio" src="https://cdn.ampproject.org/v0/amp-audio-0.1.js" async></script>
<script custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js" async></script>
<script custom-element="amp-iframe" src="https://cdn.ampproject.org/v0/amp-iframe-0.1.js" async></script>
<script custom-element="amp-image-lightbox" src="https://cdn.ampproject.org/v0/amp-image-lightbox-0.1.js" async></script>
<script src="https://cdn.ampproject.org/v0.js" async></script>
</head>
<body>
    <header class="masthead">
        <a href="www.telesurtv.net"><amp-img src="/arte/bg_top2.jpg" width="1906" height="55"/></a>   
        <a href="www.telesurtv.net" class="header-image"><amp-img src="/arte/logo-tipo-telesur_brand.png_1578350673.png" width="160" height="27"/></a>     
    </header> 

    <a class="navButton" tabindex="0">☰</a> <span class="navClose" tabindex="0">☰</span>
    <button class="navFrame">
        <nav id="main-sections-nav" class="sitenav">
            <ul id="sections-menu-off-canvas" class="side-nav">
               <li class="main-nav"> <a class="main-nav-item" href="/seccion/news/index.html">Noticias</a></li>
               <li class="main-nav"> <a class="main-nav-item" href="http://videos.telesurtv.net/">Videos</a></li>
               <li class="main-nav"> <a class="main-nav-item" href="/seccion/multimedia/index.html">Multimedia</a></li>
               <li class="main-nav"> <a class="main-nav-item" href="/seccion/opinion/index.html">Opinión</a></li>
               <li class="main-nav"> <a class="main-nav-item" href="/seccion/blog/index.html">Blog</a></li>
               <li class="main-nav"> <a class="main-nav-item" href="/seccion/imreporter/index.html">Soy Reportero</a></li>
           </ul>
           <ul id="site-attribution-off-canvas-menu" class="side-nav site-attribution">
               <li>
                   <div class="btnFooter btnMenu">
                    <div class="btnLangmenu">
                        <a href="/english/index.html">English</a> 
                    </div>  
                </div>
            </li>
        </ul>
    </nav>
</button>
<button id="navscrim"></button>

<!-- nota amp-->


<div itemscope itemtype="http://schema.org/Article">
    <meta itemprop='isFamilyFriendly' content='True'/>
    <meta itemprop='url sameAs' content='<nt:link/>'/>
    <meta itemprop="interactionCount" content="UserComments:${news.commentcount}"/>

    <!-- imagen prew -->

    <nt:preview-image>
    <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">             
        <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
        <c:set var="imageSource" scope="page"><nt:image-source/></c:set>    
        <nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">                   
        <c:set var="imageFull" scope="page"><nt:image-path/></c:set>
        <c:set var="imageDescriptionContent" scope="page"><nt:image-description/> | Foto: <nt:image-source/></c:set>
    </nt:conditional-include>
    <nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">                   
    <c:set var="imageFull" scope="page"><nt:image-path/></c:set>
    <c:set var="imageDescriptionContent" scope="page"><nt:image-description/></c:set>
</nt:conditional-include>
<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
<c:set var="imageDescriptionContent" scope="page"><nt:image-description/> | Foto: <nt:image-source/></c:set>
<c:set var="imageFull" scope="page"><nt:image-path/></c:set>
</nt:conditional-include>
<nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
<meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
<c:set var="imageFull" scope="page"><nt:image-path/></c:set>
</nt:conditional-include>   
</div>
</nt:preview-image> 

<header class="amp-header-image">
   <amp-img
   src="${imageFull}"
   srcset="${imageFull} 1x,${imageFull} 2x"
   layout="responsive" width="360" placeholder
   heights="(min-width:1420px) 20%, (min-width:1320px) 25%, (min-width:1000px) 60%, (min-width:760px)  75%, (min-width:500px) 100%, 85%"
   alt="${imageDescriptionContent}"
   height="216" on="tap:headline-img-lightbox">
</amp-img>
</header>


<!-- fin imagen prew -->

<div class="amp-content">    
  <article class="amp-article">
    <div class="section">
      <h2><nt:title value="detail"/></h2>
      <amp-lightbox id="lightbox" class="lightbox" layout="nodisplay">

      <nt:conditional-include oncondition="${news.hideCopete == 'false'}">
      <div class="subtitle" itemprop="description alternativeHeadline"><nt:sub-title/></div>                                        
  </nt:conditional-include>

  <div class="txt_newworld" itemprop="articleBody">                                                                   
    <nt:body-splitter>
    <nt:polls-dynamic-position style="TS-ES/NOTA"> </nt:polls-dynamic-position>         
    <c:set var="bodyP" scope="page"><nt:body-paragraph/></c:set>
    <%-- Verificar si El parrafo contiene un Iframe, que a su vez sea un Video de Youtube, modifica sus atributos. Coloca que  pertenece a la clase:'vid-youtube', height='100%' y width='100%' --%> 
    <%String bodyParagrahp=pageContext.getAttribute("bodyP").toString();
    String bodyPa="";
    if((bodyParagrahp.contains("<iframe ")) && (bodyParagrahp.contains("youtube"))){ 
    bodyParagrahp=bodyParagrahp.replace("height="," class='vid-youtube' height=");                                              
    String[] cortos= bodyParagrahp.split(" ");
    for (int i = 0; i < cortos.length; i++) {
    if (cortos[i].contains( "height=")) {
    cortos[i]="height='100%'";
}
if (cortos[i].contains( "width=")) {
cortos[i]="width='100%'></iframe></p>";
}
bodyPa=bodyPa+" "+ cortos[i];
}
bodyParagrahp=bodyPa;
} 
%>

<%=bodyParagrahp%>                                
</nt:body-splitter>                                                                         
</div>



</div>


<!-- Pictures -->
<div class="section">
  <cms:include page="../elements/TS_Article_AMP_Multimedia.jsp" />

</div>


<!-- related news -->
<div class="section">
  <cms:include page="../elements/TS_Article_AMP_RelatedNews.jsp" />
</article>  
</div>


<!-- fin nota amp -->

<footer class="footer-background">
    <div class="footer-container">
       <div class="btnFooter">
        <div class="btnLang">
            <a href="/english/index.html">English</a> 
        </div>  
    </div>
    <ul class="site-attribution">
       <li><a class="footer-link" href="/pages/sobrenosotros.html">La Nueva Televisión del Sur C.A. (TVSUR) </a></li>
       <li><a class="footer-link" href="/pages/sobrenosotros.html">RIF: G-20004500-0</a></li>
       <li><a class="footer-link" href="/pages/sobrenosotros.html">© 2014 Telesur</a></li>
       <li><a class="footer-link" href="/pages/CatalogoServicios.html">Catálogo de Servicios</a></li>
       <li><a class="footer-link" href="/pages/terminosdeuso.html">Terminos de uso</a></li>
   </ul>
</div>
</footer>
</body>
</html>
</nt:news>