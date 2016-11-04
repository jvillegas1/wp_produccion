<%@ taglib prefix="nt" uri="http://www.tfsla.com/taglib/tfsNewsTags" %>
<%@ include file="../elements/TS_Common_Libraries.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
String urlSite  = request.getScheme()+"://"+request.getServerName();
%>
<?xml version="1.0" encoding="UTF-8"?>
 
<rss version="2.0">
 
<channel>
 
 <cms:contentload collector="singleFile" param="%(opencms.uri)" >
 
    <title><cms:contentshow element="titulo" /></title>
    <link><%=urlSite%></link>
 
           <cms:contentcheck ifexists="descripcion">
              <description><cms:contentshow element="descripcion" /></description>
           </cms:contentcheck>
 
           <cms:contentcheck ifexists="categoria">
       <category><cms:contentshow element="categoria" /></category>
    </cms:contentcheck>
 
    <c:set var="pagina" scope="page"><cms:contentshow element="pagina"/></c:set>
    <c:set var="cantidad" scope="page"><cms:contentshow element="cantidad_items"/></c:set>
 
    <c:set var="seccion" scope="page">
      <cms:contentcheck ifexists="seccion"><cms:contentshow element="seccion"/></cms:contentcheck>
    </c:set>
 
    <c:choose>
  <c:when test='${pagina == "home"}'>
 <nt:news-list order="priority,modification-date" onmainpage="home" size="${cantidad}" >
      <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
     <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path />" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
           <thumbnails  url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path width="360" height="295" scaletype="2"/>" type="image/jpeg"></thumbnails>
     </nt:preview-image >
 
     <nt:video-flash>
            <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:video-path/>" type="video/x-flv"><![CDATA[<nt:video-title/>]]></enclosure>
     </nt:video-flash>
 
     <nt:authors>	
         <author><![CDATA[<nt:author-name/>]]></author>
     </nt:authors>
 
     <content><![CDATA[<nt:body />]]></content>
      </item>
 </nt:news-list>
  </c:when>
 
  <c:otherwise>
 <nt:news-list order="priority,modification-date" onmainpage="section" section="${seccion}" size="${cantidad}" >
   <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
     <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path />" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
           <thumbnails  url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path width="360" height="295" scaletype="2"/>" type="image/jpeg"></thumbnails>
     </nt:preview-image >
 
     <nt:video-flash>
            <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:video-path/>" type="video/x-flv"><![CDATA[<nt:video-title/>]]></enclosure>
     </nt:video-flash>
 
     <nt:authors>	
         <author><![CDATA[<nt:author-name/>]]></author>
     </nt:authors>
 
     <content><![CDATA[<nt:body />]]></content>
      </item>
 </nt:news-list>
  </c:otherwise>
    </c:choose>
 
 </cms:contentload>
 
</channel>
 
</rss>