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



<%
    String testing = (request.getParameter("testing") != null) ? request.getParameter("testing") : "";

    String nombre = "";
    String correo = "";
    String pais = "";
    String mensaje = "";
    boolean error = false;
    boolean validForm = false;
    String errorMessage = null;
    String msg = "";
    String ErrMensage = "";
    
   // String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
   String gRecaptchaResponse  = (request.getParameter("g-recaptcha-response") != null) ? request.getParameter("g-recaptcha-response") : "";
     
    boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
                   //  out.println(gRecaptchaResponse);
               if(gRecaptchaResponse.equals("")){
                   ErrMensage = "* Debe completar el campo Captcha";                   
                }
        
                   

    if (request.getParameter("nombre") != null && request.getParameter("correo") != null && request.getParameter("pais") != null && verify && request.getParameter("mensaje") != null) {
        nombre = (String) request.getParameter("nombre");
        correo = (String) request.getParameter("correo");
        pais = (String) request.getParameter("pais");
        mensaje = (String) request.getParameter("mensaje");
        

        if (testing.equals("http://devcms.telesurtv.net/pages/contacto.html")) {
            error = true;
            msg= "paso el if";
        } else {

            if (nombre.equals("") || correo.equals("") || pais.equals("") || mensaje.equals("") || gRecaptchaResponse.equals("")) {
                error = true;
             //   ErrMensage = "Debe completar alguno de los campos";  
                
            } else {
                com.tfsla.opencms.mail.SimpleMail mailConfirmation = new com.tfsla.opencms.mail.SimpleMail();
                mailConfirmation.setSubject("Contact from the TeleSUR Website");
                String html = "<html><head></head><mailbody>Contact message from TeleSUR <br/> Name : " + nombre + "<br/> Email: " + correo + "<br/> Country: " + pais + "<br/> Message: " + mensaje + "</mailbody></html>";
                mailConfirmation.setHtmlContents(html);
                mailConfirmation.addTo("ysanchez@telesurtv.net");
                mailConfirmation.setFrom(correo);
                mailConfirmation.send();
                validForm = true;
               
            }
        }
    } else {
        if (request.getParameter("send") != null) {
            error = true;
        }
    }

%>

<%!  
 
    public static class VerifyRecaptcha {

        public static final String url = "https://www.google.com/recaptcha/api/siteverify";
        public  static final String secret = "6Lc4XhETAAAAAKVglxI9PNgG1Hjs_oNRztJngutP";
        private final static String USER_AGENT = "Mozilla/5.0";

        public static  boolean verify(String gRecaptchaResponse) throws IOException {
            if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
                return false;
            }

            try{
            URL obj = new URL(url);
            HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

            // add reuqest header
            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", USER_AGENT);
            con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

            String postParams = "secret=" + secret + "&response="
                    + gRecaptchaResponse;

            // Send post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'POST' request to URL : " + url);
            System.out.println("Post parameters : " + postParams);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(
                    con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            
            in.close();
    		
    		
    		return true;

      
            
            }catch(Exception e){
                e.printStackTrace();
                return false;
            }
        }
    }

%>
 


<c:set var="validFormMessage" scope="page" value="<%= validForm%>" />
<c:set var="errorMessage" scope="page" value="<%= error%>" />
<div class="validForm" id="${validFormMessage}"></div>

<div class="wrapper">
    <div class="row clear">
        <div class="col">
            <div class="cont">
               <!-- <h1>Contacto</h1>-->

                <div style="text-align: center;">&nbsp;</div>
                <div class="contacto">
                    <div class="centrar errorInfo" id="errorInf" style="display: none;"><b>Alert!</b><span id="error"></span></div>
                    <c:if test="${errorMessage}">
                        <div class="cont"> 
                            <div class="error">
                                <div class="txtaviso">
                                    The form has been completed successfully. Check the highlighted fields.
                                    </br>
                                    <%=ErrMensage%>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${validFormMessage}">
                        <div class="cont"> 
                            <div class="aprobado">
                                <div class="txtaviso">
                                     Soon our team contacts you. Thanks for writing to us.
                                     </br>
                                    <input type="button" class="btn-1 btn-1c btnVolver" value="Volver" onclick="window.location = '/pages/contacto.html';"/>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    
                    
          <script>

//var itags = $(".validForm").attr("id"); 
$(".validForm").each(function(){
		  
		   itags = $(this).attr("id");
		  
		  });
		  if(itags=="true"){
		  //alert(itags +"fino");
		   $("#validform").hide();
		  
		  }
		  


</script>