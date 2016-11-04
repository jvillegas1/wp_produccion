<a href="XYZPIEZAFIJAXYZ" target="_blank"> Si no visualiza correctamente este correo haga click aquí</a>
<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>


<!doctype html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />	
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"> 
	<meta http-equiv="refresh" content="5000">
	<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">


</head>
<body>
  <%
  Date dNow = new Date();
  SimpleDateFormat ft = 
  new SimpleDateFormat ("dd/MM/yyyy");
  String currentDate = ft.format(dNow);
  %>
  <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" bgcolor="#ebebeb" style="padding-top:15px">
    <tr>
      <td align="center" valign="top" bgcolor="#ebebeb" style="background-color: #ebebeb;">

        <table border="0" width="600" cellpadding="0" cellspacing="0" class="container" bgcolor="#ffffff">
          <tr>
            <td align="left" bgcolor="#ffffff" class="container-padding" style="background-color: #ffffff;padding-left: 30px;padding-right: 30px;font-size: 13px;line-height: 20px;font-family: Helvetica, sans-serif;color: #333"><br>
              <img src="http://www.telesurtv.net/arte/CabeceraNewsLetter.jpg"><br>
              &nbsp;
              <div>
                <span style="font-weight: bold;font-size: 18px;line-height: 5px;color: #D03C0F;margin: auto;margin-top: 15px"><%=currentDate%> </span> 
                
                <a href="https://www.youtube.com/user/telesurtv" target="_blank"><img align="right" class="social" height="24" width="24" src="http://www.telesurtv.net/arte/icn-youtube.gif"></a>
                <a href="http://www.pinterest.com/telesurtv/" target="_blank"><img align="right" class="social" height="24" width="24" src="http://www.telesurtv.net/arte/icn-pinterest.gif"></a>
                <a href="http://instagram.com/telesurtv" target="_blank"><img align="right" class="social" height="24" width="24" src="http://www.telesurtv.net/arte/icn-instagram.gif"></a>
                <a href="https://plus.google.com/118206615613074383260/posts" target="_blank"><img align="right" class="social" height="24" width="24" src="http://www.telesurtv.net/arte/icn-googleplus.gif"></a>
                <a href="http://twitter.com/teleSURtv" target="_blank"><img align="right" class="social" height="24" width="24" src="http://www.telesurtv.net/arte/icn-twitter.gif"></a> 
                <a href="http://facebook.com/teleSUR" target="_blank"><img align="right" class="social" height="24" width="24" src="http://www.telesurtv.net/arte/icn-facebook.gif"></a>
              </div>
              
              
              <hr>
              <span class="titulo" style="background-color: #ff0000;font-weight: bold;font-size: 14px;line-height: 24px;color: #fff;margin-top: 15px;padding: 3px;padding-right: none"> LATINOAM&Eacute;RICA </span><br>
              &nbsp;
              <table border="0" cellpadding="0" cellspacing="0" class="columns-container">
                <tr>
                  <nt:news-list advancedfilter="(category:/system/categories/SubSecciones/news/latinaamerica/ AND category:/system/categories/SubSecciones/newsletter/) OR category:/system/categories/SubSecciones/news/latinaamerica/" order="user-modification-date" size="3">
                  <td class="force-col" style="padding-right: 20px;" valign="top">

                    
                    <table border="0" cellspacing="0" cellpadding="0" width="175" align="right" class="col-3" id="last-col-3">
                      <tr>
                       <td align="left" valign="top" style="font-size:14px; line-height: 20px; font-family: Arial, sans-serif;">
                         <nt:preview-image>												
                         <a href="http://www.telesurtv.net<nt:link/>" class="her">
                         <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                         <nt:conditional-include oncondition="${imageDescription != ''}">
                         <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='<nt:image-description/>' title='<nt:image-description/>' >
                       </nt:conditional-include>
                       <nt:conditional-include oncondition="${imageDescription == ''}">
                       
                       <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
                     </nt:conditional-include>													
                   </a>
                 </nt:preview-image>
                 <a href="http://www.telesurtv.net<nt:link/>" style="color:#1A2042; font-weight:bold; text-decoration:none !important; text-decoration:none;"><span style="color:#000000; text-decoration:none !important; text-decoration:none;"><strong><nt:title/></strong></span></a><br>&nbsp;
               </td>
             </tr>
           </table>
         </td>
       </nt:news-list>
     </tr>
   </table>

   <hr>

   <span class="titulo" style="background-color: #ff0000;font-weight: bold;font-size: 14px;line-height: 24px;color: #fff;margin-top: 15px;padding: 3px;padding-right: none"> VUELTA AL MUNDO </span><br>
   &nbsp;
   <table border="0" cellpadding="0" cellspacing="0" class="columns-container">
    <tr>
      <nt:news-list advancedfilter="(category:/system/categories/SubSecciones/news/world/ AND category:/system/categories/SubSecciones/newsletter/) OR category:/system/categories/SubSecciones/news/world/" order="user-modification-date" size="3" >
      <td class="force-col" style="padding-right: 20px;" valign="top">


        
        <table border="0" cellspacing="0" cellpadding="0" width="175" align="right" class="col-3" id="last-col-3">
          <tr>
            <td align="left" valign="top" style="font-size:14px; line-height: 20px; font-family: Arial, sans-serif;">
              <nt:preview-image>												
              <a href="http://www.telesurtv.net<nt:link/>" class="her">
              <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
              <nt:conditional-include oncondition="${imageDescription != ''}">
              
              <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='<nt:image-description/>' title='<nt:image-description/>' >
            </nt:conditional-include>
            <nt:conditional-include oncondition="${imageDescription == ''}">
            
            <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
          </nt:conditional-include>													
        </a>
      </nt:preview-image>
      <a href="http://www.telesurtv.net<nt:link/>" style="color:#1A2042; font-weight:bold; text-decoration:none !important; text-decoration:none;"><span style="color:#000000; text-decoration:none !important; text-decoration:none;"><strong><nt:title/></strong></span></a><br>&nbsp;
      
    </td>
  </tr>
