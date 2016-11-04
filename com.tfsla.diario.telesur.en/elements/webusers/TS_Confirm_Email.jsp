<%@ include file="../TS_Common_Libraries.jsp" %>
<%@ include file="TS_RecoverySession.jsp" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement,
			     org.opencms.file.CmsUser,
			     org.opencms.file.CmsObject,
			     org.opencms.util.CmsUUID" %>
<%@ page import="org.opencms.main.CmsLog" %>

<%
//Get the action beans.
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
boolean confirmationError = false;
String ou = "webUser/";
String username = "";
String user = "" ;
if(request.getParameter("id") != null && request.getParameter("id") != ""){
	//confirmar usuario
	String userId = request.getParameter("id");

	CmsUser newUser = null;

	try{
		newUser = cms.getCmsObject().readUser(new CmsUUID(userId));
		RegistrationModule.getInstance(cms.getCmsObject()).activateUser(cms.getCmsObject(), newUser);
		
		username = newUser.getName();
		if(username.indexOf("/") > -1) {
			String[] arrayUser = username.split("/");
			username = arrayUser[1];
		}		
		
		String password = RegistrationModule.getInstance(cms.getCmsObject()).PasswOpenID(cms.getCmsObject(), ou + username);
		loginBean.login(ou + username, password, "Online");		
		RegistrationModule.getInstance(cms.getCmsObject()).login(loginBean, password, response, "true");
		
		Cookie userCookie = new Cookie("logd", ou + newUser);
		userCookie.setMaxAge(-1);
		userCookie.setPath("/");
		response.addCookie(userCookie);
		
		user = loginBean.getUserName();
		
	}catch (Exception e) {
		confirmationError = true;
		try {
			CmsLog.getLog(this).error(e.getMessage(), e);
		} catch(Exception e2) {
			//nada por hacer
		}
	}
}
%>
<c:set var="confirmationError" scope="page"><%=confirmationError%></c:set>

<c:if test="${!confirmationError}">		

	<nt:user username="<%=user %>">

		<c:set var="userLinkFriendly" scope="page"><nt:user-link-friendly/></c:set>
		<jsp:useBean id="userLinkFriendly" type="java.lang.String" />
		
		<c:set var="userFirstname" scope="page"><nt:user-firstname/></c:set>
		<jsp:useBean id="userFirstname" type="java.lang.String" />	
		
		<c:set var="userLastname" scope="page"><nt:user-lastname/></c:set>
		<jsp:useBean id="userLastname" type="java.lang.String" />

		<c:set var="userNickname" scope="page"><nt:user-nickname/></c:set>
		<jsp:useBean id="userNickname" type="java.lang.String" />					
		
		<c:set var="userLink" scope="page"><nt:user-link-friendly/></c:set>
		<jsp:useBean id="userLink" type="java.lang.String" />
		
		<c:set var="userEmail" scope="page"><nt:user-email/></c:set>
		<jsp:useBean id="userEmail" type="java.lang.String" />
