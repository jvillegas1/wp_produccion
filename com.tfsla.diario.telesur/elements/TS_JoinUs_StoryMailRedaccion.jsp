<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.mail.CmsSimpleMail,
			org.opencms.jsp.CmsJspLoginBean" %>

<%
String ruta = "http://telesur.cms-medios.com/";
String mensaje = request.getParameter("storyComment");
String name = request.getParameter("storyName");
String email = request.getParameter("storyEmail");
String numero = request.getParameter("storyNumber");
String titulo = request.getParameter("storyTitle");
					
String html = "";
html += "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
html += "<html xmlns=\"http://www.w3.org/1999/xhtml\">";
html += "    <head>";
html += "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />";
html += "        <title>teleSUR</title>";
html += "    </head>";
html += "    <mailbody>";
html += "	<table width=\"600\" border=\"0\" bgcolor=\"#ffffff\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\" style=\"border:1px solid #e3e2e2\">	";
html += "		<tbody valign=\"top\">";
html += "            		<tr>";
html += "            			<td width=\"98\" height=\"24\" rowspan=\"2\" valign=\"top\"><img src=\"" + ruta + "/arte/mails/BarraLargaLogo.jpg\" width=\"98\" height=\"410\" /></td>";
html += "            		</tr>";
html += "            		<tr>";
html += "            			<td width=\"10\" valign=\"top\">";
html += "            				<img src=\"" + ruta + "/arte/mails/spc.gif\" height=\"10\" width=\"10\" />";									
html += "            			</td>";
html += "            			<td width=\"490\" valign=\"top\">";	
html += "				   <table width=\"600\" cellpadding=\"0\" style=\"border:1px solid #e3e2e2\">";
html += "					<tbody>";
html += "            				<tr>";
html += "						<td width=\"21\" height=\"35\" ></td>";
html += "            					<td width=\"558\" height=\"20\" valign=\"top\">";
html += "            						<span color=\"#000000\" style=\"font-size:x-large;font-family:Arial,Helvetica,sans-serif\"><strong> Hemos recibido una historia </strong></span>	";						
html += "            					</td>";
html += "						<td width=\"21\" ></td>";
html += "            				</tr>";
html += "                   			<tr>";
html += "                    				<td width=\"21\" height=\"17\" ></td>";
html += "						<td width=\"558\" height=\"17\" ></td>";
html += "						<td width=\"21\" height=\"17\" ></td>";
html += "                    			</tr>";	
html += "            				<tr>";
html += "						<td width=\"21\" ></td>";
html += "						<td width=\"558\" height=\"12\" valign=\"top\" bgcolor=\"#DFDFDF\">";
html += "							<table width=\"558\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
html += "								<tr>";
html += "                                     					<td width=\"364\" valign=\"top\">";
html += "											<table width=\"364\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
html += "                                            							<tr>";
html += "                                            								<td width=\"61\" valign=\"top\">";
html += "                                            									<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\"><strong>Título:</strong></span>";
html += "                                            								</td>";
html += "                                            								<td width=\"303\" valign=\"top\">";
html += "                                            									<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">" + titulo + "</span>";										  
html += "                                            								</td>";
html += "                                           							 </tr>";
html += "                                            							<tr>";
html += "                                            								<td width=\"61\" valign=\"top\">";
html += "                                            									<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\"><strong>Nombre:</strong></span>";
html += "                                            								</td>";
html += "                                            								<td width=\"303\" valign=\"top\">";
html += "                                            									<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">" + name + "</span>";										  
html += "                                            								</td>";
html += "                                           							 </tr>";											
html += "                                            							<tr>";
html += "                                            								<td width=\"61\" valign=\"top\">";
html += "                                            									<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\"><strong>Email:</strong></span>";
html += "                                            								</td>";
html += "                                            								<td width=\"303\" valign=\"top\">";
html += "                                            									<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">" + email + "</span>";										  
html += "                                            								</td>";
html += "                                           							 </tr>";
html += "                                            							<tr>";
html += "                                            								<td width=\"61\" valign=\"top\">";
html += "                                            									<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\"><strong>Télefono:</strong></span>";
html += "                                            								</td>";
html += "                                            								<td width=\"303\" valign=\"top\">";
html += "                                            									<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">" + numero + "</span>";										  
html += "                                            								</td>";
html += "                                           							 </tr>";
html += "                                            							<tr>";
html += "                                            								<td width=\"61\" valign=\"top\">";
html += "                                            									<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\"><strong>Mensaje:</strong></span>";
html += "                                            								</td>";
html += "                                            								<td width=\"303\" valign=\"top\">";
html += "                                            									<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">" + mensaje + "</span>";										  
html += "                                            								</td>";
html += "                                           							 </tr>";																						
html += "											</table>";
html += "										</td>";	
html += "            								</tr>";		
html += "            					</td>";
html += "						<td width=\"21\" ></td>";
html += "            				</tr>";
html += "					</tbody>";
html += "				    </table>";
html += "				</td>";
html += "			</tr>";
html += "			<tr></tr>";
html += "			<tr>";
html += "            			<td valign=\"top\" colspan=\"3\">";
html += "					<span size=\"5\" face=\"Arial, Helvetica, sans-serif\" style=\"font-size:10px;font-family:Arial,Helvetica,sans-serif; color:#666666; margin-left:5px;\">teleSUR © La nueva Televisión del Sur C.A. (TVSUR) RIF: G-20004500-0</span>";
html += "               		 </td>";
html += "            		</tr>";
html += "		</tbody>";
html += "	    </table>";
html += "	</mailbody>";
html += "</html>";
html = html.replace("mailbody","body");	

com.tfsla.opencms.mail.SimpleMail mail = new com.tfsla.opencms.mail.SimpleMail();

mail.setSubject(titulo);
mail.setHtmlContents(html);
mail.addTo("telesurespanol@telesurtv.net");
mail.setFrom(email);
mail.send(); 	
%>