</table>
</td>
</nt:news-list>
</tr>
</table>
<div> 

 <script type='text/javascript'>
 var m3_u = (location.protocol=='https:'?'https://advert.telesurtv.net/publicidad/www/delivery/ajs.php':'http://advert.telesurtv.net/publicidad/www/delivery/ajs.php');
 var m3_r = Math.floor(Math.random()*99999999999);
 if (!document.MAX_used) document.MAX_used = ',';
 document.write ("<scr"+"ipt type='text/javascript' src='"+m3_u);
 document.write ("?zoneid=133");
 document.write ('&amp;cb=' + m3_r);
 if (document.MAX_used != ',') document.write ("&amp;exclude=" + document.MAX_used);
 document.write (document.charset ? '&amp;charset='+document.charset : (document.characterSet ? '&amp;charset='+document.characterSet : ''));
 document.write ("&amp;loc=" + escape(window.location));
 if (document.referrer) document.write ("&amp;referer=" + escape(document.referrer));
 if (document.context) document.write ("&context=" + escape(document.context));
 if (document.mmm_fo) document.write ("&amp;mmm_fo=1");
 document.write ("'><\/scr"+"ipt>");
 
</script>

<noscript><a href='http://advert.telesurtv.net/publicidad/www/delivery/ck.php?n=a30a3306&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://advert.telesurtv.net/publicidad/www/delivery/avw.php?zoneid=133&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=a30a3306' border='0' alt='' /></a></noscript>

</div>

