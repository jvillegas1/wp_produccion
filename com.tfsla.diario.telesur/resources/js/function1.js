// JavaScript Document
$(window).load(function(){
  //Destacamos
  $('.destacamos, .SdHistory, .SdSpecial').flexslider({
	animation: "slide",
	animationLoop: false,
	itemWidth: 146,
	itemMargin: 4,
	pausePlay: true,
	start: function(slider){
	  $('body').removeClass('loading');
	}
  });
//Latest
  $('.lastSlide').flexslider({
    animation: "fade",
    slideshowSpeed: 7000,
       //NUEVO
        start: function(slider){
    $('#lastHead').removeClass('altmax');
    },
  
  });
  //Nota
  $('#fotos').flexslider({
	animation: "fade",
	slideshow: false, 
	animationLoop: false,
        //NUEVO
        start: function(slider){
	$('.mediaNota').removeClass('altmax');
	},	
  });
  
    //PROGRAMAS
    $('#programas').flexslider({
	animation: "fade",
	slideshow: false, 
	animationLoop: false,
        //NUEVO
        start: function(slider){
	$('#programas').removeClass('altmax');
	},	
  });
  $('#videos').flexslider({
	animation: "fade",
	slideshow: false, 
	animationLoop: false,
        //NUEVO
        start: function(slider){
	$('.mediaNota').removeClass('altmax');
	},	
  });
  //Fotos Especial Multimedia
  $('.fotoEspecial').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
  //iniciar sesion
  $('.btnLogin span').click(function(){
     $(this).parent('.btnLogin').addClass('actv');
	 $('.logIn').fadeIn('fast')
  });
  $('.logIn .closeLog').click(function(){
  	  $('.logIn').fadeOut('fast');
	  $('.btnLogin').removeClass('actv');
  });
  //Menu
  $('nav i').click(function() {
      var clas = $(this).attr('class');
	  if(clas=="actv"){
	  	$(this).removeClass('actv');
	  	$('nav ul').slideUp('fast');
	  }else{
	  	$(this).addClass('actv');
	  	$('nav ul').slideDown('fast');
	  }
  });
  //Lenguaje
  $('.btnLang').click(function() {
      var clas = $('.btnLang').attr('class');
	  if(clas=="btnLang actv"){
	  	$('.btnLang').removeClass('actv');
	  }else{
	  	$('.btnLang').addClass('actv');
	  }
  });  
  //Logueado

   $("body").on( "click", ".btnLogueado", function(){
      var clas = $('.btnLogueado').attr('class');
	  if(clas=="btnLogueado actv"){
	  	$('.btnLogueado').removeClass('actv');
	  }else{
	  	$('.btnLogueado').addClass('actv');
	  }
  });  
   $("body").on( "click", "#form-cerrar-login", function(){      
	 $("#form-login").hide();
  });    

  //Live
  $('.vivo a').click(function() {
      var clas = $('#liveBox').attr('class');
	  if(clas=="actv"){
	  	$('#liveBox').removeClass('actv');
	  	$('#liveBox').slideUp('fast');
	  }else{
	  	$('#liveBox').addClass('actv');
	  	$('#liveBox').slideDown('fast');
	  }
	  mostrar_ocultar();
  });
  
 //Boton dinamico iniciar sesion ----> se ejecuta en TS_Common_Header.jsp
$(function(){
$.get("/dynamic/baseLoginFunctions.html", function(data){
$.get("/dynamic/checkUserStatus.html", function(data){
var response = $.parseJSON(data)
//Si estoy logueado
if ( response.message == "true" ) {
$("#header").addClass("hdm-logged").removeClass("hdm-not_logged");
$("body").addClass("logged").removeClass("not-logged");
}else{
$("#header").addClass("hdm-not_logged").removeClass("hdm-logged");
$("body").addClass("not-logged").removeClass("logged");
}

$.get("/dynamic/login_user.html", function(data){
$('#header-content').html(data);
});
});
});

//Boton dinamico iniciar sesion ----> se ejecuta en TS_Common_Header.jsp
$(function(){
$.get("/dynamic/baseLoginFunctions.html", function(data){
$.get("/dynamic/checkUserStatus.html", function(data){
var response = $.parseJSON(data)
//Si estoy logueado
if ( response.message == "true" ) {
$("#header").addClass("hdm-logged").removeClass("hdm-not_logged");
$("body").addClass("logged").removeClass("not-logged");
}else{
$("#header").addClass("hdm-not_logged").removeClass("hdm-logged");
$("body").addClass("not-logged").removeClass("logged");
}


$.get("/dynamic/login_user_english.html", function(data){
$('#header-content-1').html(data);
});
});
});



//Abrir se forma asicronica el popup ----> se ejecuta en TS_Login_Header.jsp

$(function() {
	//Inicializamos el evento en el onClick del boton INGRESAR
	$("body").on("click", "#abrir-login1", function(e) {
		//Si el onClick es la primera vez que se ejecuta, hacemos un GET para cargar el formulario
		if ( $("#modal-login div").size() == 0 ) {
			$.get("/usuarios/ingresar.html", function(data){
			//Lo imprimimos dentro de la etiqueta HTML que generamos en los pasos anteriores
			$("#modal-login").html(data);
			$("#modal-login").show();
			
			});
		} else {
			//Si el onClick ya se ejecuto, no volvemos a hacer el GET para no sobrecargar la pagina de pedidos de html y solo levantamos el popUp			
			$("#modal-login").show();
			$("#form-login").show();
		}
	})
});

//Abrir se forma asicronica el popup ----> se ejecuta en TS_Login_Header.jsp - English

$(function() {
	//Inicializamos el evento en el onClick del boton INGRESAR
	$("body").on("click", "#abrir-login2", function(e) {
		//Si el onClick es la primera vez que se ejecuta, hacemos un GET para cargar el formulario
		if ( $("#modal-login div").size() == 0 ) {
			$.get("/english/users/submit.html", function(data){
			//Lo imprimimos dentro de la etiqueta HTML que generamos en los pasos anteriores
			$("#modal-login").html(data);
			$("#modal-login").show();
			
			});
		} else {
			//Si el onClick ya se ejecuto, no volvemos a hacer el GET para no sobrecargar la pagina de pedidos de html y solo levantamos el popUp			
			$("#modal-login").show();
			$("#form-login").show();
		}
	})
});

$( '#header' ).on( 'click', '#prueba', function( e ){
e.preventDefault();
$.get("/dynamic/baseLoginFunctions.html?logout", function(data){
var wt = window.top.location;
if( (wt+"").indexOf( "/usuarios/" ) != -1){
window.top.location = "/";
}else if( (wt+"").indexOf( "/staff/" ) != -1 || (wt+"").indexOf( "/u/" ) != -1 ){
location.reload(true);
}else{
$( "#header" ).removeClass( "hdm-logged" ).addClass( "hdm-not_logged" );
$( "body" ).removeClass("logged").addClass("not-logged");

$.get("/dynamic/login_user.html", function(data){
$('#header-content').html(data);
});

}
});
});



/*
  var showSignal = false;
  function mostrar_ocultar() {
	  // cambia de true a false o de false a true
	  showSignal = !showSignal; 
	
	  if (showSignal){
	    document.getElementById("cajaPlayerUltra").style.display="block";
	    document.getElementById("cajaPlayerUltra").innerHTML='<iframe mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="http://mblive.telesur.ultrabase.net" align="middle" frameborder="0" height="534" width="100%"></iframe>';
	  }
	  else {
	    document.getElementById("cajaPlayerUltra").style.display="none";
	    document.getElementById("cajaPlayerUltra").innerHTML=" ";
	  }
  }*/
  
  
  //Suscribite
  $('.btnBoletin').click(function() {
      var clas = $('#suscrip').attr('class'); 
	  if(clas=="actv"){
	  	$('#suscrip').removeClass('actv');
	  	$('#suscrip').slideUp('fast');
	  }else{
	  	$('#suscrip').addClass('actv');
	  	$('#suscrip').slideDown('fast');
	  }
	  $('#suscrip .closeLog').click(function() {
	  	$('#suscrip').removeClass('actv');
	  	$('#suscrip').slideUp('fast');        
      });
  });
  //Sticky  
  if(!movil){
		$(window).scroll(function() { 
		var y = $(document).scrollTop();
		
		if(y >= 200){ 
			$('header').addClass('sticky');
			$('body').addClass('mrg');
			$('header .sectionName').addClass('remove');
		 }else{
			$('header').removeAttr('class');
			$('body').removeAttr('class');
			$('header .sectionName').removeClass('remove');
		 }
		});	  
  }
  
	////VerMas
	var article = $('#contArt article').length;
	if (!movil) {
		 for(var i = article; i > (article - 7); i--){
	  $('#contArt article:eq('+i+')').addClass('oculto')
  	}
	}
	else {
		for(var i = article; i > (article - 16); i--){
	  $('#contArt article:eq('+i+')').addClass('oculto')
  	}
	}
	$('.btnVermas').click(function() {
  	$('article.oculto').fadeIn('fast');
  });
	
	//scrollTop
	$('.subirBtn').click(function(){
		 $('body, html').animate({scrollTop: '0px'}, 1000);
	});
});

	
	//scrollTop Especial Videos
	$('.iraVideos').click(function(){
		 $('html, body').animate({scrollTop: $("#espVideos").offset().top-130}, 2000);
	});
	
	//scrollTop Especial Fotos
	$('.iraFotos').click(function(){
		 $('html, body').animate({scrollTop: $("#espFotos").offset().top-130}, 2000);
	});
	
	//scrollTop Especial Adjuntos
	$('.iraAdjuntos').click(function(){
		 $('html, body').animate({scrollTop: $("#espAdjuntos").offset().top-130}, 2000);
	});
	//scrollTop Especial Relacionadas
	$('.iraRelacionada').click(function(){
		 $('html, body').animate({scrollTop: $("#espRelacionada").offset().top-130}, 2000);
	});