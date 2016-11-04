<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
<%@ include file="TS_Common_Libraries.jsp" %>

<%
    org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);

    String nombre = (request.getParameter("nombre") != null) ? request.getParameter("nombre") : "";
    String correo = (request.getParameter("correo") != null) ? request.getParameter("correo") : "";
    String pais = (request.getParameter("pais") != null) ? request.getParameter("pais") : "";
    String mensaje = (request.getParameter("mensaje") != null) ? request.getParameter("mensaje") : "";
    String testing = (request.getParameter("testing") != null) ? request.getParameter("testing") : "";
    String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
%>

<script type="text/javascript">
    $(document).ready(function () {
      
        //validador
        jQuery.fn.reset = function () {
            $(this).each(function () {
                this.reset();
            });
        }
        //fin enviar
        
       
        
        var valid = document.referrer;
        $('input[name="testing"]').val(valid);
        //fin validador
        
        
        $("#click").click(function () {
            var correoContacto = $('#correoContacto').val();
            var nombre = $('#nombre').val();
            var correo = $('#correo').val();
            var mensaje = $('#mensajeContacto').val();
            

            if (nombre == "") {
                $("#nombre").focus();
                $("#error").empty();
                $("#error").append(" You must place your name");
                $("#errorInf").fadeIn(300).delay(1500).fadeOut(1600);
                return false;
            }
            else {
                if (correo == "") {
                    $("#correo").focus();
                    $("#error").empty();
                    $("#errorInf").fadeIn(300).delay(1500).fadeOut(1600);
                    $("#error").append(" You must place your Mail");
                    return false;
                }
                else {
                    if (mensaje == "") {
                        $("#mensajeContacto").focus();
                        $("#error").empty();
                        $("#errorInf").fadeIn(300).delay(1500).fadeOut(1600);
                        $("#error").append(" You must place a Message");
                        return false;
                    }
                    else {
                        if (correoContacto != "") {
                            return false;
                        } else {
                            var url = "/system/modules/com.tfsla.diario.telesur.en/elements/TS_Contact_Page.jsp"; // El script a dónde se realizará la petición.
                            $.ajax({
                                type: "POST",
                                url: url,
                                data: $("#form").serialize(), // Adjuntar los campos del formulario enviado.
                                success: function (data){
                                    $("#result").html(data);
                                    $("#form").reset();
                                  //  $("#validform").hide();
                                        
                                    
                                }
                            });
                            return false;
                        }
                    }
                }
            }
        });

    });
</script>

<style>
 .centrar
	{position: fixed;
	top:50%;
	left:50%;
	margin-left:-200px;
	margin-top:-150px;
	border:1px solid #808080;
        z-index: 99999;
	}
.errorInfo{
	color: #b94a48;
	background-color: #f2dede;
	border-color: #ebccd1;
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;}

.btnVolver{border: none;
	font-family: inherit !important;
	font-size: inherit !important;
	color: inherit !important;
	background: none !important;
	cursor: pointer !important;
	padding: 10px 0px 30px 0px !important;
	display: inline-block !important;
	text-transform: uppercase !important;
	letter-spacing: 1px !important;
	font-weight: 700 !important;
	outline: none !important;
	position: relative !important;
	-webkit-transition: all 0.3s !important;
	-moz-transition: all 0.3s !important;
	transition: all 0.3s !important;
	width:20%!important;
	float:right !important;}
	
.btnVolver:after{
content: '';
	position: absolute !important;
	z-index: -1 !important;
	-webkit-transition: all 0.3s !important;
	-moz-transition: all 0.3s !important;
	transition: all 0.3s !important;
}

.btn-1 {
	border: 3px solid #fff !important;
	color: #fff !important;
}
    
/* Button 1c */

.btn-1c:after {
	width: 0% !important;
	height: 100% !important;
	top: 0 !important;
	left: 0 !important;
	background: #fff !important;
}