<hr>
<span class="titulo" style="background-color: #ff0000;font-weight: bold;font-size: 14px;line-height: 24px;color: #fff;margin-top: 15px;padding: 3px;padding-right: none"> DEPORTES </span><br>
&nbsp;
<table border="0" cellpadding="0" cellspacing="0" class="columns-container">
  <tr>
    <nt:news-list advancedfilter="(category:/system/categories/SubSecciones/news/sport/ AND category:/system/categories/SubSecciones/newsletter/) OR category:/system/categories/SubSecciones/news/sport/" order="user-modification-date" size="3" >
    <td class="force-col" style="padding-right: 20px;" valign="top">

      
      <table border="0" cellspacing="0" cellpadding="0" width="175" align="right" class="col-3" id="last-col-3">
        <tr>
          <td align="left" valign="top" style="font-size:14px; line-height: 20px; font-family: Arial, sans-serif;">
            <nt:preview-image>												
            <a href="http://www.telesurtv.net<nt:link/>" class="her">
            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
            <nt:conditional-include oncondition="${imageDescription != ''}">
            
            <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='<nt:image-description/>' title='<nt:image-description/>' >
          </nt:conditional-include>
          <nt:conditional-include oncondition="${imageDescription == ''}">
          
          <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
        </nt:conditional-include>													
      </a>
    </nt:preview-image>
    <a href="http://www.telesurtv.net<nt:link/>" style="color:#1A2042; font-weight:bold; text-decoration:none !important; text-decoration:none;"><span style="color:#000000; text-decoration:none !important; text-decoration:none;"><strong><nt:title/></strong></span></a><br>&nbsp;
    
  </td>
</tr>
</table>
</td>
</nt:news-list>
</tr>
</table>
<hr>
<span class="titulo" style="background-color: #ff0000;font-weight: bold;font-size: 14px;line-height: 24px;color: #fff;margin-top: 15px;padding: 3px;padding-right: none"> CULTURA </span><br>
&nbsp;
<table border="0" cellpadding="0" cellspacing="0" class="columns-container">
  <tr>
    <nt:news-list advancedfilter="(category:/system/categories/SubSecciones/news/culture/ AND category:/system/categories/SubSecciones/newsletter/) OR category:/system/categories/SubSecciones/news/culture/" order="user-modification-date" size="3" >
    <td class="force-col" style="padding-right: 20px;" valign="top">

      
      <table border="0" cellspacing="0" cellpadding="0" width="175" align="right" class="col-3" id="last-col-3">
        <tr>
          <td align="left" valign="top" style="font-size:14px; line-height: 20px; font-family: Arial, sans-serif;">
            <nt:preview-image>												
            <a href="http://www.telesurtv.net<nt:link/>" class="her">
            <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
            <nt:conditional-include oncondition="${imageDescription != ''}">
            
            <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='<nt:image-description/>' title='<nt:image-description/>' >
          </nt:conditional-include>
          <nt:conditional-include oncondition="${imageDescription == ''}">
          
          <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
        </nt:conditional-include>													
      </a>
    </nt:preview-image>
    <a href="http://www.telesurtv.net<nt:link/>" style="color:#1A2042; font-weight:bold; text-decoration:none !important; text-decoration:none;"><span style="color:#000000; text-decoration:none !important; text-decoration:none;"><strong><nt:title/></strong></span></a><br>&nbsp;
    
  </td>
</tr>
</table>
</td>
</nt:news-list>
</tr>
</table>
<hr>
<span class="titulo" style="background-color: #ff0000;font-weight: bold;font-size: 14px;line-height: 24px;color: #fff;margin-top: 15px;padding: 3px;padding-right: none"> BLOGS </span><br>
&nbsp;
<table border="0" cellpadding="0" cellspacing="0" class="columns-container">
  <tr>
    <nt:news-list order="user-modification-date" advancedfilter="(home.zone:bloguers AND category:/system/categories/SubSecciones/newsletter/) OR home.zone:bloguers" size="3" >
    <td class="force-col" style="padding-right: 20px;" valign="top">


      
      <table border="0" cellspacing="0" cellpadding="0" width="175" align="right" class="col-3" id="last-col-3">
        <tr>
          <td align="left" valign="top" style="font-size:14px; line-height: 20px; font-family: Arial, sans-serif;">
           <nt:preview-image>												
           <a href="http://www.telesurtv.net<nt:link/>" class="her">
           <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
           <nt:conditional-include oncondition="${imageDescription != ''}">
           
           <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='<nt:image-description/>' title='<nt:image-description/>' >
         </nt:conditional-include>
         <nt:conditional-include oncondition="${imageDescription == ''}">
         
         <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
       </nt:conditional-include>													
     </a>
   </nt:preview-image>
   <a href="http://www.telesurtv.net<nt:link/>" style="color:#1A2042; font-weight:bold; text-decoration:none !important; text-decoration:none;"><span style="color:#000000; text-decoration:none !important; text-decoration:none;"><strong><nt:title/></strong></span></a><br>&nbsp;
   
 </td>
