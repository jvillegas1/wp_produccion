<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ include file="TS_Common_UserFunctions.jsp" %>

<%@ page language="java"
         import="org.opencms.jsp.CmsJspActionElement,
		 org.opencms.jsp.CmsJspActionElement,
                 org.opencms.jsp.CmsJspLoginBean,
                 org.opencms.file.CmsUser,
                 java.util.Hashtable" %>
             
<%
//Get the action beans and set flag for currently logged in.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
//String username         = "";
String username = ( request.getParameter("username") != null ) ? request.getParameter("username") : "";
int pagina 		= ( request.getParameter("pagina") != null ) ? Integer.parseInt(request.getParameter("pagina")) : 1;

//Get the action beans and set flag for currently logged in.
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
boolean userIsLoggedIn = loginBean.isLoggedIn();

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
	//username = loginBean.getUserName();
}

String query = "( internalUser:( " + username + ")^1 )";

%>

<nt:news-list advancedfilter="<%=query%>" size="10" page="<%=pagina %>" state="publicada" order="user-modification-date" >
	
	<nt:conditional-include oncondition="${newslist.absoluteposition == 1 }">
		<div class="rowInt">
		        
		        <div class="headers blue">Notas recientes</div>
		        <div class="cont">
		        
	</nt:conditional-include> 
			
	 <cms:include page="../TS_Common_NotaEstilo5.jsp" >
		<cms:param name="path"><nt:legacy-link/></cms:param>	
		<cms:param name="usuarios">true</cms:param>				
	</cms:include>
				
	<nt:conditional-include onposition="last">
		<c:set var="hayMas" value="false"/>
		
		<nt:news-list advancedfilter="<%=query%>" size="10" page="<%=pagina+1 %>" state="publicada" order="user-modification-date" >
			<c:set var="hayMas" value="true"/>
		</nt:news-list>
		
		<c:if test="${hayMas == 'true'}" >
			<div id="bloque_<%=pagina+1 %>"></div>
			<div id="paginador">
				<a class="btnSeeMore" style="margin:0 10px" href="javascript:cargarMasNotas('<%=pagina+1 %>','<%=username %>');"> 
					Ver Más
				</a>
			</div>
		</c:if>	
	</nt:conditional-include> 
	
	<nt:conditional-include oncondition="${newslist.absoluteposition == 1 }">
			</div> <!--cont -->
				
		</div>	<!--rowInt -->		
		<script type="text/javascript">
			function cargarMasNotas(_proxPag, _userName){
				
				div = "#bloque_" + _proxPag;
				paginador = "#paginador";
				
				jQuery(paginador).hide();
		
				$.post("/system/modules/com.tfsla.diario.telesur/elements/webusers/TS_Profile_NewsList.jsp",
					{ pagina:_proxPag, username:_userName, usuarios:"true" }, function(data){
					$(div).html(data);
				});  
			}	
		</script>
	</nt:conditional-include> 
</nt:news-list>