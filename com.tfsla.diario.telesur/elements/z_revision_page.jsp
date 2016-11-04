<%@ include file="TS_Common_Libraries.jsp" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 
<%@ page import="org.apache.commons.io.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="javax.activation.DataHandler" %>
<%@ page import="javax.activation.FileDataSource" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeBodyPart" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.MimeMultipart" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Properties" %>
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
    String nombre = (request.getParameter("nombre") != null) ? request.getParameter("nombre") : "";
    String apellido = (request.getParameter("apellido") != null) ? request.getParameter("apellido") : "";
    String profesion = (request.getParameter("profesion") != null) ? request.getParameter("profesion") : "";
   // String curriculum = request.getParameter("curriculum");
    String pais = (request.getParameter("pais") != null) ? request.getParameter("pais") : "";
    String mensaje = (request.getParameter("mensaje") != null) ? request.getParameter("mensaje") : "";
    String ubicacionArchivo = "/storage/_static_rankings/empleos/";
    String path = "";
    String gRecaptchaResponse = (request.getParameter("g-recaptcha-response") != null) ? request.getParameter("g-recaptcha-response") : "";
    String ErrMensage = "";
    boolean error = false;
    boolean validForm = true;

 //   DiskFileItemFactory factory = new DiskFileItemFactory();
 //   factory.setSizeThreshold(1024);
 //   factory.setRepository(new File(ubicacionArchivo));

 //   ServletFileUpload upload = new ServletFileUpload(factory);

    //objeto del paquete correo
    SendEmailWithAttachment correoEnvio = new SendEmailWithAttachment();

    //array list
    ArrayList<String> fieldsName = new ArrayList<String>();
    //array list del file
    ArrayList<String> fieldsAttachment = new ArrayList<String>();

    try {
        List<FileItem> partes = upload.parseRequest(request);

        for (FileItem item : partes) {
            if (item.isFormField()) {
                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                fieldsName.add(fieldValue);

              
            } else {
                File file = new File(ubicacionArchivo, item.getName());
                // Process form file field (input type="file").
                String fieldName = item.getFieldName();
                String fileName = FilenameUtils.getName(item.getName());
                InputStream fileContent = item.getInputStream();
                fieldsAttachment.add(fileName);
                File uploadedFile = new File(ubicacionArchivo + "/" + fileName);
                path = uploadedFile.getAbsolutePath();
              
                item.write(uploadedFile);

            }

        }

        //get de elementos del formulario
        nombre = fieldsName.get(0);
        profesion = fieldsName.get(1);
        apellido = fieldsName.get(2);
        pais = fieldsName.get(3);
        gRecaptchaResponse = fieldsName.get(4);
        mensaje = fieldsName.get(6);
        curriculum = fieldsAttachment.get(0);

        if (nombre.equals("") || profesion.equals("") || apellido.equals("") || pais.equals("") || gRecaptchaResponse.equals("") || mensaje.equals("")) {
            error = true;
        } else {
            //out.println("enviado con exito");
            //set de fields
            correoEnvio.setNombre(nombre);
            correoEnvio.setApellido(apellido);
            correoEnvio.setProfesion(profesion);
            correoEnvio.setCurriculum(curriculum);
            correoEnvio.setProfesion(profesion);
            correoEnvio.setMensaje(mensaje);
            correoEnvio.setAttachmentName(path);
            correoEnvio.setPais(pais);

            boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
            if (gRecaptchaResponse.equals("")) {
                ErrMensage = "* Debe completar el campo Captcha";
            }

            correoEnvio.sendEmail();    
        }


    } catch (FileUploadException ex) {
        out.write("Error al subir archivo " + ex.getMessage());
    }