</tr>
</table>
</td>
</nt:news-list>
</tr>
</table>
<hr>
<span class="titulo" style="background-color: #ff0000;font-weight: bold;font-size: 14px;line-height: 24px;color: #fff;margin-top: 15px;padding: 3px;padding-right: none"> OPINI&Oacute;N </span><br>
&nbsp;
<table border="0" cellpadding="0" cellspacing="0" class="columns-container">
  <tr>
    <nt:news-list advancedfilter="(seccion:opinion AND category:/system/categories/SubSecciones/newsletter/) OR seccion:opinion" order="user-modification-date" size="3">
    <td class="force-col" style="padding-right: 20px;" valign="top">


      
      <table border="0" cellspacing="0" cellpadding="0" width="175" align="right" class="col-3" id="last-col-3">
        <tr>
         <td align="left" valign="top" style="font-size:14px; line-height: 20px; font-family: Arial, sans-serif;">
           <nt:preview-image>												
           <a href="http://www.telesurtv.net<nt:link/>" class="her">
           <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
           <nt:conditional-include oncondition="${imageDescription != ''}">
           
           <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='<nt:image-description/>' title='<nt:image-description/>' >
         </nt:conditional-include>
         <nt:conditional-include oncondition="${imageDescription == ''}">
         
         <img itemprop="contentURL" src="http://www.telesurtv.net<nt:image-path width="175" height="130" scaletype='2'/>" class="col-3-img" width="175" height="130" alt='${news.titles[news.titleSectionNum]}' title='${news.titles[news.titleDetailNum]}' >
       </nt:conditional-include>													
     </a>
   </nt:preview-image>
   <a href="http://www.telesurtv.net<nt:link/>" style="color:#1A2042; font-weight:bold; text-decoration:none !important; text-decoration:none;"><span style="color:#000000; text-decoration:none !important; text-decoration:none;"><strong><nt:title/></strong></span></a><br>&nbsp;
   
 </td>
</tr>
</table>
</td>
</nt:news-list>
</tr>
</table>

<tr>
  <td align="left" bgcolor="#ffffff" class="container-padding" style="background-color: #d7d7d7;padding-left: 30px;padding-right: 30px;font-size: 14px;line-height: 20px;font-family: Helvetica, sans-serif;color: #333"><br>&nbsp;
    <div align="center" style="border-top: 1px solid #fff;font-weight: bold"><br>
      TeleSUR La Nueva Televisi&oacute;n del Sur C.A. (TVSUR) RIF: G-20004500-0</div>
      &nbsp;

      <div align="center"><a href="http://facebook.com/teleSUR" target="_blank"><img align="center" class="social" height="28" width="28" src="http://telesurtv.net/arte/icn-facebook.gif"></a> <a href="http://twitter.com/teleSURtv" target="_blank"><img align="center" class="social" height="28" width="28" src="http://telesurtv.net/arte/icn-twitter.gif"></a> <a href="https://plus.google.com/118206615613074383260/posts" target="_blank"><img align="center" class="social" height="28" width="28" src="http://telesurtv.net/arte/icn-googleplus.gif"></a> <a href="http://instagram.com/telesurtv" target="_blank"><img align="center" class="social" height="28" width="28" src="http://telesurtv.net/arte/icn-instagram.gif"></a> <a href="http://www.pinterest.com/telesurtv/" target="_blank"><img align="center" class="social" height="28" width="28" src="http://telesurtv.net/arte/icn-pinterest.gif"></a> <a href="https://www.youtube.com/user/telesurtv" target="_blank"><img align="center" class="social" height="28" width="28" src="http://telesurtv.net/arte/icn-youtube.gif"></a></div>
    </td></tr>
  </table>
</td>
</tr>
</table>
</body>
</html>
