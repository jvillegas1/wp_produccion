<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ include file="TS_Common_UserFunctions.jsp" %>
<%@ include file="TS_RecoverySession.jsp" %>

<%@ page import="org.opencms.relations.CmsCategoryService,
		org.opencms.relations.CmsCategory,
		java.util.List,
		org.opencms.jsp.CmsJspActionElement"%>
<%@ page language="java" import="org.opencms.jsp.CmsJspActionElement,
             org.opencms.jsp.CmsJspLoginBean"%>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.Encrypter" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="com.tfsla.diario.ediciones.model.TipoEdicion" %>
<%@ page import="com.tfsla.diario.ediciones.services.TipoEdicionBaseService" %>
<%@ page import="java.io.*,
         org.opencms.jsp.*,
         org.apache.commons.fileupload.FileItemFactory,
         org.apache.commons.fileupload.FileItem,
         org.apache.commons.fileupload.disk.DiskFileItemFactory,
         org.apache.commons.fileupload.servlet.ServletFileUpload,
         org.opencms.file.CmsProperty,
         org.opencms.file.CmsPropertyDefinition,
         org.opencms.file.CmsObject,
         org.opencms.file.CmsFile,
         org.opencms.file.CmsUser,
         org.opencms.file.CmsResourceFilter,
         org.opencms.file.types.CmsResourceTypePlain,
         org.opencms.file.CmsResource,
         org.opencms.file.CmsProject,
         org.opencms.util.CmsFileUtil,
         org.opencms.main.*,
         org.opencms.jsp.CmsJspLoginBean,
         org.opencms.db.CmsPublishList,
         org.opencms.db.CmsDbSqlException,
         org.opencms.report.CmsStringBufferReport,
         org.opencms.security.CmsSecurityException,
         com.tfsla.opencms.webusers.UserDAO,
         com.tfsla.opencms.webusers.RegistrationModule,
         com.tfsla.opencms.webusers.TfsUserHelper,
         com.tfsla.exceptions.BusinessException" %>
<%
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

// ==============================
//get publication info
String publicationId = "8";
String publicationUrl = "";
TipoEdicionBaseService tService = new TipoEdicionBaseService();
try {
	TipoEdicion tEdicion = tService.obtenerTipoEdicion(cms.getCmsObject(), cms.getCmsObject().getRequestContext().getUri());			
	if ( tEdicion != null ) {
		publicationId  = "" + tEdicion.getId();
		publicationUrl = tEdicion.getNombre();
	}
} catch (Exception e) {
	e.printStackTrace();
}
// ==============================
//Providers
boolean asociateOk 		= (request.getParameter("ASC") != null ) ? true : false ;
boolean dissasociateOk 		= (request.getParameter("DIS") != null ) ? true : false ;
boolean dissasociateError 	= (request.getParameter("NAP") != null ) ? true : false ;
boolean changePassOk		= (request.getParameter("CNP") != null ) ? true : false ;

// ==============================
//Get the current user
String user 			= loginBean.getUserName();
String username 		= "";

if ( user.indexOf("/") > -1 ) {
	String[] arrayUser = user.split("/");
	username = arrayUser[1];
}else{
	username = user;
}

CmsUser currentUser 	= RegistrationModule.getInstance(cms.getCmsObject()).retrieveUser(cms.getCmsObject(), username);
TfsUserHelper tfsUser 	= new TfsUserHelper(currentUser);
// ==============================

boolean IsWebUser 	= currentUser.isWebuser();
String currentUri	= cms.getRequestContext().getUri();


//USER DATA
String nickname			= getApodoUsuario(username, cms.getCmsObject());
String email            	= tfsUser.getEmail();
String firstname        	= tfsUser.getFirstname();
String lastname         	= tfsUser.getLastname();
String pais           		= ( tfsUser.getPais() != null ) ? tfsUser.getPais() : "";
boolean hasSetNativePassword 	= false;
boolean NEF_NativePassword 	= false;
try{
	hasSetNativePassword = tfsUser.hasSetNativePassword();
}catch (Exception e) {
	NEF_NativePassword 	= true;
}

