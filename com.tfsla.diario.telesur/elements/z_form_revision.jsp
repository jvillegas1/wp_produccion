<%@ include file="TS_Common_Libraries.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 







<style>

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
    .image2 {
        position:relative;
        background: url('/arte/about/jobs.jpg') 50% 0 no-repeat fixed;
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
        /**position: fixed;*/
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
    .col-recap{
        margin-left: 12px;
    }
    .fileCurriculum{
        border: none !important;
        box-shadow: none !important;
    }
    .contacto{
        text-align: left;}

    .centrar
    {
        position: fixed;
        top:50%;
        left:50%;
        margin-left:-200px;
        margin-top:-150px;
        border:1px solid #808080;
        z-index: 99999;
    }
    .titfile{
    font-size: 10px;
    margin-top: -22px !important;
    margin-left: 78px !important;
    font-weight: 800;
    }
    .titpais{
    width: 98%;
    }
    

</style>


<div id="result"></div>
<div id="validform">
    <div class="wrapper">

        <div class="row clear">
            <div class="col">
                <div class="cont">
                    <div style="text-align: center;">&nbsp;</div>
                    <div style="text-align: center;"><!--<img align="middle" alt="" src="/arte/about/jobs.jpg" style="width:100%; height:auto;" />-->
                        <div class="empleo">
                            <div class="cont">
                                <h2>Trabaja con Nosotros</h2>
                            </div>
                        </div>
                        <div class="contacto">
                            <div class="cont">
                                <h4>Se parte de la señal informativa de América Latina</h4>
                                <br />
                                <div class="contacto">
                                    <div clas="col-3qua">
                                        <div class='centrar errorInfo' id="errorInf" style="display: none;"><b>Alerta!</b><span id="error"></span></div>
                                        <div class="cont">
                                            <form action="z_revision_page.jsp" method="post" id="form"> 
                                                <div class="col-mid" style="width:50%; float:left;">
                                                    <div class="cont"> 
                                                        <H5>Nombres*</H5>
                                                        <input placeholder="Escriba su Nombre..." id="nombre" name="nombre" type="text" maxlength="150"  required="true" />
                                               
                                                    </div>
                                                </div>  
                                                <div class="col-mid" style="width:50%; float:left;">
                                                    <div class="cont"> 
                                                        <H5>Apellidos*</H5>
                                                        <input placeholder="Escriba su Apellido..." id="apellido" name="apellido" type="text" maxlength="150"  required="true" />
						<div class="titpais">
                                                       
                                                   </div>
                                                    </div>
                                                </div>
                                           
                                                    
		                                        <div class="btnForm clear">	
		                                          <input type="submit" id="click" value="Enviar" class="enviar submitbutton">  &nbsp;<input type="reset" value="Cancelar" class="cancelar resetbutton">
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
        </div>
    </div>
</div>