<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.util.*,
	org.opencms.file.CmsObject,
	org.opencms.jsp.*,
	org.opencms.main.*,
	org.opencms.file.CmsResource,
	org.apache.commons.fileupload.FileItem,
	com.tfsla.webusersnewspublisher.service.NewsPublisherManager,
	com.tfsla.webusersnewspublisher.service.UploadImageManager,
	com.tfsla.webusersnewspublisher.model.News,
	com.tfsla.webusersposts.service.*,
	com.tfsla.webusersposts.common.*"
%>
<%
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
org.opencms.file.CmsObject cmsObj = cms.getCmsObject();

NewsPublisherManager publishNewsManager = new NewsPublisherManager(request);
Map<String, Object> map = publishNewsManager.getParamsForm();
String id = ((FileItem)map.get("postId")).getString();
String site = "/sites/telesur";

UserPostsService service = new UserPostsService();
UserPost userPost = new UserPost();
userPost.setId(id);
service.changeStatus(userPost, PostStatus.PENDING);

// response.sendRedirect("/posts/publicar_nota_ok.html");
%>