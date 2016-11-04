<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.DataOutputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.StringReader" %>
<%@ page import="java.io.* " %>
<%@ page import="java.net.URL" %>
<%@ page import="javax.json.*" %>
<%@ page import="javax.net.ssl.HttpsURLConnection" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>




<%
    //definiendo el array de items     
    
    
    
    String[] itemsRevision = {"Boletín Español","Boletín Inglés","Streaming Principal","Streaming Backup", "Streaming Alterno 1", "Streaming Alterno 2", "Streaming App Android/iOS", "Home Español", "Secciones Español", "Sitio Videos Español", "Add This Español", "Home Inglés", "Secciones Inglés", "Sitio Videos Inglés", "Add This Inglés"};
    String[] itenValores = {"boletinEsp","boletinIng","sp","sb", "sAlt1", "sAlt2", "sApp", "homeEspanol", "seccionesEspanol", "videosEspanol", "AddThisEspanol", "homeIngles", "seccionesIngles", "videosIngles", "AddThisIngles"};
    String[] itemObservacion = {"bolEspObser","bolIngObser","spObserv","sbObserv", "sAlt1Observ", "sAlt2Observ", "sAppObserv", "homeEspanolObserv", "seccionesEspanolObserv", "videosEspanolObserv", "AddThisEspanolObserv", "homeInglesObserv", "seccionesInglesObserv", "videosInglesObserv", "AddThisInglesObserv"};
    String observacion ="";
    String contenido ="";
    int i =0;
    
    

    // valores de item
    String boletinEsp ="";
    String boletinIng =""; 
    String sp =""; 
    String sb =""; 
    String sAlt1 =""; 
    String sAlt2 =""; 
    String sApp =""; 
    String homeEspanol =""; 
    String seccionesEspanol =""; 
    String videosEspanol =""; 
    String AddThisEspanol ="";
    String homeIngles ="";
    String seccionesIngles ="";
    String videosIngles ="";
    String AddThisIngles ="";
  
    
    //item  obervacion
    String bolEspObser ="";
    String bolIngObser =""; 
    String spObserv =""; 
    String sbObserv =""; 
    String sAlt1Observ =""; 
    String sAlt2Observ =""; 
    String sAppObserv =""; 
    String homeEspanolObserv =""; 
    String seccionesEspanolObserv =""; 
    String videosEspanolObserv =""; 
    String AddThisEspanolObserv ="";
    String homeInglesObserv ="";
    String seccionesInglesObserv ="";
    String videosInglesObserv ="";
    String AddThisInglesObserv ="";
     
   //item valores
   
   if (request.getParameter("boletinEsp") != null ) {
   	boletinEsp = request.getParameter("boletinEsp");
   }
   
   if (request.getParameter("boletinIng") != null ) {
   	boletinIng = request.getParameter("boletinIng");
   }
   
   if (request.getParameter("sp") != null ) {
   	sp = request.getParameter("sp");
   }
   
   if (request.getParameter("sb") != null ) {
   	sb = request.getParameter("sb");
   }
   
   if (request.getParameter("sAlt1") != null ) {
   	sAlt1 = request.getParameter("sAlt1");
   }
   
   if (request.getParameter("sAlt2") != null ) {
   	sAlt2 = request.getParameter("sAlt2");
   }
   
   if (request.getParameter("sApp") != null ) {
   	sApp = request.getParameter("sApp");
   }
   
   if (request.getParameter("homeEspanol") != null ) {
   	homeEspanol = request.getParameter("homeEspanol");
   }
   
   if (request.getParameter("seccionesEspanol") != null ) {
   	seccionesEspanol = request.getParameter("seccionesEspanol");
   }
   
   if (request.getParameter("videosEspanol") != null ) {
   	videosEspanol = request.getParameter("videosEspanol");
   }
   
   if (request.getParameter("AddThisEspanol") != null ) {
   	AddThisEspanol = request.getParameter("AddThisEspanol");
   }
   
   if (request.getParameter("homeIngles") != null ) {
   	homeIngles = request.getParameter("homeIngles");
   }
   
   if (request.getParameter("seccionesIngles") != null ) {
   	seccionesIngles = request.getParameter("seccionesIngles");
   }
   
   if (request.getParameter("videosIngles") != null ) {
   	videosIngles = request.getParameter("videosIngles");
   }
    if (request.getParameter("AddThisIngles") != null ) {
   	AddThisIngles = request.getParameter("AddThisIngles");
   }
   
   //observacion de los items
   
    if (request.getParameter("bolEspObser") != null ) {
   	bolEspObser = request.getParameter("bolEspObser");
   }
   
   if (request.getParameter("bolIngObser") != null ) {
   	bolIngObser = request.getParameter("bolIngObser");
   }
   
   if (request.getParameter("spObserv") != null ) {
   	spObserv = request.getParameter("spObserv");
   }
   
   if (request.getParameter("sbObserv") != null ) {
   	sbObserv = request.getParameter("sbObserv");
   }
   
   if (request.getParameter("sAlt1Observ") != null ) {
   	sAlt1Observ = request.getParameter("sAlt1Observ");
   }
   
   if (request.getParameter("sAlt2Observ") != null ) {
   	sAlt2Observ = request.getParameter("sAlt2Observ");
   }
   
   if (request.getParameter("sAppObserv") != null ) {
   	sAppObserv = request.getParameter("sAppObserv");
   }
   
   if (request.getParameter("homeEspanolObserv") != null ) {
   	homeEspanolObserv = request.getParameter("homeEspanolObserv");
   }
   
   if (request.getParameter("seccionesEspanolObserv") != null ) {
   	seccionesEspanolObserv = request.getParameter("seccionesEspanolObserv");
   }
   
   if (request.getParameter("videosEspanolObserv") != null ) {
   	videosEspanolObserv = request.getParameter("videosEspanolObserv");
   }
   
   if (request.getParameter("AddThisEspanolObserv") != null ) {
   	AddThisEspanolObserv = request.getParameter("AddThisEspanolObserv");
   }
   
   if (request.getParameter("homeInglesObserv") != null ) {
   	homeInglesObserv = request.getParameter("homeInglesObserv");
   }
   
   if (request.getParameter("seccionesInglesObserv") != null ) {
   	seccionesInglesObserv = request.getParameter("seccionesInglesObserv");
   }
   
   if (request.getParameter("videosInglesObserv") != null ) {
   	videosInglesObserv = request.getParameter("videosInglesObserv");
   }
   
     if (request.getParameter("AddThisInglesObserv") != null ) {
   	AddThisInglesObserv = request.getParameter("AddThisInglesObserv");
   }
   
   String[] valoresItem = {boletinEsp, boletinIng, sp, sb, sAlt1, sAlt2, sApp, homeEspanol, seccionesEspanol, videosEspanol, AddThisEspanol, homeIngles, seccionesIngles, videosIngles, AddThisIngles };
   String[] observItem = {bolEspObser, bolIngObser, spObserv, sbObserv, sAlt1Observ, sAlt2Observ, sAppObserv, homeEspanolObserv, seccionesEspanolObserv, videosEspanolObserv, AddThisEspanolObserv, homeInglesObserv, seccionesInglesObserv, videosInglesObserv, AddThisInglesObserv};
   contenido = "<!DOCTYPE html><html lang=\"es\"><head><meta charset=\"UTF-8\"></head><body><table><thead><tr><th>Servicio</th><th>Estatus</th><th>Observación</th></tr></thead><tbody>";
   for(i=0;i<itenValores.length;i++){
      contenido = contenido + "<tr><td>"+itemsRevision[i]+"</td>";
      if (valoresItem[i].equals("1")){
          contenido = contenido + "<td>ok</td>";
      }
      else{
          contenido = contenido + "<td>Error</td>";   
      }
      if (observItem[i].length()>0){
     observacion = observItem[i];     
      } 
      else {
           observacion = "No Aplica"; 
      }
      contenido = contenido + "<td>"+ observacion+"</td></tr>";         
   }
      
  contenido = contenido + "</tr></tbody></table></body></html>";
  
 //out.println(contenido);
 
  //probando como retornar una resueta json desde jsp
  
     JSONObject jsonData = new JSONObject();
  
 try{
  com.tfsla.opencms.mail.SimpleMail mailConfirmation = new com.tfsla.opencms.mail.SimpleMail();
  mailConfirmation.setSubject("Revisión Diaria");
  mailConfirmation.setHtmlContents("<php echo 'hola';?>");
  mailConfirmation.addTo("ysrr27@gmail.com");
  mailConfirmation.setFrom("contactenos@telesurtv.net");
   mailConfirmation.send();
  //si el correo se nvia de forma satisfactoria 
  jsonData.put("success", true);
  jsonData.put("message", "Los datos de la revisión diaria se han enviado de forma satisfactoria.");	
    
   out.flush();
  

}catch(Exception e){
   e.printStackTrace();
   jsonData.put("success", false);
   jsonData.put("message", "Ha ocurrido un error al enviar el correo.");   
  out.flush();  
 }
 
  String json = new Gson().toJson(jsonData); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
  response.setContentType("application/json");
  response.setCharacterEncoding("UTF-8");
  response.getWriter().write(json);

 


 
      


      
      
%>
