<%@ include file="TS_Common_Libraries.jsp" %>

<% 
String template = ( request.getParameter("template") != null ) ? request.getParameter("template") : "HomeWorld-1";
String category = "";

Map Blocks = new HashMap();


//define las jsp configurables en la home
Blocks.put("Ultimas Noticias","TS_Home_LastNews.jsp");
Blocks.put("Video","TS_Home_Video.jsp");
Blocks.put("Destacamos","TS_Home_Destacamos.jsp");
Blocks.put("America Latina","TS_Home_AmericaLatina.jsp");
Blocks.put("En Imagenes", "TS_Home_InPictures.jsp");
Blocks.put("Mundo", "TS_Home_Mundo.jsp");
Blocks.put("Corresponsales","TS_Home_Corresponsales.jsp");
Blocks.put("Opinion / Blogueros","TS_Home_Opinion_Blogueros.jsp");
Blocks.put("Analisis","TS_Home_Analisis.jsp");
Blocks.put("Audio","TS_Home_Audios.jsp");
Blocks.put("Agenda Telesur","TS_Home_AgendaTelesur.jsp");
Blocks.put("Soy Reportero / Foros","TS_Home_Voices.jsp");
Blocks.put("Deportes","TS_Home_Deportes.jsp");

//define bloques dinamicos que no estan en el home inicialmente
Blocks.put("Publicidad-950x90","TS_Home_Publicidad.jsp");
Blocks.put("Publicidad-728x90-a","TS_Home_Publicidad_a.jsp");
Blocks.put("Publicidad-728x90-b","TS_Home_Publicidad_b.jsp");
Blocks.put("Publicidad-728x90-c","TS_Home_Publicidad_c.jsp");
Blocks.put("Publicidad-728x90-d","TS_Home_Publicidad_d.jsp");
Blocks.put("Publicidad-300x250","TS_Home_Publicidad_DS.jsp");
Blocks.put("Bloque Dinamico","TS_Home_Bloque_Dinamico.jsp");
Blocks.put("Datafactory","TS_Home_Datafactory.jsp");
Blocks.put("Encuesta-1","TS_Home_BoxEncuesta.jsp");
Blocks.put("Encuesta 2 / Foros","TS_Home_Voices_EF.jsp");
Blocks.put("Encuesta 2 / Soy Reportero","TS_Home_Voices_ES.jsp");
Blocks.put("Resultado de Elecciones","TS_Home_Person_2.jsp");
Blocks.put("Resultados Elecciones", "TS_Home_Person.jsp");

//define las jsp configurables en la columna de la derecha
Blocks.put("Banner300x300","TS_Common_Banners.jsp");
Blocks.put("Boletines","TS_Common_Newsletter.jsp");
Blocks.put("Equipo","TS_Common_Equipo.jsp");
Blocks.put("Titulares por Pais","TS_Common_headlinesByCountry.jsp");
Blocks.put("Rankings por Pais","TS_Country_Ranking.jsp");
Blocks.put("Agenda y Especiales","TS_Common_Agenda.jsp");
Blocks.put("Rankings Noticias","TS_Common_Ranking.jsp");
Blocks.put("Rankings SoyReportero","TS_SoyReportero_Ranking.jsp");
Blocks.put("Noticias Relacionadas","TS_Article_RelatedStories.jsp");
Blocks.put("Perfil Blogger","TS_Article_Profile.jsp");
Blocks.put("Comentarios Populares","TS_Blogs_PopularComments.jsp");
Blocks.put("Ranking Blogs","TS_Blogs_Ranking.jsp");
Blocks.put("Ranking Opinion","TS_Opinion_Ranking.jsp");
Blocks.put("Widget Deportes","TS_Common_Widget_Deportes.jsp");
Blocks.put("No Mostrar","TS_Common_Empty.jsp");
Blocks.put("no_mostrar","TS_Common_Empty.jsp");
Blocks.put("Comentarios Populares","TS_Analisis_Pupular_Comments.jsp");
Blocks.put("Videos Interna","TS_Article_Worldpage_Video.jsp");
Blocks.put("Blogs Interna","TS_Article_Worldpage_Blogs.jsp");
//Analisis

Blocks.put("Ranking Analisis","TS_Analisis_Ranking.jsp");

//Agenda
Blocks.put("Destacamos Agenda","TS_Agenda_Destacamos.jsp");
Blocks.put("Soy Reportero","TS_Agenda_SoyReportero.jsp");
Blocks.put("Especiales Web Agenda","TS_Agenda_Especiales.jsp");
Blocks.put("Corresponsales Agenda","TS_Agenda_Corresponsales.jsp");
Blocks.put("Videos","TS_Agenda_Videos.jsp");
Blocks.put("Sigue Leyendo","TS_Agenda_SigueLeyendo.jsp");

%> 
<%--
category <%=category %>
columna_derecha.html
template: <%=template %>
--%>
<cms:contentload collector="singleFile" param="/english/.config/columna_derecha.html" editable="true">
	<cms:contentcheck ifexistsone="<%= template %>">
		<cms:contentloop  element="<%= template %>">
			<c:set var="block" scope="page"><cms:contentshow element="block" /></c:set>
			<jsp:useBean id="block" type="java.lang.String" />
		 
			<cms:include page="<%= (String) Blocks.get(block) %>" >
				<cms:param name="template" value="<%=template %>"/>
				<cms:param name="block" value="<%=block %>"/>
			</cms:include>	
		</cms:contentloop>			
	</cms:contentcheck>
</cms:contentload>