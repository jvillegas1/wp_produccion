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
 <nt:news-list advancedfilter="(seccion:news OR seccion:blog OR seccion: opinion)" order="user-modification-date desc" size="50">

      <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link>http://www.telesurtv.net<nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
     <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd MMMM yyyy HH:mm:ss"/></pubDate>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path />" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
     </nt:preview-image >
 
     <nt:video-flash>
            <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:video-path/>" type="video/x-flv"><![CDATA[<nt:video-title/>]]></enclosure>
     </nt:video-flash>
 
     <nt:authors>	
         <author><![CDATA[<c:set var="internalUser" scope="page">
	              	<nt:author-internaluser/></c:set>
			<c:if test="${internalUser != ''}">
			<nt:user username="${internalUser}">
				<nt:user-firstname/> &nbsp <nt:user-lastname/>								
			</nt:user></c:if>
			<c:if test="${internalUser == ''}">
			<meta itemprop="name" content="<nt:author-name/>"/>
			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
			</c:if>	]]>
	 </author>	
     </nt:authors>
 
     <content><![CDATA[<nt:body />]]></content>
      </item>
 </nt:news-list>
  </c:when>
 
  <c:otherwise>
<nt:news-list advancedfilter="(seccion:news OR seccion:blog OR seccion: opinion)" order="user-modification-date desc" size="50">
   <item>
     <title><![CDATA[<nt:title/>]]></title>
     <link>http://www.telesurtv.net<nt:link/></link>
     <description><![CDATA[<nt:sub-title/>]]></description>
     <category><![CDATA[<nt:section-description/>]]></category>
     <pubDate><nt:last-modified format="dd MMMM yyyy HH:mm:ss"/></pubDate>
 
     <nt:preview-image>
           <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path />" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>
     </nt:preview-image >
 
     <nt:video-flash>
            <enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:video-path/>" type="video/x-flv"><![CDATA[<nt:video-title/>]]></enclosure>
     </nt:video-flash>
 
     <nt:authors>	
         <author><![CDATA[<c:set var="internalUser" scope="page">
	              	<nt:author-internaluser/></c:set>
			<c:if test="${internalUser != ''}">
			<nt:user username="${internalUser}">
				<nt:user-firstname/> &nbsp <nt:user-lastname/>								
			</nt:user></c:if>
			<c:if test="${internalUser == ''}">
			<meta itemprop="name" content="<nt:author-name/>"/>
			<a style="width: auto" class="her" alt="<nt:author-name/>" title="<nt:author-name/>"><nt:author-name/></a>
			</c:if>	]]>
	 </author>	
     </nt:authors>
 
     <content><![CDATA[<nt:body />]]></content>
      </item>
 </nt:news-list>
  </c:otherwise>
    </c:choose>
 
 </cms:contentload>
 
</channel>
 
</rss>