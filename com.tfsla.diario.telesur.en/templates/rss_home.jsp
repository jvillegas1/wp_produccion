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
 <nt:news-list order="priority DESC ,user-modification-date DESC" onmainpage="home" size="${cantidad}" >
      <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
  <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
           <thumbnails  url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path width="360" height="295" scaletype="2"/>" type="image/jpeg"></thumbnails>
     </nt:preview-image >
 
     <nt:video-flash>
            <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:video-path/>" type="video/x-flv"><![CDATA[<nt:video-title/>]]></enclosure>
     </nt:video-flash>
 
     <nt:authors>	
         <author><![CDATA[<c:set var="internalUser" scope="page">
	              	<nt:author-internaluser/></c:set>
			<c:if test="${internalUser != ''}">
			<nt:user username="${internalUser}">
				<nt:user-firstname/> <nt:user-lastname/>								
			</nt:user></c:if>]]>
	 </author>	
     </nt:authors>
 
     <content><![CDATA[<nt:body />]]></content>
      </item>
 </nt:news-list>
  </c:when>
 
  <c:otherwise>
  
<nt:news-list order="priority asc,user-modification-date" zone="destacada" onmainpage="home" size="1" >
   <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 
	<nt:news-list order="priority desc,user-modification-date desc" zone="destacada_secundaria" onmainpage="home" size="3" publication="9" >
     <item>
<a href="http://www.telesurtv.net/english/section/news/index.html"><h6>Latest News</h6></a>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list order="user-modification-date" onmainpage="home" zone="zona_mixta" size="9" publication="9" > 
      <item>
<a href="http://www.telesurtv.net/english/section/news/index.html"><h6>Latest News</h6></a>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list advancedfilter="seccion:news AND NOT home.zone:destacada AND NOT home.zone:destacada_secundaria AND NOT home.zone:ultimas" order="user-modification-date desc" size="3" publication="9">
  <item>
<a href="http://www.telesurtv.net/english/section/news/index.html"><h6>Latest News</h6></a>
     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list zone="latinaamerica_carousel" onmainpage="home" order="priority asc,user-modification-date desc">
  <item>

     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list zone="enimagenes" order="priority asc,user-modification-date desc" onmainpage="home">
   <item>

     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list zone="world_carousel" onmainpage="home" order="priority asc,user-modification-date desc">
    <item>

     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list order="priority asc, user-modification-date desc" section="opinion" zone="opinion" onmainpage="home">
     <item>

     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
  <nt:news-list order="priority asc, user-modification-date desc" section="analysis" size="5">
   <item>

     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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
 <nt:news-list category="/system/categories/SubSecciones/news/sport/" size="6" order="user-modification-date desc">
   <item>

     <title><![CDATA[<nt:title/>]]></title>
     <link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
 <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd.MM.yy" /></pubDate>
     <lastTime><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></lastTime>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
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