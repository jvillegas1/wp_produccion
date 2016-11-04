<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">  
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="
	java.util.Date,
	org.opencms.file.CmsObject,
	org.opencms.jsp.CmsJspActionElement,
	org.opencms.jsp.CmsJspLoginBean,
	com.tfsla.webusersnewspublisher.service.NewsPublisherManager,
	com.tfsla.webusersnewspublisher.service.UploadImageManager,
	com.tfsla.webusersnewspublisher.model.News,
	java.util.*,
	org.apache.commons.fileupload.FileItem,
	org.opencms.jsp.CmsJspLoginBean,
	org.opencms.file.CmsObject,
	org.opencms.file.CmsProject,
	com.tfsla.opencms.webusers.RegistrationModule,
	com.tfsla.opencms.webusers.openauthorization.*,
	com.tfsla.opencms.webusers.TfsUserHelper,
	org.opencms.file.CmsUser,
	org.opencms.xml.content.CmsXmlContent,
	org.apache.commons.lang.StringUtils,
	com.tfsla.planilla.herramientas.PlanillaFormConstants,
	com.tfsla.webusersposts.service.*,
	com.tfsla.webusersposts.common.*,
	com.tfsla.webusersposts.helper.*,
	com.tfsla.diario.ediciones.services.PublicationService"
%>
<%	
Date date = new Date();
String site = "/sites/telesur";

//obtengo el usuario logueado
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

//valido si hay usuario logueado
boolean userIsLoggedIn = loginBean.isLoggedIn();

boolean flagVideos = true;

if (!userIsLoggedIn){
	response.sendRedirect("/");
	return;
}

String internalUser = loginBean.getUserName();
	
if(internalUser.equals("") || internalUser.equals("Guest")){
	response.sendRedirect("/");
	return;
}

//obtengo en un map todos los campos del formulario	
NewsPublisherManager publishNewsManager = new NewsPublisherManager(request);

News news = new News();
List<String> videosEmbedded = new ArrayList<String>();
publishNewsManager.setSite(site);

Map<String, Object> map = publishNewsManager.getParamsForm();

Boolean isEdit = ((FileItem)map.get("isEdit")).getString().equals("true") ? true : false;
Boolean isPreview = false;
Boolean isPublishAfterPreview = ((FileItem)map.get("isPublishAfterPreview")).getString().equals("true") ? true : false;
Boolean isDirectPublish = ((FileItem)map.get("isDirectPublish")).getString().equals("true") ? true : false;

String path = ((FileItem)map.get("path")).getString();

if( isEdit || isPublishAfterPreview ) {
	path = site + path;
} else {
	path = null;
}
//guardo los datos del formulario
String postId = ((FileItem)map.get("postId")).getString();
String section = ((FileItem)map.get("seccion")).getString();
List<String> categories = (ArrayList<String>)map.get("categories");
List<String> fuentes = (ArrayList<String>)map.get("fuentes");
String title = ((FileItem)map.get("titulo")).getString();
String subtitle = ((FileItem)map.get("copete")).getString();
String uppertitle = ((FileItem)map.get("volanta")).getString(); 	
String content = ((FileItem)map.get("contenido")).getString();
String keywords = ((FileItem)map.get("temas")).getString();
List<FileItem> images = (ArrayList<FileItem>)map.get("images");
List<String> videos = (ArrayList<String>)map.get("videos");
String checkFaceboook = ((FileItem)map.get("fb") != null) ? ((FileItem)map.get("fb")).getString() : ""; 
String checkTwitter = ((FileItem)map.get("tw") != null) ? ((FileItem)map.get("tw")).getString() : ""; 	
boolean postFacebook = (checkFaceboook.equals("publicar")) ? true : false;
boolean postTwitter = (checkTwitter.equals("publicar")) ? true : false;	

// System.out.println("postTwitter " + (FileItem)map.get("tw"));byte bytesTitle[] = title.getBytes("ISO-8859-1"); 
byte bytesTitle[] = title.getBytes("ISO-8859-1"); 
title = new String(bytesTitle, "UTF-8");

