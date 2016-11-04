<%@ taglib prefix="nt" uri="http://www.tfsla.com/taglib/tfsNewsTags" %>
<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
String urlSite  = request.getScheme()+"://"+request.getServerName();

String tag = (request.getParameter("tag") == null ) ? "" : request.getParameter("tag") ;

<?xml version="1.0" encoding="UTF-8"?>
 
<rss version="2.0">
 
<channel>
 
 <cms:contentload collector="singleFile" param="%(opencms.uri)" >
 
    <title><cms:contentshow element="titulo" /></title>
    <link><%=urlSite%></link>         
    <c:set var="pagina" scope="page"><cms:contentshow element="pagina"/></c:set>
    <c:set var="cantidad" scope="page"><cms:contentshow element="cantidad_items"/></c:set>
<nt:polls-box  tags="<%=tag%>" order="creation-date"  state="active" group="Sumario" style="TS-ES/ESPECIAL"> 
      <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
     <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss Z" /></pubDate>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path />" type="image/jpeg">
           <attribution>
                   <credit><![CDATA[<nt:image-source />]]></credit>
	           <copyright><![CDATA[teleSUR]]></copyright>	           
	        <caption><![CDATA[<nt:image-description/>]]></caption>
	    </attribution>    
	  </enclosure>      
     </nt:preview-image >
 
     <nt:video-flash>
            <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:video-path/>" type="video/x-flv"><![CDATA[<nt:video-title/>]]></enclosure>
     </nt:video-flash>
 
     <nt:authors>	
         <author><![CDATA[<nt:author-name/>]]></author>
     </nt:authors>
 
     <content><![CDATA[<nt:body />]]></content>
      </item>
</nt:polls-box>
 
 
 </cms:contentload>
 
</channel>
 
</rss>