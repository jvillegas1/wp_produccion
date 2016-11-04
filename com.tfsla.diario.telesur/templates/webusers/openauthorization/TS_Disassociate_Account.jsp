<%@ page session="true" %>

<%@ page language="java"
         import="java.utils.*,
         		 org.opencms.file.CmsUser,
         		 org.opencms.jsp.CmsJspActionElement,
         		 org.opencms.jsp.CmsJspLoginBean,
         		 com.tfsla.opencms.webusers.TfsUserHelper,
         		 java.util.Hashtable"%>
         		 
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>         		 
<%@ page import="com.tfsla.opencms.webusers.openauthorization.*" %>

<%      
	boolean process = true;
        String providerName = request.getParameter("P");
                
        Integer countProvidersAssociated;
                
        if(request.getSession().getAttribute("countProvidersAssociated") != null)
	        countProvidersAssociated = (Integer)request.getSession().getAttribute("countProvidersAssociated");
	else
		countProvidersAssociated = -1;
		

	CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);
		
	String username = loginBean.getUserName();
	       
	if(username.indexOf("/") > -1) {
		String[] arrayUser = username.split("/");
		username = arrayUser[1];
	}
	
	CmsUser currentUser = RegistrationModule.getInstance(cms.getCmsObject()).retrieveUser(cms.getCmsObject(), username);
	TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
	        
	if (!tfsUser.hasSetNativePassword() && countProvidersAssociated == 1)
		process = false;

	if(process) {
		RegistrationModule.getInstance(cms.getCmsObject()).disassociateProviderKey(loginBean.getUserName(), providerName);
		response.sendRedirect(request.getScheme() + "://" + request.getServerName() + "/usuarios/editar_perfil.html?DIS="+providerName);
	}
	else {
		response.sendRedirect(request.getScheme() + "://" + request.getServerName() + "/usuarios/editar_perfil.html?NAP="+providerName);		
	}
%>