//ADITIONAL DATA
String foto	          			= ( tfsUser.getValorAdicional("USER_PICTURE") != null ) ? tfsUser.getValorAdicional("USER_PICTURE") : "";
boolean showName				= ( tfsUser.getValorAdicional("USER_MOSTRAR_NOMBRE") != null )  ? Boolean.parseBoolean(tfsUser.getValorAdicional("USER_MOSTRAR_NOMBRE")) : false;
boolean showNickname      			= ( tfsUser.getValorAdicional("USER_MOSTRAR_APODO") != null )  ? Boolean.parseBoolean(tfsUser.getValorAdicional("USER_MOSTRAR_APODO")) : false;
boolean showEmail	     			= ( tfsUser.getValorAdicional("USER_MOSTRAR_MAIL") != null )  ? Boolean.parseBoolean(tfsUser.getValorAdicional("USER_MOSTRAR_MAIL")) : false;
String notifyBoletinteleSURValor		= ( tfsUser.getValorAdicional("SUSCRIPCION_BOLETIN_TELESUR") != null )  ? tfsUser.getValorAdicional("SUSCRIPCION_BOLETIN_TELESUR") : "";
String notifyOnPostCommentedValor		= ( tfsUser.getValorAdicional("RECIBIR_AVISO_COMENTAN_POST") != null )  ? tfsUser.getValorAdicional("RECIBIR_AVISO_COMENTAN_POST") : "";
String notifyOnCommentReplyValor	     	= ( tfsUser.getValorAdicional("RECIBIR_AVISO_RESPONDEN_COMENTARIO") != null )  ? tfsUser.getValorAdicional("RECIBIR_AVISO_RESPONDEN_COMENTARIO") : "";

String notifyOnPostCommented = "";
String notifyOnPostCommentedDefault = "";
if (notifyOnPostCommentedValor.equals("TRUE")) notifyOnPostCommentedDefault = "checked";

String notifyOnCommentReply = "";
String notifyOnCommentReplyDefault = "";
if (notifyOnCommentReplyValor.equals("TRUE")) notifyOnCommentReplyDefault = "checked";

String notifyBoletinteleSUR = "";
String notifyBoletinteleSURDefault = "";
if (notifyBoletinteleSURValor.equals("TRUE")) notifyBoletinteleSURDefault = "checked";
// ===========================
//GET CATEGORIES
String referencePath = cms.getCmsObject().getRequestContext().getUri();
CmsCategoryService cService = new CmsCategoryService();

//Paises
List<CmsCategory> paises = cService.readCategories(cms.getCmsObject(),"/usuarios/region",false,referencePath);

// ===========================


// =======================================================
// ON POST
// =======================================================

//ERRORS
Boolean ErrorNickName      	= false;
Boolean ErrorNickNameIsAlreadyUsed  	= false;
Boolean errorUpdate        	= false;
Boolean ErrorEdicion       	= false;
Boolean passwordUpdateError     = false;

Boolean nicknameIsValid        	= false;
Boolean PIngreso        	= false;

String VALIDATION_PASSWORD      = "[A-Za-z0-9]{5,}";


// USER IMAGE
boolean resourceExists      	= false;
Boolean FotoGrande      	= false;
long tamano_max         	= 300 * 1024;   // Tamaño máximo de la imagen del usuario a subir (300 kb en bytes = 300 * 1024) 
long SizeFile           	= 0;

String updatedUserName      	= null;
String errorMessage         	= null;
String path             	= "/usuarios/img/";
String UserId           	= loginBean.getUser().getId().toString();
String NameToShow		= "";
String showEmailValor 		= "";

boolean isMultipart = ServletFileUpload.isMultipartContent(request); 

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setHeaderEncoding("UTF-8"); //Deal with Chinese/Japanese/.... file names

String password = "";
String password_new = "";
String password_new_confirm ="";
String MsgEmtyFieldsF = "";
String MsgEmtyFieldsL = "";

int contItems = 0;

