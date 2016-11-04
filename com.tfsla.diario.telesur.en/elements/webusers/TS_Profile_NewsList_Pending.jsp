<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ include file="TS_RecoverySession.jsp" %>

<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
		 org.opencms.jsp.CmsJspActionElement,
                 org.opencms.jsp.CmsJspLoginBean,
                 org.opencms.file.CmsUser,
                 java.util.Hashtable" %>
             
<%
//Get the action beans and set flag for currently logged in.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
String username         = "";
int pagina 		= ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;
String usuarioLogueado 	= ( userIsLoggedIn ) ? loginBean.getUserName() : "";

if (request.getParameter("apodo") != null)
{
    	String tipoPerfil = request.getParameter("tipoPerfil");
      
	if(tipoPerfil.equals("wp")){
		username = request.getParameter("apodo").replaceAll("-"," ");
	}else{
		String apodoFrm = request.getParameter("apodo").replaceAll("-"," ");
		byte bytesApodo[] = apodoFrm.getBytes("ISO-8859-1"); 
		apodoFrm = new String(bytesApodo, "UTF-8");
		
		username = "webUser/" + RegistrationModule.getInstance(cms.getCmsObject()).UserNameByAdditionalInfo(cms.getCmsObject(), "APODO", apodoFrm); 	
	}
	
}
else
{
	username = loginBean.getUserName();
}
String query = "( internalUser:( " + username + ")^1 )";

if (usuarioLogueado.equals(username) ) { 
%>
	<nt:news-list advancedfilter="<%=query %>" size="10" page="<%=pagina %>" state="pendientePublicacion" order="user-modification-date" >
	
		<nt:conditional-include oncondition="${newslist.absoluteposition == 1 }">
			<div class="rowInt">
			        
			        <div class="headers blue">Reports Pending Approval </div>
			        <div class="cont">
			        
		</nt:conditional-include> 
				
		 <cms:include page="../TS_Common_NotaEstilo3.jsp" >
			<cms:param name="path"><nt:legacy-link/></cms:param>	
			<cms:param name="usuarios">true</cms:param>				
		</cms:include>
					
		<nt:conditional-include onposition="last">
			<c:set var="haymas" value="false"/>
			
			<nt:news-list advancedfilter="<%=query%>" size="10" page="<%=pagina+1 %>" state="pendientePublicacion" order="user-modification-date" >
				<c:set var="haymas" value="true"/>
			</nt:news-list>
			
			<c:if test="${haymas == 'true'}" >
				<div id="bloquePendiente_<%=pagina+1 %>"></div>
				<div id="paginadorPendiente">
					<a class="btnSeeMore" style="margin:0 10px" href="javascript:cargarNotasPendientes('<%=pagina+1 %>','<%=username %>');"> 
						See More
					</a>
				</div>
			</c:if>	
		</nt:conditional-include> 
		
		<nt:conditional-include oncondition="${newslist.absoluteposition == 1 }">
				</div> <!--cont -->
					
			</div>	<!--rowInt -->		
			<script type="text/javascript">
				function cargarNotasPendientes(_proxPag, _userName){
					
					div = "#bloquePendiente_" + _proxPag;
					paginadorPendiente = "#paginadorPendiente";
					
					jQuery(paginadorPendiente).hide();
			
					$.post("/system/modules/com.tfsla.diario.telesur.en/elements/webusers/TS_Profile_NewsList_Pending.jsp",
						{ pagina:_proxPag, username:_userName, usuarios:"true" }, function(data){
						$(div).html(data);
					});  
				}	
			</script>
		</nt:conditional-include> 
	</nt:news-list>
<% } %>