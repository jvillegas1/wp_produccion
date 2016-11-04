
<%@ taglib prefix="nt" uri="http://www.tfsla.com/taglib/tfsNewsTags" %>
<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
String urlSite  = request.getScheme()+"://"+request.getServerName();
String programaGet = (request.getParameter("prog") == null ) ? "categoria" : request.getParameter("prog") ;
%>

<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
	<channel>
		<cms:contentload collector="singleFile" param="%(opencms.uri)" >
		<title><cms:contentshow element="titulo" /></title> 
		<link><%=urlSite%></link>
		<description>teleSUR - Audios - <%=programaGet%> </description>
		<copyright>2015 teleSUR. All Rights Reserved.</copyright>
		<itunes:category text="Technology">
			<itunes:category text="Gadgets"/>
		</itunes:category>

	<itunes:category text="TV &amp; News"/>
	<itunes:explicit>No</itunes:explicit>
	<cms:contentcheck ifexists="categoria">
	<category><cms:contentshow element="categoria" /></category>
</cms:contentcheck>


<c:set var="pagina" scope="page"><cms:contentshow element="pagina"/></c:set>
<c:set var="cantidad" scope="page"><cms:contentshow element="cantidad_items"/></c:set>

<c:set var="seccion" scope="page">
<cms:contentcheck ifexists="seccion"><cms:contentshow element="seccion"/></cms:contentcheck>
</c:set>
<c:choose>
<c:when test='${programaGet != "categoria"}'>
<language>es</language>

<itunes:owner>
<itunes:email>contactenos@telesurtv.net</itunes:email>
<itunes:name>teleSUR</itunes:name>
</itunes:owner>

<nt:news-list size="1" order="modification-date" section="audio" tags="<%=programaGet%>" state="publicada">
<nt:preview-image>
<itunes:image href="http://www.telesurtv.net/<nt:image-path />" />
</nt:preview-image>
<pubDate><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/> -0430</pubDate>
</nt:news-list>


<nt:news-list size="100" order="modification-date" section="audio" tags="<%=programaGet%>" state="publicada">
<item>
	<title><![CDATA[<nt:title/>]]>	</title>
	<link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
	<description><![CDATA[<nt:sub-title/>]]></description>
	<nt:categories>
	<nt:conditional-include onposition="first">
	<category><![CDATA[<nt:category-description/>]]></category>
</nt:conditional-include>
</nt:categories>

<nt:audio>
<enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:audio-path />" type="audio/mpeg" length="12216320"></enclosure>
<guid isPermaLink="false"><%=request.getScheme()+"://"+request.getServerName()%><nt:audio-path /></guid>
</nt:audio>

<pubDate><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/></pubDate>

<nt:authors>	
<author><![CDATA[<nt:author-name/>]]></author>
</nt:authors>

</item>
</nt:news-list>
</c:when>
<c:otherwise>
<nt:news-list size="100" order="modification-date" section="audio" category="telesur_noticias" state="publicada">

<item>
	<title><![CDATA[<nt:title/>]]></title>

	<link><%=request.getScheme()+"://"+request.getServerName()%><nt:link/></link>
	<description><![CDATA[<nt:sub-title/>]]></description>
	<nt:categories>
	<nt:conditional-include onposition="first">
	<category><![CDATA[<nt:category-description/>]]></category>
</nt:conditional-include>
</nt:categories>
<pubDate><nt:last-modified format="d MMM yyyy" /></pubDate>

<nt:audio>
<enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:audio-path />" type="audio/mpeg" length="12216320"></enclosure>
<guid isPermaLink="false"><%=request.getScheme()+"://"+request.getServerName()%><nt:audio-path /></guid>

</nt:audio>
<pubDate><nt:last-modified format="EEE, d MMM yyyy HH:mm:ss "/> -0430</pubDate>

<nt:authors>	
<author><![CDATA[<nt:author-name/>]]></author>
</nt:authors>
<nt:preview-image>
<enclosure url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path/>" type="image/jpeg"><![CDATA[<nt:image-description/>]]></enclosure>           	
<thumbnails  url="<%=request.getScheme()+"://"+request.getServerName()%><nt:image-path width="360" height="295" scaletype="2"/>" type="image/jpeg"></thumbnails>
</nt:preview-image >


</item>
</nt:news-list>
</c:otherwise>
</c:choose>

</cms:contentload>

</channel>

</rss>