if(isMultipart){           
  	
  	CmsProject offlineProject = cms.getCmsObject().readProject("Offline");
	cms.getCmsObject().getRequestContext().setCurrentProject(offlineProject);
	  
	try {
	       	List items = upload.parseRequest(request);
	       
	       	if (items != null) {
		        Iterator itr = items.iterator();
		        
		        List<String> atributosExtra = new ArrayList<String>(8);
		        List<String> valoresExtra = new ArrayList<String>(8);
		
	        	while (itr.hasNext()) {
	
		        	contItems++;
			            
				FileItem item = (FileItem) itr.next();
				
				//out.println(item.getFieldName() + " : " + item.getString() + "</br>") ;
				 
				if (item.isFormField()) {
		
					if(item.getFieldName().equals("nickname")){
						nickname = item.getString();
						byte bytesnickname[] = nickname.getBytes("ISO-8859-1"); 
						nickname = new String(bytesnickname, "UTF-8");
						
						if ( nickname.equals("") || nickname.indexOf("script") > -1 || nickname.indexOf("SCRIPT") > -1 || nickname.indexOf("<") > -1 || nickname.indexOf(">") > -1 )
						ErrorNickName = true; 
						
						ErrorNickNameIsAlreadyUsed = RegistrationModule.getInstance(cms.getCmsObject()).checkExistsPropertyInUsersCI(cms.getCmsObject(), "APODO", nickname, username, true);
						nicknameIsValid = RegistrationModule.getInstance(cms.getCmsObject()).isValidNickName(nickname);   
						
						if( !nicknameIsValid ) ErrorNickName = true; 				
						atributosExtra.add("APODO");
						valoresExtra.add(nickname);
					}
					
					if(item.getFieldName().equals("firstname")){
						firstname = item.getString();
						byte bytesFirstname[] = firstname.getBytes("ISO-8859-1"); 
						firstname = new String(bytesFirstname, "UTF-8");
					}
					
					if(item.getFieldName().equals("lastname")){
						lastname = item.getString();
						byte bytesLastname[] = lastname.getBytes("ISO-8859-1"); 
						lastname = new String(bytesLastname, "UTF-8");
					}                
					
					if(item.getFieldName().equals("NameToShow")){
						NameToShow = item.getString();	
						
						if (NameToShow.equals("showName")) { 
							showName = true;
							showNickname = false;
							atributosExtra.add("USER_MOSTRAR_NOMBRE");
							valoresExtra.add("TRUE");
							
							atributosExtra.add("USER_MOSTRAR_APODO");
							valoresExtra.add("FALSE");
						} 
						
						if (NameToShow.equals("showNickname")) { 
							showName = false;
							showNickname = true;
							atributosExtra.add("USER_MOSTRAR_NOMBRE");
							valoresExtra.add("FALSE");
							
							atributosExtra.add("USER_MOSTRAR_APODO");
							valoresExtra.add("TRUE");
						}
						
					}   
					
					if(item.getFieldName().equals("showEmail")){
						showEmailValor = item.getString();
						
						if (showEmailValor.equals("TRUE"))  
							showEmail = true;
						else
							showEmail = false;
						
						atributosExtra.add("USER_MOSTRAR_MAIL");
						valoresExtra.add(showEmailValor);
						
					}   
					
					if(item.getFieldName().equals("notifyBoletinteleSUR")){
						notifyBoletinteleSUR = item.getString();
						
						if (notifyBoletinteleSUR.equals("TRUE")) 
							notifyBoletinteleSURDefault = "checked";
						else 
							notifyBoletinteleSURDefault = "";
							
						atributosExtra.add("SUSCRIPCION_BOLETIN_TELESUR");
						valoresExtra.add(String.valueOf(notifyBoletinteleSUR));
					}            

					if(item.getFieldName().equals("notifyOnPostCommented")){
						notifyOnPostCommented = item.getString();
						if (notifyOnPostCommented.equals("TRUE")) 
							notifyOnPostCommentedDefault = "checked";
						else 
							notifyOnPostCommentedDefault = "";

						atributosExtra.add("RECIBIR_AVISO_COMENTAN_POST");
						valoresExtra.add(notifyOnPostCommented);
					}            
										
					if(item.getFieldName().equals("notifyOnCommentReply")){
						notifyOnCommentReply = item.getString();
						if (notifyOnCommentReply.equals("TRUE"))
							notifyOnCommentReplyDefault = "checked";
						else
							notifyOnCommentReplyDefault = "";
							
						atributosExtra.add("RECIBIR_AVISO_RESPONDEN_COMENTARIO");
						valoresExtra.add(String.valueOf(notifyOnCommentReply));
					}
					
					if(item.getFieldName().equals("pais")){
						pais = item.getString();
						byte bytespais[] = pais.getBytes("ISO-8859-1"); 
      						pais = new String(bytespais, "UTF-8");
					}  			
					
					if( item.getFieldName().equals("password")){
						password = item.getString().toString().trim();
					}
					
					if( item.getFieldName().equals("password_new")){
						password_new = item.getString().toString().trim();
					}
					
					if( item.getFieldName().equals("password_new_confirm")){
						password_new_confirm = item.getString().toString().trim();
					}
					
				} else {
					
					
					if (item.getFieldName().equals("picture") && !item.getString().equals("")){
						/**
						out.println("ENTRO!!!");				      
					       	out.println("Name: " + item.getName());
		                	       	out.println("Size: " + item.getSize());
		                	      	out.println("Type: " + item.getContentType());
					       	out.println("path: " + path);
					       */
						
						SizeFile = item.getSize();
				       
						if(SizeFile > tamano_max ){
							FotoGrande  = true;
						}
						
						//out.println("FotoGrande: " + FotoGrande);
						
						if ( !FotoGrande ) {
						
							String title = CmsResource.getName(item.getName());
							String filename = cms.getCmsObject().getRequestContext().getFileTranslator().translateResource(item.getName());
						
							String[] FileNameTmp = filename.split("\\.");
							String extension = FileNameTmp[1];
						
							String filenameUser = UserId + "." + extension.toLowerCase();
							filename = filenameUser;
							// out.println ("filename: " + path + filename +"<br>");
						
							int type = OpenCms.getResourceManager().getDefaultTypeForName(item.getName()).getTypeId();
							resourceExists = false;
						
							try {
								cms.getCmsObject().readResource(path + filename);
								cms.getCmsObject().lockResource(path + filename);
								resourceExists = true;
							} catch (CmsException e) {
								resourceExists = false;
							}
	                		
			                		/**
			                		out.println("resourceExists: " + resourceExists);
							out.println("Title: " + title);
							out.println("filename: " + path + filename);
							out.println("Type: " + type);
							*/
	                		
			                		if (resourceExists) {
							     cms.getCmsObject().deleteResource(path + filename, CmsResource.DELETE_PRESERVE_SIBLINGS);
			                		}
	                		
							byte[] buffer = null;
					
							if (item.getSize() == -1) {
								buffer = CmsFileUtil.readFully(item.getInputStream(), false);
							} else {
								buffer = CmsFileUtil.readFully(item.getInputStream(), (int)item.getSize(), false);
							}
							
							if (title.lastIndexOf('.') != -1)
							     	title = title.substring(0, title.lastIndexOf('.'));
								
			
							List properties = new ArrayList(1);
							CmsProperty titleProp = new CmsProperty();
							titleProp.setName(CmsPropertyDefinition.PROPERTY_TITLE);
							if (OpenCms.getWorkplaceManager().isDefaultPropertiesOnStructure()) {
								titleProp.setStructureValue(title);
							} else {
								titleProp.setResourceValue(title);
							}
								
							properties.add(titleProp);
		
							try {
								cms.getCmsObject().createResource(path + filename, type, buffer, properties);
								// response.getOutputStream().print("200 OK | " + path.substring(1) + filename);
								//System.out.println("200 OK | " + path.substring(1) + filename);
								
		        					cms.getCmsObject().unlockResource(path + filename);
		        					
		        					// Publico el recurso
		        					List<CmsResource> resources = new ArrayList<CmsResource>();
		        					
		        					CmsResource res = cms.getCmsObject().readResource(path + filename);
		        					resources.add(res);
		        					
		        					CmsPublishList pList = OpenCms.getPublishManager().getPublishList(cms.getCmsObject(), resources, true);
		        					CmsStringBufferReport report = new CmsStringBufferReport(Locale.ENGLISH);
		        				        OpenCms.getPublishManager().publishProject(cms.getCmsObject(), report, pList);
		        				
								foto = path + filename;
		
							} catch (CmsSecurityException e) {
								// in case of not enough permissions, try to create a plain text file	
								cms.getCmsObject().createResource(path + filename, CmsResourceTypePlain.getStaticTypeId(), buffer, properties);
								//response.getOutputStream().print("200 OK | " + path.substring(1) + filename);
		
							} catch (CmsDbSqlException sqlExc) {
								// SQL error, probably the file is too large for the database settings, delete file
							        cms.getCmsObject().lockResource(path + filename);
							        cms.getCmsObject().deleteResource(path + filename, CmsResource.DELETE_PRESERVE_SIBLINGS);
							        //response.getOutputStream().print("500 Internal Server Error | " + sqlExc.getMessage()); 
							        
							}
						}
					}

				}
			 	
			}
			

			if(!FotoGrande){
				//Actualizao picture porque si sube una foto la tengo que poner en blanco
				atributosExtra.add("USER_PICTURE");
				//valoresExtra.add(picture);
				valoresExtra.add(foto);
			}	
			
			//Si no hubo errores de validación => Update
			if ( !ErrorNickName && !ErrorNickNameIsAlreadyUsed && !FotoGrande) {
			
				try {
					RegistrationModule.getInstance(cms.getCmsObject()).updateWebUser(
											cms.getCmsObject(),
									                currentUser,
									                firstname,
											lastname,
									                email,
									                email,
									                "",
									                "",
									                "",
									                "",
									                pais,
									                "",
									                "",
									                "",
									                "",
									                "",
									                "",
									                atributosExtra,
									                valoresExtra);
			                
					updatedUserName = currentUser.getName();
					
				} catch (BusinessException e) {
					errorMessage = e.getMessage();
					errorUpdate = true;
				} catch (Exception ex) {
					errorUpdate = true;
					errorMessage = ex.getMessage();
					if (errorMessage.indexOf("last name") > -1 ) 
					MsgEmtyFieldsL = "error";
					if (errorMessage.indexOf("first name") > -1 ) 
					MsgEmtyFieldsF = "error";
				}
			}
			
			//out.println("PASSWORD");
			
			//out.println("pass new" + password_new_confirm + "</br>");
			
			// Upadate Password
			if ( !password_new_confirm.equals("") ) {
			
				// Check password.
				if ( !password_new.equals(password_new_confirm) || !password_new.matches(VALIDATION_PASSWORD ))
					passwordUpdateError = true;
			
				//out.println("passwordUpdateError:" + passwordUpdateError + "</br>");
			
				// Update the user password.
				if ( !passwordUpdateError ) {
				
					//out.println("hasSetNativePassword:" + hasSetNativePassword + "</br>");
					
					if ( hasSetNativePassword ) {
						try{
							//out.println("cambiando nativa");
						
							RegistrationModule.getInstance(cms.getCmsObject()).changePassword(request, 
													response, 
													cms.getCmsObject(), 
													currentUser, 
													password, 
													password_new);
							updatedUserName = currentUser.getName();
						}catch (Exception e) {
							passwordUpdateError = true;
						}
					} else {
						try{
							//out.println("pass nativa:" + RegistrationModule.getInstance(cms.getCmsObject()).PasswOpenID(cms.getCmsObject(), user) + "</br>");
							
							RegistrationModule.getInstance(cms.getCmsObject()).changePassword(request, 
													response, 
													cms.getCmsObject(), 
													currentUser, 
													RegistrationModule.getInstance(cms.getCmsObject()).PasswOpenID(cms.getCmsObject(), user), 
													password_new);
							updatedUserName = currentUser.getName();
						}catch (Exception e){
							passwordUpdateError = true;
						}
						
						try{
							RegistrationModule.getInstance(cms.getCmsObject()).SaveOpenIdPassw(user, password_new);
						}catch (Exception e){
							passwordUpdateError = true;
							//processError = true;
							//tipoError = tipoError+ "SaveOpenIdPassw ";
						}
						
						try{							
							RegistrationModule.getInstance(cms.getCmsObject()).changeNativePasswordFlag(user, true);
							
						}catch (Exception e){
							passwordUpdateError = true;
							//processError = true;
							//tipoError = tipoError+ "changeNativePasswordFlag ";
						}
					}
					//out.println("passwordUpdateError:" + passwordUpdateError + "</br>");
				}
			}
		   }
		
	    } catch (Exception e) {
		//response.getOutputStream().println("500 Internal Server Error | " + e.getMessage());
	    }
	
	//Pasa a ONline    
	CmsProject onlineProject = cms.getCmsObject().readProject("Online");
	cms.getCmsObject().getRequestContext().setCurrentProject(onlineProject); 
}