.btn-1c:hover,
.btn-1c:active {
	color: #0e83cd !important;
}

.btn-1c:hover:after,
.btn-1c:active:after {
	width: 100% !important;
}    
    
    body {
        margin:0;
        padding:0;
        border:0;
    }
    .image1 {
        position:relative;
        background: url('/arte/about/imgcontacto.jpg') 50% 0 no-repeat fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        min-height: 520px;
        -webkit-box-shadow: inset 0 0 292px rgba(0, 0, 0, 1);
        box-shadow: inset 0 0 292px rgba(0, 0, 0, 1);	
    }
    .notrela{
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 8px;
        margin-right: 8px;
        border-bottom: 1px solid #e3e3e3;
        padding: 10px 0;
        color: red;
    }

    .content {
        width: 100%;
        max-width: 966px;
        margin: 0 auto;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        position: relative;
        background: #FFF;
        z-index:2;
    }

    .titContact{	
        font-size: 55px;
        text-align:center;
        margin: 0 auto;
     /**   width: 100%; */
        position: absolute;
    /**    top: 85%;  */
        opacity:0.8;
        font-weight: bold;
        margin-bottom: 20px;
        padding: 10px 0;
        border-bottom: 0px !important;
        color: white;
        text-shadow: 1px 1px 2px black, 0 0 25px rgb(18, 9, 4), 0 0 5px #bf0606;
    }

    .correoContacto{
        display: none !important;
    }
    .env{
	margin-top: 13px !important;
	height: 31px !important;
    }

</style>

 
<div id="result"></div>
<div id="validform">
<div class="col-qua">
    <div class="cont">
        <h4>ADDRESS</h4>

        <p>Calle Vargas con Calle Santa Clara, Edificio TeleSUR.<br>
            Urbanización Boleíta Norte.<br>
            Caracas - Venezuela</p>

        <h4>Contact</h4>
        <p>Helga Malave hmalave@telesurtv.net</p>

        <p>(58) (212) 600.02.02</p>
    </div>
</div>
<div class="col-3qua">
    <div class="cont">
        <h2 style="margin-left:10px">Contact us online </h2>
<div class='centrar errorInfo' id="errorInf" style="display: none;"><b>Alerta!</b><span id="error"></span></div>
        <form id="form" method="post" action="/pages/contacto.html#coment">
            <div class="col-mid">
                <input type="hidden" name="testing" value="" id="x" />


                <div class="cont">
                    <h5>Name</h5>
                    <input placeholder="Escriba su nombre..." id="nombre" name="nombre" type="text" maxlength="150"  required="true" />
                </div>
            </div>

            <div class="col-mid">
                <h5>Email</h5>
                <input type="email" placeholder="Escriba su correo..." id="correo" name="correo" maxlength="150" required="true" />
            </div>
            <div class="col-mid">
                <div class="cont"> 
                    <h5>Country</h5>
                    <cms:include page="TS_Contacto_Countries.jsp" />
                </div>
            </div>
            <div class="col-mid" id="rest">
                <div class="g-recaptcha" data-sitekey="6Lc4XhETAAAAAG9nIq-sHY0DsagC8py_zNDoW4xr"></div>
                <input placeholder="Escriba su nombre..." class="correoContacto"id="correoContacto" name="asunto" type="text" maxlength="150" />
            </div>
            <div class="col-mquea">

                <h5>Message</h5>
                <textarea name="mensaje" maxlength="250" id="mensajeContacto" required="true"></textarea>
            </div>

            <input type="hidden" name="send" value="0" />
            <div class="btnForm clear">
                <input class="enviar env" type="submit" value="Send" id="click"><a class="cancelar" href="#">Cancelar</a>
            </div>
        </form>
    </div>
</div>
</div>

</div>
</div>
</div>
</div>
</div>	
<script src="https://www.google.com/recaptcha/api.js"></script>