%>
<%!
    public static class VerifyRecaptcha {

        public static final String url = "https://www.google.com/recaptcha/api/siteverify";
        public static final String secret = "6Lc4XhETAAAAAKVglxI9PNgG1Hjs_oNRztJngutP";
        private final static String USER_AGENT = "Mozilla/5.0";

        public static boolean verify(String gRecaptchaResponse) throws IOException {
            if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
                return false;
            }

            try {
                URL obj = new URL(url);
                HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

                // agregar encabezado de solicitud
                con.setRequestMethod("POST");
                con.setRequestProperty("User-Agent", USER_AGENT);
                con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

                String postParams = "secret=" + secret + "&response="
                        + gRecaptchaResponse;

                // Enviar solicitud posterior
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

            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    public class SendEmailWithAttachment {

        private String nombre;
        private String apellido;
        private String profesion;
        private String curriculum;
        private String pais;
        private String mensaje;
      //  private String attachmentName;

      //  public String getAttachmentName() {
      //      return attachmentName;
      //  }

      //  public void setAttachmentName(String path) {
    //        this.attachmentName = path;
    //    }

        public String getNombre() {
            return nombre;
        }

        public void setNombre(String nombre) {
            this.nombre = nombre;
        }

        public String getApellido() {
            return apellido;
        }

        public void setApellido(String apellido) {
            this.apellido = apellido;
        }

        public String getProfesion() {
            return profesion;
        }

        public void setProfesion(String profesion) {
            this.profesion = profesion;
        }

        public String getCurriculum() {
            return curriculum;
        }

    //   public void setCurriculum(String curriculum) {
    //        this.curriculum = curriculum;
    //    }

        public String getPais() {
            return pais;
        }

        public void setPais(String pais) {
            this.pais = pais;
        }

        public String getMensaje() {
            return mensaje;
        }

        public void setMensaje(String mensaje) {
            this.mensaje = mensaje;
        }


        public void sendEmail() {
            //
            // Defino la information que va en el correo.

            String to = "ysanchez@telesurtv.net";
            String from = "contactenos@telesurtv.net";
            final String username = "webtelesurt@telesurtv.net";
            final String password = "/W3b-Tele$ur..";
            String result;
            String correo = "ysrr27@hotmail.com";       

            String host = "correo.telesurtv.net";
            String subject = "Contacto desde Empleos teleSUR";
            String html = "<html><head></head><mailbody>Ha sido enviado el siguiente curriculum desde la página de empleados teleSUR. <br/> Nombre : " + nombre + "<br/> Apellido: " + apellido + "<br/> Profesion: " + profesion + "<br/> Pais: " + pais + "<br/> Curriculum: " + curriculum + "<br/> Mensaje: " + mensaje + "</mailbody></html>";
            String bodyText = html;

           
            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.starttls.enable", "true");
            Session session = Session.getDefaultInstance(props);

            try {
                InternetAddress fromAddress = new InternetAddress(from);
                InternetAddress toAddress = new InternetAddress(to);

                //
                // Creo el mensaje del correo.
                //
                MimeMessage message = new MimeMessage(session);
                message.setFrom(fromAddress);
                message.setRecipient(Message.RecipientType.TO, toAddress);
                message.setSubject(subject);
                message.setSentDate(new Date());

                //
                // Ajuste el texto del mensaje de correo electrónico.
                //
                MimeBodyPart messagePart = new MimeBodyPart();
                messagePart.setContent(bodyText, "text/html");

                //
                // Establezca el archivo adjunto de correo electrónico
                //
                FileDataSource fileDataSource = new FileDataSource(attachmentName);

                MimeBodyPart attachmentPart = new MimeBodyPart();
                attachmentPart.setDataHandler(new DataHandler(fileDataSource));
                attachmentPart.setFileName(fileDataSource.getName());

                // 
                //Crear multiparte E-Mail.
                //
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messagePart);
                multipart.addBodyPart(attachmentPart);

                message.setContent(multipart);

                //
                // Envía el mensaje. No se olvide de establecer el nombre de usuario y contraseña para autenticarse en el              
                // servidor de correo.
                //
                Transport.send(message);
            } catch (MessagingException e) {
                e.printStackTrace();

                System.out.println(e);
            }
        }
    }
%>

<c:set var="validFormMessage" scope="page" value="<%=validForm%>" />
<c:set var="errorMessage" scope="page" value="<%=error%>" />

<div class="contacto">
    <div class="centrar errorInfo" id="errorInf" style="display: none;"><b>Alerta!</b><span id="error"></span></div>
    <c:if test="${errorMessage}">
        <div class="cont"> 
            <div class="error">
                <div class="txtaviso">
                    El formulario ha sido completado incorrectamente. Verifique los campos resaltados.
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
                    Pronto nuestro equipo establecerá contacto con usted. Gracias por escribirnos.
                    </br>
                    <input type="button" class="btn-1 btn-1c btnVolver" value="Volver" onclick="window.location = '/pages/empleos.html';"/>
                </div>
            </div>
        </div>
    </c:if>
</div>