boolean userUpdated = (updatedUserName != null);
if (lastname.equals(" ")) 
	MsgEmtyFieldsL = "error";
if (firstname.equals(" ")) 
	MsgEmtyFieldsF = "error";


String msjAlert = "";

if ( FotoGrande || errorUpdate || passwordUpdateError || ErrorNickNameIsAlreadyUsed || ErrorNickName  ) { 
	ErrorEdicion = true; 
}

if ( ErrorEdicion ) { 
	if ( passwordUpdateError ){ 
		msjAlert = "Error en la contraseña. Verifica haber escrito tu contraseña actual y nueva de forma correcta y coincidentes.";
	}
	if ( ErrorNickNameIsAlreadyUsed ){ 
		msjAlert = "El apodo ingresado es inválido. Otro usuario está utilizando el mismo apodo, prueba con cambiarlo e intenta nuevamente.";
	} 
	if ( ErrorNickName ){
		msjAlert = "El apodo ingresado es inválido. Prueba con cambiarlo e intenta nuevamente.";
	} 
	if (!MsgEmtyFieldsF.equals("") ){
		msjAlert = "Debés completar tu nombre";
	} 
	if (!MsgEmtyFieldsL.equals("") ){
		msjAlert = "Debés completar tu apellido.";
	} 
	if (FotoGrande) {
		msjAlert = "La foto que intenta subir es muy grande";
	}
	
} 


