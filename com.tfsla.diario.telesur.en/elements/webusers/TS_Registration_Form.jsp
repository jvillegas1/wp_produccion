
<%@ include file="../../elements/TS_Common_Libraries.jsp" %>
<%@ page import="org.opencms.jsp.CmsJspActionElement" %>
<%@ page import="org.opencms.jsp.CmsJspLoginBean" %>
<%@ page import="com.tfsla.opencms.webusers.*" %>
<%@ page import="org.opencms.file.CmsUser" %>
<%@ page import="org.opencms.main.CmsLog" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tfsla.opencms.webusers.UserDAO" %>
<%@ page import="com.tfsla.diario.comentarios.services.CommentsModule" %>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.capcha.*" %>

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
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
CmsJspLoginBean loginBean = new CmsJspLoginBean(pageContext, request, response);

String currentUri 		= cms.getRequestContext().getUri();

String nickname 		= ( request.getParameter("nickname") != null ) ? request.getParameter("nickname") : "";
String firstname 		= ( request.getParameter("firstname") != null ) ? request.getParameter("firstname") : "";
String lastname 		= ( request.getParameter("lastname") != null ) ? request.getParameter("lastname") : "";
String pais	 		= ( request.getParameter("pais") != null ) ? request.getParameter("pais") : "";
String email 			= ( request.getParameter("email") != null ) ? request.getParameter("email").trim() : "";
String email_confirm		= ( request.getParameter("email_confirm") != null ) ? request.getParameter("email_confirm").trim() : "";
String password 		= ( request.getParameter("password") != null ) ? request.getParameter("password") : "";
String password_confirm 	= ( request.getParameter("password_confirm") != null ) ? request.getParameter("password_confirm") : "";
Boolean registracion		= ( request.getParameter("registracion") != null) ? true : false;
Boolean termsAcepted		= ( request.getParameter("termsAcepted") != null ) ? true : false;
Boolean boletinteleSUR		= ( request.getParameter("boletinteleSUR") != null) ? true : false;

String registeredUserName 	= null;
String errorMessage 		= "";

Boolean registrationError 	= false;
Boolean apodoIsAlreadyUsed 	= false;
Boolean apodoIsValid		= true;
Boolean apodoError 		= false;
Boolean apodoEmailError		= false;
Boolean apodoEmpty		= false;
Boolean paisEmpty		= false;
Boolean mailError		= false;
Boolean mailEmpty		= false;
Boolean mail_confirmEmpty	= false;
Boolean showDiferentMail 	= false;
Boolean passwordEmpty		= false;
Boolean password_confirmEmpty	= false;
Boolean PassEmpty 		= false;
Boolean PassError 		= false;
Boolean showDiferentPass 	= false;
Boolean showCapchaError 	= false;
Boolean checkTermsError 	= false;
Boolean registredMailPending 	= false;
Boolean errorFirstNameEmpty	= false;
Boolean errorLastNameEmpty	= false;
Boolean verify	= false;
 String ErrMensage = "";
 String ErrMensage1 = "";

// String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
   String gRecaptchaResponse  = (request.getParameter("g-recaptcha-response") != null) ? request.getParameter("g-recaptcha-response") : "";
     
    verify = VerifyRecaptcha.verify(gRecaptchaResponse);
    
                                   
	
	   if(verify == false){
                   ErrMensage = "* You must complete the Captcha field";   }  
                   else { 
                   
                   	 verify = VerifyRecaptcha.verify(gRecaptchaResponse);
                   }


