<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.tfsla.diario.comentarios.services.CommentsModule" %>
<%@ page import="com.tfsla.diario.comentarios.model.Comment" %>
<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
                 org.opencms.jsp.CmsJspLoginBean,
                 org.opencms.file.CmsUser,
                 java.util.Hashtable"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.statistics.model.TfsUserStatsOptions" %>
<%@ page import="com.tfsla.rankUsers.service.RankService" %>

<%
//Get the action beans and set flag for currently logged in.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

String username         = "";
String user 		= "";
String tipoPerfil 	= ""; 
String apodo 		= request.getParameter("apodo") ; 
Boolean resourceExists 	= false;

if (request.getParameter("apodo") != null){
	tipoPerfil = request.getParameter("tipoPerfil");
	username = apodo;
	if(tipoPerfil.equals("wp")){
		username = apodo;//.replaceAll("_"," ");
	}else{
		String apodoFrm = apodo.replaceAll("-"," ");
		byte bytesApodo[] = apodoFrm.getBytes("ISO-8859-1"); 
		apodoFrm = new String(bytesApodo, "UTF-8");
		
		username = "webUser/" + RegistrationModule.getInstance(cms.getCmsObject()).UserNameByAdditionalInfo(cms.getCmsObject(), "APODO", apodoFrm); 	
	}
	
	CmsUser currentUser  = cms.getCmsObject().readUser(username);
	user = currentUser.getName();
}

int cantxpag 		= CommentsModule.getInstance(cms.getCmsObject()).getQueryPageSize();
int pageComent 		= ( request.getParameter("pageComent") != null ) ? Integer.parseInt(request.getParameter("pageComent")) : 1;
int commentsCount 	= CommentsModule.getInstance(cms.getCmsObject()).getCommentsByAuthorCount(cms.getCmsObject(), username);
int pagesCountTot 	= CommentsModule.getInstance(cms.getCmsObject()).getPagesCount(commentsCount);

%> 
<script language="javascript">

      function ver_todos_coment(page){
       $.post("/system/modules/com.tfsla.diario.telesur.en/elements/webusers/TS_Profile_CommentList.jsp",{pageComent: page,apodo: '<%=apodo%>', tipoPerfil: '<%=tipoPerfil %>'}, function(data){      
       	$("#recargado_comentarios_<%=pageComent %>").html(data);
       });
   	
   	paginador = "#paginador_<%=pageComent %>";
	    jQuery(paginador).hide();
       	    $.ajaxSetup({ cache: false });
    
    }
</script>

<% if (commentsCount > 0 && pageComent == 1) { %>
<div class="rowInt">
        <div class="headers blue">Lastest comments</div>
        <div class="cont">
<% } %>

<% 
	List comments = CommentsModule.getInstance(cms.getCmsObject()).getCommentsByAuthor(cms.getCmsObject(),  user, Integer.toString(pageComent));

        for(Iterator it = comments.iterator(); it.hasNext(); ) 
        {
        	Comment comment = (Comment) it.next(); 	
			String NoticiaUrl = comment.getNoticiaURL();
			
			resourceExists = cms.getCmsObject().existsResource(NoticiaUrl);
			
			if ( resourceExists) 
			{	
				try{
%>			

	                        <cms:include page="TS_Profile_CommentBox.jsp">
	                            	<cms:param name="path"><%=NoticiaUrl%></cms:param>
	                            	<cms:param name="textComment"><%=comment.getText().replace("<","&lt;") %></cms:param>
                            <%--	<cms:param name="dateComment"><%=comment.getDate() %></cms:param> --%>
	                        </cms:include>          
<%					
				}
				catch (Exception e) 
				{ 
					//
				}                        	
			}
			
		}
%>

<div id="recargado_comentarios_<%=pageComent%>" >

</div>
<%
	if ( pageComent < pagesCountTot )
	{
%>	
            	  <a id="paginador_<%=pageComent %>" style="margin:0px 10px" class="btnSeeMore" href="javascript:ver_todos_coment('<%= pageComent + 1 %>');" alt="Ver Más" title="Ver Más">See more</a>

<% 
	} 					

%>

<% if (commentsCount > 0 && pageComent == 1) { %>
	</div> 
</div> <!--rowInt -->
<% } %>