%>  
<%--
DEBUG!!! </br>

showName <%=showName%> </br>
showEmail <%=showEmail%> </br>
errorUpdate <%=errorUpdate %> </br>
passwordUpdateError <%=passwordUpdateError %> </br>
ErrorNickNameIsAlreadyUsed <%=ErrorNickNameIsAlreadyUsed %> </br>
ErrorNickName <%=ErrorNickName %> </br>
errorMessage <%=errorMessage %> </br>
<%=(errorUpdate || passwordUpdateError || ErrorNickNameIsAlreadyUsed || ErrorNickName || ErrorDNI ) %> </br>
--%>

<nt:user username="<%=user%>">
	<form class="reg-form" name="editarPerfil" id="editarPerfil" method="post" onsubmit="return ok()" action="<%=currentUri%>" enctype="multipart/form-data" >    
<% 		
		if (asociateOk) {
%>		 
			<div class="clear error conf">
				<div class="txtavisofondo"> ¡Tu perfil se ha asociado correctamente con <%=request.getParameter("ASC") %>! </div> 
			</div>
			
			<% /** Una vez asociado el perfil volvemos a cargar los datos del usuario */ %>
			<script> $(document).ready(function(){  actualizarProflieHeader(); }); </script>
<%		}	
		if (dissasociateOk) {
%>		 
			<div class="clear error conf">
				<div class="txtavisofondo"> ¡Tu perfil se ha desvinculado correctamente con <%=request.getParameter("DIS") %>! </div>
			</div>
			
			<% /** Una vez desvinculado el perfil volvemos a cargar los datos del usuario */ %>
			<script> $(document).ready(function(){  actualizarProflieHeader(); }); </script>
<%		}
		if (changePassOk) {
%>		 
			<div class="clear error conf">
				<div class="txtavisofondo"> ¡Has cambiado tu contraseña correctamente. Ahora puedes iniciar sesión como un usuario de teleSUR! </div> 
			</div>
<%		}		
		if ( userUpdated && !errorUpdate && !passwordUpdateError && !ErrorNickNameIsAlreadyUsed && !ErrorNickName ) {
%>
			<div class="clear error conf">
				<div class="txtavisofondo"> ¡Tu perfil se ha editado con éxito! </div> 
			</div>
			
			<% /** Suscripcion del newsletter */ %>			
			<% if (notifyOnCommentReplyDefault.equals("checked")) { %>
				<cms:include page="../TS_Common_Newsletter.jsp">
					<cms:param name="email"><%=email %></cms:param>
					<cms:param name="name">profile-suscripcion</cms:param>
				</cms:include>	
			<% } else { %>
				<cms:include page="../TS_Common_Newsletter.jsp">
					<cms:param name="email"><%=email %></cms:param>
					<cms:param name="name">profile</cms:param>
				</cms:include>	
			<% } %>

			<% /** Una vez actualizado el perfil volvemos a cargar los datos del usuario */ %>
			<script> $(document).ready(function(){  actualizarProflieHeader(); }); </script>
<%
		}
		if ( FotoGrande || ( userUpdated && errorUpdate || passwordUpdateError || ErrorNickNameIsAlreadyUsed || ErrorNickName || ErrorEdicion)) {
%>
			<div class="error">
				<div class="txtaviso"><%=msjAlert%></div> 
			</div>
<%
		}
		if (dissasociateError) {
%>		 
			<div class="error">
				<div class="txtaviso"> ¡Error al desvincular la cuenta <%=request.getParameter("NAP") %>! </div> 
			</div>
<%		}		
%>		
		<!-- inicio col-mid -->
		<div class="col-mid">

			<div class="cont">
			
				<input type="text" placeholder="Nombre" name="firstname" value="<%=firstname%>" required <% if (!MsgEmtyFieldsF.equals("") ){ %> class="mal" <% } %>  >
				<input type="text" placeholder="Apellido" name="lastname" value="<%=lastname%>" required <% if (!MsgEmtyFieldsL.equals("") ){ %> class="mal" <% } %>  >
				<input type="text" placeholder="Apodo" name="nickname" value="<%=nickname%>" <% if (ErrorNickNameIsAlreadyUsed || ErrorNickName )  { %> class="mal" <% } %> maxlength="30" required />
				
				<cms:include page="TS_Common_Countries.jsp" >
					<cms:param name="pais"><%=pais %></cms:param>
				</cms:include>
				
				<p class="clear row" style="color:#666666;width:21%;margin-right:2%; margin:10px 0 20px 0; float:left; font-size:1.4em;">
				Email</p>
				
				<p style="color:#666666;width:21%;margin-right:2%; float:left; font-size:2em; margin:5px 0 20px 0"> <nt:user-email/> </p>
				
				<div class="clear row">
					<div class="clear row">
						<p>Cambiar imagen de perfil</p>
						<input type="file" name="picture" title="Examinar" >
					</div>
					