<%	
		String urlPerfil = "http://www.telesurtv.net/english" + userLink ;
		String urlPublicaNota =  userLink ;
		String urlSite =  "http://www.telesurtv.net/";
		String PAIS = "";
		
		String html = "";
		html += "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
		html += "<html xmlns=\"http://www.w3.org/1999/xhtml\">";
		html += "    <head>";
		html += "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />";
		html += "        <title>teleSUR</title>";
		html += "    </head>";
		html += "	<mailbody>";
		html += "		<table width=\"600\" border=\"0\" bgcolor=\"#ffffff\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #e3e2e2\">	";
		html += "			<tbody valign=\"top\">";
		html += "            <tr>";
		html += "            	<td width=\"98\" height=\"24\" rowspan=\"2\" valign=\"top\"><img src=\"" + urlSite + "/arte/mails/BarraLargaLogo.jpg\" width=\"98\" height=\"410\" /></td>";
		html += "            </tr>";
		html += "            <tr>";
		html += "            	<td width=\"10\" valign=\"top\">";
		html += "            		<img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";									
		html += "            	</td>";
		html += "            	<td width=\"490\" valign=\"top\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
		html += "            		<tr>";
		html += "            			<td width=\"500\" height=\"20\" valign=\"top\">";
		html += "            				<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:x-large;font-family:Arial,Helvetica,sans-serif\"><strong>Hello " + userFirstname + " " + userLastname +", </strong></span>	";						
		html += "            			</td>";
		html += "            		</tr>";
		html += "					<tr>";
		html += "                    	<td width=\"500\" height=\"10\"><img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" /></td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                    	<td width=\"500\" height=\"10\" valign=\"top\">";
		html += "                        	<span class=\"Estilo1\">Now you are an official member of the teleSUR community, thank you for completing your register.</span>";
		html += "                        </td>";
		html += "                    </tr>	";
		html += "                    <tr>";
		html += "                    	<td width=\"500\" height=\"10\"><img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" /></td>";
		html += "                    </tr>";
		html += "					<tr>";
		html += "						<td width=\"500\" height=\"12\" valign=\"top\" bgcolor=\"#DFDFDF\">";
		html += "							<table width=\"490\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
		html += "								<tr>";
		html += "                                	<td width=\"126\" valign=\"top\">";
		html += "                                    	<table width=\"57%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
		html += "                                            <tbody>";
		html += "                                               <tr>";																													
		html += "                                                   <td colspan=\"3\">";
		html += "                                                        <img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";
		html += "                                                    </td>";
		html += "                                                </tr>	";														
		html += "                                                <tr>";																
		html += "                                                    <td>";
		html += "                                                        <img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";
		html += "                                                    </td>";
		html += "                                                    <td>";
		html += "                                                        <img width=\"107\" height=\"107\" dfsrc=\"" + urlSite + "/arte/mails/miPerfil_sinFotoUser.jpg\" alt=\"Usuario\" style=\"float: left;\" src=\"" + urlSite + "/arte/mails/miPerfil_sinFotoUser.jpg\">";
		html += "                                                    </td>	";															
		html += "                                                    <td>";
		html += "                                                        <img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";
		html += "                                                   </td>";
		html += "                                                </tr>";														
		html += "                                                <tr>";																														
		html += "                                                    <td colspan=\"3\">";
		html += "                                                        <img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";
		html += "                                                    </td>";
		html += "                                                </tr>";													
		html += "                                            </tbody>";
		html += "                                        </table>";
		html += "                                     </td>";
		html += "                                     <td width=\"364\" valign=\"top\">";
		html += "										<table width=\"364\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
		html += "                                            <tr>";
		html += "                                            	<td valign=\"top\" colspan=\"2\">";
		html += "                                            		<img src=\"" + urlSite + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";
		html += "                                            	</td>";
		html += "                                            </tr>";
		html += "                                            <tr>";
		html += "                                            	<td width=\"61\" valign=\"top\">";
		html += "                                            		<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:11px;font-family:Arial,Helvetica,sans-serif\"><strong>E-mail::</strong></span>";
		html += "                                            	</td>";
		html += "                                            	<td width=\"303\" valign=\"top\">";
		html += "                                            		<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-family:Arial,Helvetica,sans-serif\">" + userEmail + "</span>";										  
		html += "                                            	</td>";
		html += "                                            </tr>";
		html += "                                            <tr>";
		html += "                                            	<td valign=\"top\">";
		html += "                                                	<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:11px;font-family:Arial,Helvetica,sans-serif\"><strong>Username:</strong></span>";
		html += "                                                </td>";
		html += "                                                <td valign=\"top\"> ";
		html += "                                                    <span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-family:Arial, Helvetica, sans-serif\">" + userNickname + "</span>";
		html += "                                                </td>";
		html += "                                            </tr>";		
		html += "                                            <tr>";
		html += "                                           	<td valign=\"top\">";
		html += "                                                	<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:11px;font-family:Arial,Helvetica,sans-serif\"><strong>Newsletter:</strong></span>";
		html += "                                                </td>";
		html += "                                                <td valign=\"top\"> ";
		html += "                                                    <span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-family:Arial,Helvetica,sans-serif\">Yes</span>";
		html += "                                                </td>";
		html += "                                            </tr>";
		html += "										</table>";
		html += "                                    </td>";
		html += "								</tr>";
		html += "							</table>";
		html += "						</td>";
		html += "					</tr>";
		html += "					<tr>";
		html += "						<td width=\"500\" height=\"3\"></td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                   		<td width=\"500\" height=\"10\">";
		html += "                    		<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-family:Arial,Helvetica,sans-serif\">From this moment on, you can start to use the tools provided by the teleSUR community. To enter your public profile, visit: </span>	";								
		html += "                        </td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                    	<td width=\"500\" height=\"40\">";
		html += "                        	<span size=\"3\" face=\"Arial, Helvetica, sans-serif\" style=\"font-family:Arial, Helvetica, sans-serif;font-size:medium\">";
		html += "                            	<a target=\"_blank\" title=\"Profile\" href=\"http:www.telesurtv.net/english/" + userLinkFriendly + "\">http:www.telesurtv.net/english/" + userLinkFriendly + "</a>";
		html += "                            </span>";									
		html += "                        </td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                    	<td width=\"500\" height=\"10\"></td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                    	<td width=\"500\" height=\"1\"></td>";
		html += "                    </tr>";
		html += "					<tr>";
		html += "						<td width=\"500\" height=\"20\"><table width=\"272\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
		html += "							<tr>";
		html += "                                <td>";
		html += "                                	<span size=\"3\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">Follow us:</span>	";
		html += "                                </td>";
		html += "                                <td>";
		html += "                                	<table cellspacing=\"0\" cellpadding=\"0\">	";																							
		html += "                                		<tbody>";
		html += "                                			<tr>";																									
		html += "                                            	<td><a href=\"http://facebook.com/teleSUR/telesurenglish\"><img src=\"" + urlSite + "/arte/mails/redes_fb.jpg\" height=\"25\" width=\"28\" border=\"0\" alt=\"Facebook\" title=\"Facebook\"></a></td>";
		html += "                                                <td width=\"8\"></td>";																									
		html += "                                                <td><a href=\"http://twitter.com/telesurenglish\"><img src=\"" + urlSite + "/arte/mails/redes_tt.jpg\" height=\"25\" width=\"28\" border=\"0\" alt=\"Twitter\" title=\"Twitter\"></a></td>	";																								
		html += "                                               <td width=\"8\"></td>	";																								
		html += "                                                <td><a href=\"https://plus.google.com/111711418326585120017/posts\"><img src=\"" + urlSite + "/arte/mails/redes_gg.jpg\" height=\"25\" width=\"28\" border=\"0\" alt=\"Google +\" title=\"Google +\"></a></td>";																									
		html += "                                                <td width=\"8\"></td>";																									
		html += "                                                <td></td>";																							
		html += "                                            </tr>	";																						
		html += "                                        </tbody>";
		html += "                                     </table>";
		html += "								</td>";
		html += "							</tr>";
		html += "						</td>";
		html += "					</tr>";
		html += "                    <tr>";
		html += "                    	<td width=\"500\" height=\"20\"></td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                        <td width=\"500\" height=\"10\">";
		html += "                        	<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-family:Arial,Helvetica,sans-serif\">Greetings,</span>	";								
		html += "                        </td>";
		html += "                    </tr>";
		html += "                    <tr>";
		html += "                        <td width=\"500\" height=\"10\" valign=\"top\">";
		html += "                        	<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-family:Arial, Helvetica, sans-serif\">teleSUR</span>";
		html += "                        </td>";
		html += "                    </tr>";
		html += "				</td>";
		html += "			</tr>";
		html += "			<tr></tr>";
		html += "			<tr>";
		html += "            	<td valign=\"top\" colspan=\"3\">";
		html += "					<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" style=\"font-size:10px;font-family:Arial,Helvetica,sans-serif; color:#666666; margin-left:5px;\">teleSUR © La nueva Televisión del Sur C.A. (TVSUR) RIF: G-20004500-0</span>";
		html += "                </td>";
		html += "            </tr>";
		html += "			</tbody>";
		html += "		</table>";
		html += "	</mailbody>";
		html += "</html>";
		html = html.replace("mailbody","body");
		
		com.tfsla.opencms.mail.SimpleMail mailConfirmation = new com.tfsla.opencms.mail.SimpleMail();
		mailConfirmation.setSubject("Welcome to teleSUR");
		mailConfirmation.setHtmlContents(html);
		mailConfirmation.addTo(userEmail);
		// para el sitio en ingles usar mailConfirmation.setFrom("telesuringles@telesurtv.net");   
		mailConfirmation.setFrom("telesuringles@telesurtv.net");   
		mailConfirmation.send();
%>								
	<!-- inicio col-mid -->
	<div class="row clear"> 
		<div class="col">
			<div class="errorconfig">
				<div class="txtavisofondo">¡<%=userFirstname + " " + userLastname %>, thanks for confirming your registration! Already part of the site</div>
			</div>
			<div class="btnConf">
				<a href="/english/users/profile_edit.html">Complete your profile</a>
				<a href="/english/index.html">Continue browsing the site</a>
			</div>
		</div>
	</div>
	</nt:user>
</c:if>
	
<c:if test="${confirmationError}">
	<div class="row clear"> 
		<div class="col">
			<div class="txtaviso">
		                 Error process confimación.
		        </div>
		</div>
	</div>
</c:if>