if ( termsAcepted && registracion) {
	//se inicia con true, para que cuando el usuario ingrese por primera vez no se muestren los mensajes de error.
	//si el usuario manda el formulario, se setea en false para que se valide correctamente.	
	apodoIsValid		= false;
	
      String j_captcha_response = request.getParameter("j_captcha_response") != null ? request.getParameter("j_captcha_response") : "";
     
        showCapchaError = Boolean.valueOf(!showCapchaError.booleanValue());
        
	
	apodoIsAlreadyUsed = RegistrationModule.getInstance(cms.getCmsObject()).checkExistsPropertyInUsersCI(cms.getCmsObject(), "APODO", nickname, email, true);
	apodoIsValid = RegistrationModule.getInstance(cms.getCmsObject()).isValidNickName(nickname);
	
	if ( nickname.equals("") ) 
		apodoEmpty = true;
	
	if ( nickname.indexOf("script") > -1 || nickname.indexOf("SCRIPT") > -1 || nickname.indexOf("<") > -1 || nickname.indexOf(">") > -1 || nickname.length() > 20 )
		apodoError = true;
       
	if ( pais.equals(""))
		paisEmpty = true;
		
        if ( !password.equals(password_confirm))
		showDiferentPass = true;
		
	if (  password.equals("") )
		passwordEmpty = true;
		
	if ( password_confirm.equals("") )
		password_confirmEmpty = true;
		
	if ( firstname.equals("") )
		errorFirstNameEmpty = true;
		
	if ( lastname.equals("") )
		errorLastNameEmpty = true;
	
	if ( !email.equals(email_confirm))
		showDiferentMail = true;
		
	if ( email.equals("") )
		mailEmpty = true;
		
	if ( email_confirm.equals("") )
		mail_confirmEmpty = true;
	
	if( verify == false) {
               showCapchaError = true;  }
        else { 
               showCapchaError = false; }         
         
        if ( !showCapchaError && !apodoError && !apodoIsAlreadyUsed && !apodoEmpty && !paisEmpty && !showDiferentPass && !mailEmpty && !showDiferentMail ) {
 		
		List<String> atributosExtra = new ArrayList<String>(8);
		List<String> valoresExtra = new ArrayList<String>(8);
		
		atributosExtra.add("APODO");
		valoresExtra.add(nickname);
		
		atributosExtra.add("TIPO_REGISTRACION");
		valoresExtra.add("t");

		atributosExtra.add("RECIBIR_AVISO_COMENTAN_POST");
		valoresExtra.add("FALSE");
		
		atributosExtra.add("RECIBIR_AVISO_RESPONDEN_COMENTARIO");
		valoresExtra.add("FALSE");
		
		atributosExtra.add("AUTOR_COMENTARIOS_NOTAS");
		valoresExtra.add("apodo");
		
		atributosExtra.add("USER_MOSTRAR_APODO");
		valoresExtra.add("TRUE");
		
		atributosExtra.add("USER_MOSTRAR_NOMBRE");
		valoresExtra.add("FALSE");	
		
		if (boletinteleSUR) {
			atributosExtra.add("SUSCRIPCION_BOLETIN_TELESUR");
			valoresExtra.add("TRUE");	
		} else { 
			atributosExtra.add("SUSCRIPCION_BOLETIN_TELESUR");
			valoresExtra.add("FALSE");	
		}
		
		
		//registra al usuario
		try {
		   	CmsUser newUser = RegistrationModule.getInstance(cms.getCmsObject()).addWebUser( cms.getCmsObject(),
										  email,
                        							  password,
                        							  password_confirm,
                        							  firstname,
                        							  lastname,
                        							  email,
                        							  email,
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
                        							  atributosExtra, valoresExtra, new ArrayList());

		    	registeredUserName = newUser.getName();
						
		} catch(BusinessException e) {
			errorMessage = e.getMessage();
			registrationError = true;
			//out.println("errorMessage: "+errorMessage);
		} catch (Exception e) {
			registrationError = true;
			errorMessage = e.getMessage();
			try {
				CmsLog.getLog(this).error(e.getMessage(), e);
				//out.println(e.getMessage());
			} catch(Exception e2) {
				//nada por hacer
				//out.println(e2.getMessage());
			}
		}
         }
}

