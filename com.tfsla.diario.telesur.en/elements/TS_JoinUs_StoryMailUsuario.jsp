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
html += "            						<span color=\"#000000\" style=\"font-size:x-large;font-family:Arial,Helvetica,sans-serif\"><strong> We have recieved you story </strong></span>	";						
html += "            					</td>";
html += "						<td width=\"21\" ></td>";
html += "            				</tr>";
html += "                   			<tr>";
html += "                    				<td width=\"21\" height=\"17\" ></td>";
html += "						<td width=\"558\" height=\"17\" >";
html += "							<span color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\"><strong> " + name + " </strong></span>";
html += "						</td>";
html += "						<td width=\"21\" height=\"17\" ></td>";
html += "                    			</tr>";	
html += "					<tr>";
html += "						<td width=\"21\" height=\"31\" ></td>";
html += "						<td width=\"558\" height=\"31\" ></td>";
html += "						<td width=\"21\" height=\"31\" ></td>";
html += "                      			</tr>";												
html += "                       		<tr>";																
html += "						<td width=\"21\" height=\"12\" ></td>";
html += "						<td width=\"558\" height=\"12\" >";
html += "							<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">Your information was sucessfuly recieved. Thanks for visiting our website. Continue in teleSUR</span>";
html += "						</td>";
html += "						<td width=\"21\" height=\"12\" ></td>";
html += "                       		</tr>";														
html += "					<tr>";
html += "						<td width=\"21\" height=\"31\" ></td>";
html += "						<td width=\"558\" height=\"31\" ></td>";
html += "						<td width=\"21\" height=\"31\" ></td>";
html += "                      			</tr>";
html += "                       		<tr>";																
html += "						<td width=\"21\" height=\"12\" ></td>";
html += "						<td width=\"558\" height=\"12\" >";
html += "							<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">Read our news in:<br /> <a href=\"http://www.telesurtv.net/\">www.telesurtv.net/</a></span>";
html += "						</td>";
html += "						<td width=\"21\" height=\"12\" ></td>";
html += "                       		</tr>";
html += "					<tr>";
html += "						<td width=\"21\" height=\"20\" ></td>";
html += "						<td width=\"558\" height=\"20\" ></td>";
html += "						<td width=\"21\" height=\"20\" ></td>";
html += "                       		</tr>";		       	
html += "		        		<tr>";
html += "						<td width=\"21\" height=\"20\" ></td>";	
html += "						<td width=\"558\" height=\"20\"><table width=\"272\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
html += "							<tr>";
html += "                                				<td>";
html += "                                					<span size=\"3\" face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">and follow us on our social networks:</span>	";
html += "                               				 </td>";
html += "                                				<td>";
html += "                                					<table cellspacing=\"0\" cellpadding=\"0\">";																							
html += "                                						<tbody>";
html += "                                							<tr>";																									
html += "                                            							<td><a href=\"http://facebook.com/teleSUR\"><img src=\"" + ruta + "/arte/mails/redes_fb.jpg\" height=\"25\" width=\"28\" border=\"0\" alt=\"Facebook\" title=\"Facebook\"></a></td>";
html += "                                                						<td width=\"8\"></td>";																									
html += "                                                						<td><a href=\"http://twitter.com/teleSURtv\"><img src=\"" + ruta + "/arte/mails/redes_tt.jpg\" height=\"25\" width=\"28\" border=\"0\" alt=\"Twitter\" title=\"Twitter\"></a></td>	";																								
html += "                                               						<td width=\"8\"></td>	";																								
html += "                                                						<td><a href=\"https://plus.google.com/u/0/118206615613074383260/posts\"><img src=\"" + ruta + "/arte/mails/redes_gg.jpg\" height=\"25\" width=\"28\" border=\"0\" alt=\"Google +\" title=\"Google +\"></a></td>";																									
html += "                                                						<td width=\"8\"></td>";																									
html += "                                                						<td></td>";																							
html += "                                            						</tr>	";																						
html += "                                        					</tbody>";
html += "                                     					</table>";
html += "								</td>";
html += "							</tr>";
html += "						</td>";
html += "						<td width=\"21\" height=\"20\" ></td>";
html += "					</tr>";
html += "                    			<tr>";
html += "						<td width=\"21\" height=\"20\" ></td>";
html += "                    				<td width=\"558\" height=\"20\"></td>";
html += "						<td width=\"21\" height=\"20\" ></td>";
html += "                    			</tr>";
html += "                    			<tr>";
html += "						<td width=\"21\" height=\"10\" ></td>";
html += "                        			<td width=\"558\" height=\"10\">";
html += "                        				<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial,Helvetica,sans-serif\">Greetings,</span>	";								
html += "                        			</td>";
html += "						<td width=\"21\" height=\"10\" ></td>";
html += "                    			</tr>";
html += "                    			<tr>";
html += "						<td width=\"21\" height=\"10\" ></td>";
html += "                        			<td width=\"558\" height=\"10\" valign=\"top\">";
html += "                        				<span face=\"Arial, Helvetica, sans-serif\" color=\"#000000\" style=\"font-size:medium;font-family:Arial, Helvetica, sans-serif\">teleSUR</span>";
html += "                        			</td>";
html += "						<td width=\"21\" height=\"10\" ></td>";
html += "                    			</tr>";
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
mail.addTo(email);
mail.setFrom("telesuringles@telesurtv.net");
mail.send(); 	
%>