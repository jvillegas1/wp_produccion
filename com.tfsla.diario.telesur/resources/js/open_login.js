function openPopUpProviderWithRedirect(provider, associate, redirectUrl, publicationId, publicationUrl)
{
	var winOpenId = window.open('/usuarios/login_openauthorization_process.html?P=' + provider + '&A=' + associate + '&RU=' + redirectUrl + '&PID='+ publicationId + '&PN=' + publicationUrl, 'mywindow', 'height=500,width=500,status=no,toolbar=no');

	switch(provider)
	{
		case "google":
			winOpenId.resizeTo(860,480);
			break;
		case "facebook":
			winOpenId.resizeTo(600,400);
			break;
		case "linkedin":
			winOpenId.resizeTo(600,400);
			break;				
		case "twitter":
			winOpenId.resizeTo(950,550);
			break;
		case "yahoo":
			winOpenId.resizeTo(860,480);
			break;														
	}
	
	winOpenId.focus();	
}
function openPopUpProvider(provider, associate, publicationId, publicationUrl)
{
	var winOpenId = window.open('/usuarios/login_openauthorization_process.html?P=' + provider + '&A=' + associate + '&PID='+ publicationId + '&PN=' + publicationUrl, 'mywindow', 'height=500,width=500,status=no,toolbar=no');

	switch(provider)
	{
		case "google":
			winOpenId.resizeTo(860,480);
			break;
		case "facebook":
			winOpenId.resizeTo(600,400);
			break;
		case "linkedin":
			winOpenId.resizeTo(600,400);
			break;				
		case "twitter":
			winOpenId.resizeTo(950,550);
			break;
		case "yahoo":
			winOpenId.resizeTo(860,480);
			break;														
	}
	
	winOpenId.focus();
}
			
function onPopupClosed(url, param, providerName, publicationId , publicationUrl)
{
        if ( publicationId == "8" ) { 
		switch(url){
			case "INDEX":
				$('body').trigger('login.social');
				break;
			case "REGISTRACION_MENU":
				window.top.location = '/usuarios/confirmar.html';
				break;
			case "PERFIL_EDITAR":
				window.top.location = '/usuarios/editar_perfil.html?ASC=' + providerName;
				break;			
			case "ERROR":
				window.top.location = '/error.html';
				break;
			case "ERROR_BUSINESS":
				window.top.location = '/usuarios/login_nativo.html?E=' + escape(param);
				break;
			case "INGRESAR_EMAIL":
				window.top.location = '/usuarios/solicitaremail.html';
				break;		
		}
	} else {
		switch(url){
			case "INDEX":
				window.top.location = '/index.html';
				break;
			case "REGISTRACION_MENU":
				window.top.location = '/english/users/confirm.html';
				break;
			case "PERFIL_EDITAR":
				window.top.location = '/english/users/profile_edit.html?ASC=' + providerName;
				break;			
			case "ERROR":
				window.top.location = '/error.html';
				break;
			case "ERROR_BUSINESS":
				window.top.location = '/english/users/login_native.html?E=' + escape(param);
				break;
			case "INGRESAR_EMAIL":
				window.top.location = '/english/users/requestemail.html';
				break;		
		}
	}
}

function disassociateProvider(providerName,publicationId){
	 if ( publicationId == "8" ) {
	 	window.top.location = '/usuarios/desasociarcuenta.html?P=' + providerName;
	 } else { 
	 	window.top.location = '/english/users/disassociate_account.html?P=' + providerName;
	 }
}


$( document ).ready(function() {
$( 'body' ).on( 'login.social', function( data ){
var wt = window.top.location;
//Si estamos sobre las url /usuarios/ o /u/ o /staff/ y permitimos loguear al usuario. Es importante destacar que en estos casos es necesario hacer un refresh.
if( (wt+"").indexOf( "/usuarios/" ) != -1 || (wt+"").indexOf( "/staff/" ) != -1 || (wt+"").indexOf( "/u/" ) != -1 ){
var currentTime = new Date(); var param = currentTime.getFullYear()+currentTime.getMonth()+currentTime.getDate()+currentTime.getTime();
location.reload(true);
window.location.href = window.location.href+"?cache="+param;
}else{
$.get("/dynamic/login_user.html", function(data){
$('#header-content').html(data);
});
$("body").addClass("logged").removeClass("not-logged");
}
});
});