<%
					// if ( IsWebUser ) {					
						if ( !hasSetNativePassword && !NEF_NativePassword){
%>			                        
			                        <p style="color:#666666;width:50%;margin-right:2%; margin-bottom:40px;float:left; font-size:1.2em; line-height:1.5em;"> 
			                        Selecciona una contraseña de teleSUR <br/>
						para iniciar sesión en tu cuenta 
						<br/> sin utilizar <%= request.getSession().getAttribute("providerName") == null ? " la red social" : (String)request.getSession().getAttribute("providerName")%>
						</p>
						

			                       
			                        <a href="/usuarios/seleccionarclave.html" title="Seleccionar contraseña">[Seleccionar contraseña]</a>
<%
						} else { 
%>		                        	
						<p style="color:#666666;margin-right:1%; float:left; font-size:1.4em;"> Cambiar contraseña </p>
			                        <input type="password" <% if (passwordUpdateError) { %> class="mal" <% } %> name="password" placeholder="Contraseña Actual">
			                        
			                        <input type="password" <% if (passwordUpdateError) { %> class="mal" <% } %> name="password_new" placeholder="Nueva Contraseña">
			                        <div class="anote">Debe ser mayor de 7 dígitos y contener números y letras.</div>

		                        	<input type="password" <% if (passwordUpdateError) { %> class="mal" <% } %> name="password_new_confirm" placeholder="Confirmar Nueva Contraseña">
<%
					  	}
					//  }