byte bytesContent[] = content.getBytes("ISO-8859-1"); 
content = new String(bytesContent, "UTF-8");

byte bytesKeywords[] = keywords.getBytes("ISO-8859-1"); 
keywords= new String(bytesKeywords, "UTF-8");

//reemplazo caracteres especiales en el título y en el cuerpo
title = title.replace("<","").replace(">","").replace("!","").replace("¡","").replace("--","").replace("script","").replace("SCRIPT","");

CmsProject currentProject = cms.getCmsObject().getRequestContext().currentProject();

//images
UploadImageManager uploadManager = new UploadImageManager();
uploadManager.setSite(site);
uploadManager.setInternalUser(internalUser);
uploadManager.setMode(isPreview);
uploadManager.setAutoPublishImages(false);

//subo las imagenes al OpenCms
for (FileItem item:images)
	uploadManager.upload(item);
	
//publica las impagenes y el arbol de carpetas, en caso de que lo haya creado
uploadManager.publish();

//Tweak porque el UploadImageManager deja el context en el OFFLINE
cms.getCmsObject().getRequestContext().setCurrentProject(currentProject);

//armo el iframe de los videos
for (String item:videos) {
	videosEmbedded.add("<iframe width=\"540\" height=\"365\" frameborder=\"0\" src=\"" + item + "\"></iframe>");
	
	if ( flagVideos )
		categories.add("/system/categories/SubSecciones/multimedia/videos/");
		
	flagVideos = false;
	
}

news.setMode(isPreview);

XmlContentHelper contentHelper = new XmlContentHelper(cms.getCmsObject(), isPreview);
contentHelper.setXmlValue("urlFriendly", title);
contentHelper.setXmlValue("estado", PlanillaFormConstants.PUBLICADA_VALUE);
contentHelper.setXmlValue("autor/internalUser", internalUser);
contentHelper.setXmlValue("seccion", section);
contentHelper.setXmlValue("ultimaModificacion", "" + news.getDateCreated().getTime());
contentHelper.setXmlValue("titulo", title);
contentHelper.setXmlValue("cuerpo", content);
contentHelper.setXmlValue("claves", keywords);
contentHelper.setXmlListValue("Categorias[%s]", categories, "Categorias");
contentHelper.setXmlListValue("fuente[%s]/nombre", fuentes, "fuente");
contentHelper.setXmlListValue("videoEmbedded[%s]/codigo", videosEmbedded, "videoEmbedded");
contentHelper.setXmlImageValues(images);

CmsXmlContent xmlContent = contentHelper.getXmlContent();
byte[] plainContent = xmlContent.marshal();
String contentAsString = new String(plainContent);
String socialNetworks = "";
ArrayList<String> networks = new ArrayList<String>();
if(postTwitter)
	networks.add("twitter");
if(postFacebook)
	networks.add("facebook");
if(networks.size() > 0)
socialNetworks = StringUtils.join(networks.iterator(), ",");

UserPostsService service = new UserPostsService();
UserPost userPost = null;
if(postId != null && !postId.equals("")) {
	userPost = service.savePost(
		title,
		contentAsString,
		loginBean.getUser().getId().toString(),
		PublicationService.getPublicationId(cms.getCmsObject()),
		site,
		socialNetworks,
		postId
	);
} else {
	userPost = service.savePost(
		title,
		contentAsString,
		loginBean.getUser().getId().toString(),
		PublicationService.getPublicationId(cms.getCmsObject()),
		site,
		socialNetworks
	);
}

if(isDirectPublish) {
	userPost = service.changeStatus(userPost, PostStatus.PENDING);
	if (section.indexOf("joinus") > -1 ) {
		response.sendRedirect("/posts/post_picture.html?ok");
	} else {
		response.sendRedirect("/posts/post_story.html?ok");
	}
} else {
	out.println("<process><result>id</result><message>"+userPost.getId()+"</message></process>");
}
%>