if( errorMessage !=null && !errorMessage.equals("")){ 
	if( errorMessage.indexOf("There is already a user with the name") > -1 ){
		boolean isPending = RegistrationModule.getInstance(cms.getCmsObject()).isPending(cms.getCmsObject(), "webuser/" + email);
		
		if(isPending){
			errorMessage = "The user is pending confirmation. We've sent an email to confirm your information";
			registredMailPending = true; 
			try{
				RegistrationModule.getInstance(cms.getCmsObject()).forgotPassword(cms.getCmsObject(), email, email);
			}
			catch (Exception e) {}
		}
		else{
			errorMessage = "The mail is already registered";
			mailError = true;
		}
	}
	if( errorMessage.equals("El nombre de usuario debe ser una direccion de e-mail")){
		//errorMessage = "El mail no es válido";
		apodoEmailError = true;
	}
	if( errorMessage.equals("Debe ingresar nombre de usuario")){
		errorMessage = "You must enter a mail";
		mailError = true;
	}
	if( errorMessage.equals("La direccion de mail ingresada corresponde a un usuario previamente registrado")){
		mailError = true;
	}
	if( errorMessage.equals("Debe ingresar password")){
		PassEmpty = true;
	} else if( errorMessage.indexOf("password") > -1 ){
		PassError = true;
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
 <div class="cont1">
	<div class="titreg desktop">
		Registration
	</div>
	
	<div class="form_reg">
<%
if ( registeredUserName == null ) {
%>

		<form class="reg-form" id="registration" name="registration" method="post" action="<%=currentUri%>">
			<%if(errorFirstNameEmpty || errorLastNameEmpty || apodoEmpty || !apodoIsValid || apodoIsAlreadyUsed || paisEmpty || mailEmpty || mailError || registredMailPending || showDiferentMail || mail_confirmEmpty || showDiferentPass || passwordEmpty || !termsAcepted && registracion){%>
				<div class="error">
		                    <div class="txtaviso">
		                    	The form is completed incorrectly. Check the highlighted fields.
		                    </div> 
		                </div>
	                <% } %>
                
                	<input type="hidden" name="registracion" value="true" />
		         <div class="form-group">
	        	<input type="text" name="firstname" id="firstname" data-invalid=" What is your name?" required placeholder="*Name" value="<%=firstname%>" <%if(errorFirstNameEmpty){%> class="mal"<%}%> />
	    		</div>
	    		<div class="anote"></div>
	    		<%if(errorFirstNameEmpty){%><div class="alertReg">Enter the name</div><%}%>
	    		<div class="form-group">
	    	       	<input type="text" name="lastname" data-invalid=" What is your last name?" required placeholder="*Last Name" value="<%=lastname%>" <%if(errorLastNameEmpty){%> class="mal" <%}%> />
	    		</div> 
	    		<div class="anote"></div>
	    		<%if(errorLastNameEmpty){%><div class="alertReg">Enter the last name</div><%}%>
			<div class="form-group">
	        	<input type="text" name="nickname" minlength="2" maxlength="20"  pattern=".{2,20}" data-invalid=" Write your user name, must be between 2 and 20 digits and contain numbers and letters." required placeholder="*user name" value="<%=nickname%>" <% if(apodoEmpty || !apodoIsValid || apodoIsAlreadyUsed ) { %> class="mal"<%}%>/>
	        	</div>        				        		
	    		<div class="anote"></div>
	    		<%if (apodoEmpty) {%><div class="alertReg">Complete the nickname.</div><%}%>
			<%if (!apodoIsValid) {%><div class="alertReg">Have entered invalid characters.</div><%}%>
			<%if (apodoIsAlreadyUsed){%><div class="alert alert-danger"><strong>×Error! </strong>The user name chosen already exists.</div><%}%>
	    		<div class="clear" style="height:55px">
		    		<cms:include page="TS_Common_Countries.jsp" />
		    	</div>
		    	<%if(paisEmpty){%><div class="alertReg">Select a country</div><%}%>
			<div class="form-group">
	        	<input type="email" name="email" id="email" placeholder="*e-mail" data-invalid=" Write your e-mail." required value="<%=email%>" <%if(mailEmpty || mailError || registredMailPending){%> class="mal"<%}%>/>
	        	</div> 
			<div class="anote"></div>
			<%if(!mailEmpty && (mailError || registredMailPending)){%><div class="alert alert-danger"> <strong>×Error! </strong> <%=errorMessage %> </div><%}%>
			<%if(mailEmpty){%><div class="alertReg"> Enter the mail <%=errorMessage %> </div><%}%>
			<%if(showDiferentMail){%><div class="alertReg">Mismatch mails </div><%}%>
			 <div class="form-group">
			<input type="email" name="email_confirm" placeholder="*Repeat your mail" data-invalid=" Repeat your e-mail." required role="confirm" data-confirm="#email" data-invalid-confirm="The email does not match " value="<%=email%>" <%if(showDiferentMail || mail_confirmEmpty){%> class="mal"<%}%>/>
			</div> 
			<div class="anote"></div>
	    		<%if(mail_confirmEmpty && !showDiferentMail){%><div class="alertReg">Repeat mail</div><%}%>
			<div class="form-group">
		        <input type="password" name="password" id="password" minlength="8"   pattern=".{8,}" data-invalid=" Write your password, must be 7 digits and contain numbers and letters." required placeholder="*password" <%if(showDiferentPass || passwordEmpty){%> class="mal" <%}%>>
		        </div>
		        <div class="anote"></div>
	    		<%if(PassError){%><div class="alertReg"> <%=errorMessage %> </div><%}%>
	    		<%if(showDiferentPass){%><div class="alertReg"> Passwords do not match </div><%}%>
		        <%if(passwordEmpty){%><div class="alertReg">Enter a password </div><%}%>
		       	<div class="form-group">    
	        	<input type="password" name="password_confirm" data-invalid=" Repeat your password." minlength="8"   pattern=".{8,}" required role="confirm" data-confirm="#password" data-invalid-confirm="The password does not match " placeholder="*Repeat your password" <%if(showDiferentPass || password_confirmEmpty){ %> class="mal"<%}%> >
	        	</div>
	        	<div class="anote"></div>
	    		<%if(password_confirmEmpty){%><div class="alertReg">Repeat your password </div><%}%>
			
        	     	<div class="checkline" style="margin-top:20px" >   
				<div class="squaredThree">
					<input type="checkbox" value="" id="termsAcepted" name="termsAcepted" <%if(!termsAcepted && registracion){%> class="mal" <%}%> />
					<label for="termsAcepted"></label>
				</div>
				<div class="txtregister" >
					<label for="termsAcepted">I agree to the Terms and Conditions teleSUR.. 
					<a id="terms" style="margin-left:7px;cursor:pointer;"> Read </a></label>
				</div> 
			        <%if(!termsAcepted && registracion){%><div class="alertReg">Accept terms and conditions</div><%}%>
			</div>
			<div class="anote"></div>
			<div class="checkline">   
				<div class="squaredThree">
					<input type="checkbox" value="yes" id="boletinteleSUR" name="boletinteleSUR"  />
					<label for="boletinteleSUR"></label>
				</div>
				<div class="txtregister">
					<label for="boletinteleSUR"> I would like bulletins teleSUR. </label>
				</div> 
			</div>
			<div class="anote"></div>
			<div class="g-recaptcha" data-sitekey="6Lc4XhETAAAAAG9nIq-sHY0DsagC8py_zNDoW4xr"></div>
			 <p class="alertReg" id="capcha"></p>
			<div class="clear"></div>
		    	<input type="submit" value="Register" id="registro">
		    	<div class="clear"></div>
		    	<div class="anote" style="margin-top:8px;">* All fields are mandatory.</div>
		    	<a href="/english/index.html" class="cancelForm">Cancel</a>
		</form>
		
		<div class="alerta" id="error"></div>
		<div class="alerta" id="exito"></div>
			
	<%
	} else {
	
            	/** suscripcion automatica a los boletines de teleSUR */ 
            	if (boletinteleSUR ) {
%>			<cms:include page="../TS_Common_Newsletter.jsp">
				<cms:param name="email"><%=email %></cms:param>
				<cms:param name="name">profile-suscripcion</cms:param>
			</cms:include>	
<% 		} 
%>		
		<div class="error conf">
		
			<div class="txtavisofondo">
				We 've sent an email. Follow the steps for joining the community teleSUR. 
			<br>
			In case you have a webmail (yahoo. hotmail, gmail) Please check your mailbox spam, it may be that our email has been marked as SPAM by mistake.</p>
			<br>
				<div class="white OKRegistracion" style="display:none;">
			        	Your newsletter subscription has been performed successfully.
			        	<br/>An email was sent to your mailbox to confirm your subscription.
			        </div> 
		        </div>
		</div>
	<% 
	}
	%>	
	</div> 
</div>  
<script src="https://www.google.com/recaptcha/api.js"></script>
<script>
$(document).ready(function () {

    $('#registration').telesurValidation({
     rule:function(){
               if(grecaptcha.getResponse() == '') {             		
			document.getElementById("capcha").innerHTML = "* You must select the captcha";
			$("#capcha").fadeIn(1000).delay(1500).fadeOut(1600);	
			if($(input).val().length < 0){
            		        $(this).parent().find('.flecha-left').remove();
	                	$(this).parent().find('.message').remove();                
	                	$(this).addClass('mas');
	                   }
                   return false;
               } else {
               	   document.getElementById("capcha").innerHTML = "";	
                   return true;
               }
           }
    });
});

</script>