%>
				</div>
			</div>
		
		</div>
		<!-- fin col-midx --> 
		
		<!-- inicio col-mid -->
		<div class="col-mid">
			<div class="border_form" style="border-left:1px solid #CCC">
				<div class="cont">
					<div class="clear row">
							<p style="color:#666666;width:50%;margin-right:2%; margin-bottom:40px;float:left; font-size:1.2em; line-height:1.5em;"> 
							¿Cómo quieres aparecer en tu perfil público cuando hagas un comentario o en Soy Reportero? 
						</p>
						<select class="selreg" id="select" name="NameToShow" style="float:right; width:40%">
							<% if ( showName ) { %>
								<option value="showName"> Con mi nombre real </option>
								<option value="showNickname"> Con mi apodo </option>
							<% } else { %>
								<option value="showNickname"> Con mi apodo </option>
								<option value="showName"> Con mi nombre real </option>
							
							<% } %>
						</select>
					</div>
					<div class="clear row">
						<p style="color:#666666;width:50%;margin-right:2%; margin-bottom:40px;float:left; font-size:1.2em; line-height:1.5em;"> 
							¿Te gustaría que tu dirección de correo aparezca en tu perfil público? 
						</p>
						<select class="selreg" name="showEmail" id="select" style="float:right; width:30%">
							<% if ( showEmail ) { %>
								<option value="TRUE"> Si </option>
								<option value="FALSE"> No </option>
							<% } else { %>
								<option value="FALSE"> No </option>
								<option value="TRUE"> Si </option>
							<% } %>
						</select>
					</div>
					<div class="clear row">
						<p style="color:#666666;margin-right:2%;margin-bottom:5px;float:left;font-size:1.2em;line-height:1.5em;"> 
							¿Que mensajes quieres recibir en tu mail? 
						</p>
						<div class="wpCheck">
							<div class="squaredThree">
								<input type="checkbox" id="notifyOnPostCommentedCheck" name="notifyOnPostCommentedCheck" <%=notifyOnPostCommentedDefault%> >
								<label for="notifyOnPostCommentedCheck"></label>
							</div>
							<div class="txtregister">
								<label for="notifyOnPostCommentedCheck">
									Cuando alguien comente un reporte mío
								</label>
							</div>
							<input type="hidden" name="notifyOnPostCommented" id="notifyOnPostCommented" value="<%=notifyOnPostCommented %>" />	
						</div>
						<div class="wpCheck">
							<div class="squaredThree">
								<input type="checkbox" id="notifyOnCommentReplyCheck" name="notifyOnCommentReplyCheck" <%=notifyOnCommentReplyDefault %> >
								<label for="notifyOnCommentReplyCheck"></label>
								<input type="hidden" name="notifyOnCommentReply" id="notifyOnCommentReply" value="<%=notifyOnCommentReply %>" />
							</div> 
							<div class="txtregister">
								<label for="notifyOnCommentReplyCheck">
									Cuando alguien responda uno de mis comentarios
								</label>
							</div>
						</div>
						<div class="wpCheck">
							<div class="squaredThree">
								<input type="checkbox" id="notifyBoletinteleSURCheck" name="notifyBoletinteleSURCheck" <%=notifyBoletinteleSURDefault %> >
								<label for="notifyBoletinteleSURCheck"></label>
							</div>
							<div class="txtregister">
								<label for="notifyBoletinteleSURCheck"> Boletines teleSUR </label>
								<input type="hidden" name="notifyBoletinteleSUR" id="notifyBoletinteleSUR" value="<%=notifyBoletinteleSUR %>" />
							</div>
						</div>
					
					</div>
					<div class="clear row" style="margin-bottom:25px">
						<p style="color:#666666;margin-right:2%;margin-top:15px;margin-bottom:5px;float:left;font-size:1.2em;line-height:1.5em;"> 
							Asociar cuentas 
						</p>
						<div class="clear"></div>

						<nt:providers>
							<nt:conditional-include oncondition="${provider.name == 'webusers-facebook' }">
								<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] != 'true' }">
									<a href="javascript:openPopUpProvider('facebook', true, '<%=publicationId%>', '<%=publicationUrl%>' );"  title="Conectarse  con Facebook" class="face">
										<cms:img src="/arte/asociar-facebook.png" style="width:106px" alt="facebook"/>
									</a>
								</nt:conditional-include>
								
								<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] == 'true' }">
									<a href="javascript:disassociateProvider('facebook');" title="Desconectarse con Facebook" class="face">
										<cms:img src="/arte/asociar-facebook.png" style="width:106px" alt="facebook"/>
									</a>
								</nt:conditional-include>
							</nt:conditional-include> 
							
							<nt:conditional-include oncondition="${provider.name == 'webusers-twitter' }">
								<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] != 'true' }">
									<a href="javascript:openPopUpProvider('twitter', true, '<%=publicationId%>', '<%=publicationUrl%>' );"  title="Conectarse  con Twitter" class="twit">
										<cms:img src="/arte/asociar-twitter.png" style="width:106px" alt="twitter"/>
									</a>
								</nt:conditional-include>

								<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] == 'true' }">
									<a href="javascript:disassociateProvider('twitter');" title="Desconectarse con Twitter" class="twit">
										<cms:img src="/arte/asociar-twitter.png" style="width:106px" alt="twitter"/>
									</a>
								</nt:conditional-include> 
							</nt:conditional-include> 	
						
							<nt:conditional-include oncondition="${provider.name == 'webusers-googlePlus' }">
								<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] != 'true' }">
									<a href="javascript:openPopUpProvider('googlePlus', true, '<%=publicationId%>', '<%=publicationUrl%>' );"  title="Conectarse con google" class="goog">
										<cms:img src="/arte/asociar-google.png" style="width:106px" alt="google"/>
									</a>
								</nt:conditional-include> 
								<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] == 'true' }">
									<a href="javascript:disassociateProvider('googlePlus');" title="Desconectarse de google" class="goog">
										<cms:img src="/arte/asociar-google.png" style="width:106px" alt="google"/> 
									</a>
								</nt:conditional-include> 
							</nt:conditional-include> 
						</nt:providers>
						
						<nt:providers>
							<nt:conditional-include oncondition="${ntuser.isassociatedto[provider.name] == 'true' }">
								<div class="anote"> Usted esta asociado a ${provider.description}. </div>
							</nt:conditional-include>
						</nt:providers>
						<div class="anote"> Si modificaste datos del perfil, guarda los mismos, antes de asociar o desasociar una cuenta. </div>
					</div>

					<a id="cancelar" href="javascript:window.history.back(-1);" style="float:right">Cancelar</a>

					<input id="subscribe" type="submit" value="Enviar" name="submit" style="float:right;margin-top:0">
				</div>
			</div>
		</div>
		<!-- fin col-midx -->
	</form>
</nt:user>

<script type="text/javascript" language="javascript" src="<cms:link>/system/modules/com.tfsla.diario.telesur/resources/js/openauthorization.js</cms:link>"></script>
<script>
	function actualizarProflieHeader() {
	
		jQuery("#headerProfileSinAct").hide();
		$.post("/system/modules/com.tfsla.diario.telesur/elements/webusers/TS_Profile_UserData.jsp",
			{ }, function(data){
			$("#headerProfileAct").html(data);
		});  
	}
	
	function ok(){
		frm = document.editarPerfil;
		
	    	notifyOnPostCommentedCheck = document.editarPerfil.notifyOnPostCommentedCheck;
		notifyOnPostCommented = document.editarPerfil.notifyOnPostCommented;
	        if (notifyOnPostCommentedCheck.checked){ notifyOnPostCommented.value = "TRUE" } else { notifyOnPostCommented.value = "FALSE" }
	        
	       	notifyOnCommentReplyCheck = document.editarPerfil.notifyOnCommentReplyCheck;
		notifyOnCommentReply = document.editarPerfil.notifyOnCommentReply;
	        if (notifyOnCommentReplyCheck.checked){ notifyOnCommentReply.value = "TRUE" } else { notifyOnCommentReply.value = "FALSE" }
	        
	        notifyBoletinteleSURCheck = document.editarPerfil.notifyBoletinteleSURCheck;
		notifyBoletinteleSUR = document.editarPerfil.notifyBoletinteleSUR;
	        if (notifyBoletinteleSURCheck.checked){ notifyBoletinteleSUR.value = "TRUE" } else { notifyBoletinteleSUR.value = "FALSE" }
	       
		frm.submit();
		
	}
</script>