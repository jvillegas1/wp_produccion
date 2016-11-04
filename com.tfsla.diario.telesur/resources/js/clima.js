//"http://devcms.telesurtv.net/system/modules/com.tfsla.diario.telesur/resources/js/jsonClima/"+tag+".json"

$(function () {
  
// INICIO - imprimirClima
var imprimirClima = function (tag) {
	$.getJSON('http://www.telesurtv.net/_static_rankings/jsonClima/' + tag, function(ciudad) {
		gestionCiudad(ciudad);
		gestionCondicionTiempo(ciudad.Tiempo);
		traduce();
		triggerIcon();
	});
};

// INICIO - gestionCiudad
function gestionCiudad (ciudad) 
{
	$('#Tiempo').val(ciudad.Tiempo);
	$('#TiempoE').val(ciudad.Tiempo);
	$('#TiempoE').html('' + ciudad.Tiempo + '');
	$("#amanecer").html('' + ciudad.Amanecer + '');
	$("#ciudad").html('' + ciudad.Ciudad + ',' +'');
	$("#visibilidad").html('' + ciudad.Visibilidad+ '');
	$("#pais").html('' + ciudad.Pais+ '');
	$("#previsiones").html('' + ciudad.Previsiones+ '');
	$("#pronostico").html('' + ciudad.pronostico+ '');
	$("#humedad").html('' + ciudad.Humedad+ '');
	$("#ultimaActualizacion").html('' + ciudad.UltimaActualizacion+ '');
	$("#atardecer").html('' + ciudad.Atardecer+ '');
	$("#presion").html('' + ciudad.Presion+ '');
	$("#velocidad").html('' + ciudad.Velocidad+ '');
	$("#temperatura").html('' + ciudad.Temperatura+ '°C' +'');
	$("#text1").html('' + ciudad.text+ '');
	$("#text1").html('' + ciudad.day+ '');

	//Inicio de function(posicion, pronostico)
	var texto = "";
	$.each(ciudad.Pronostico, function(posicion, Pronostico){
		texto += "<div class='day'>";
		texto += "<div class='dat'>";
		texto += "<h3>" + Pronostico.day + "</h3>";
		texto += "<span> <strong> Máx:"+ Pronostico.high + '°C' +"</strong> </span>";
		texto += "<span> <strong> Min:"+ Pronostico.low + '°C' +"</strong> </span>";
		texto += "</div>";
		texto += "<div class='tiempoClima' data-tiempo='"+ Pronostico.text +"'></div>";
		texto += "<div class='dias' data-dias='"+ Pronostico.day +"'></div>";
		texto += "</div>";
	});
	$(".semana").html(texto);
	// Fin de function(posicion, pronostico)
};

  // INICIO - gestionCondicionTiempo
function gestionCondicionTiempo (condicion) 
{
	switch (condicion){
		case "Partly Cloudy":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche polvo tormenta tornado ventoso ventosonoche").addClass("parcialnublado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("ParcialNublado");
		replace = condicion.replace(/Partly Cloudy/gi, "<strong>Parcialmente Nublado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Tropical Storm":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tornado ventoso ventosonoche").addClass("tormenta");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Tormenta");
		replace = condicion.replace(/Tropical Storm/gi, "<strong>Tormenta Tropical</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Hurricane":
		$('#clima').removeClass("helada despejado soleado llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("huracan");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Huracan");
		replace = condicion.replace(/Hurricane/gi, "<strong>Huracán</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Severe Thunderstorms":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tornado ventoso ventosonoche").addClass("tormenta");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Tormenta");
		replace = condicion.replace(/Severe Thunderstorms/gi, "<strong>Tormentas Eléctricas Severas</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Thunderstorms":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tornado ventoso ventosonoche").addClass("tormenta");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Tormenta");
		replace = condicion.replace(/Thunderstorms/gi, "<strong>Tormentas Eléctricas</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Mixed Rain And Snow":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Mixed Rain And Snow/gi, "<strong>Lluvia y Nieve Mixta</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Mixed Rain And Sleet":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Mixed Rain And Sleet/gi, "<strong>Lluvia y Nieve Mixta</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Freezing Drizzle":
		$('#clima').removeClass("helada despejado soleado huracan lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("llovizna");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Llovizna");
		replace = condicion.replace(/Freezing Drizzle/gi, "<strong>Llovizna Helada</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Drizzle":
		$('#clima').removeClass("helada despejado soleado huracan lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("llovizna");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Llovizna");
		replace = condicion.replace(/Drizzle/gi, "<strong>Llovizna</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Freezing Rain":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/Freezing Rain/gi, "<strong>Lluvia Helada</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Showers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/Showers/gi, "<strong>Chaparrones</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Snow Flurries":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Snow Flurries/gi, "<strong>Copos de Nieve</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Light Snow Showers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Light Snow Showers/gi, "<strong>Nieve ligera</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Blowing Snow":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Blowing Snow/gi, "<strong>Vientos de Nieve</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Snow":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Snow/gi, "<strong>Nieve</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Hail":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("helada");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Helada");
		replace = condicion.replace(/Hail/gi, "<strong>Granizo</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Sleet":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Sleet/gi, "<strong>Agua y Nieve</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Dust":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("polvo");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Polvo");
		replace = condicion.replace(/Dust/gi, "<strong>Polvo</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Foggy":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("polvo");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Polvo");
		replace = condicion.replace(/Foggy/gi, "<strong>Brumoso</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Haze":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("");
		replace = condicion.replace(/Haze/gi, "<strong></strong>");
		$('#TiempoE').html(replace);
		break;
		case "Smoky":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("");
		replace = condicion.replace(/Smoky/gi, "<strong>Ahumado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Blustery":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("");
		replace = condicion.replace(/Blustery/gi, "<strong>Borrascoso</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Windy":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("ventoso");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Ventoso");
		replace = condicion.replace(/Windy/gi, "<strong>Ventoso</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Cold":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("helada");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Helada");
		replace = condicion.replace(/Cold/gi, "<strong>Frio</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Cloudy":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nublado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nublado");
		replace = condicion.replace(/Cloudy/gi, "<strong>Nublado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Mostly Cloudy (Night)":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("parcialmentenubladonoche");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nubladonoche");
		replace = condicion.replace(/Mostly Cloudy (Night)/gi, "<strong>Parcialmente Nublado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Mostly Cloudy":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("parcialnublado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("ParcialNublado");
		replace = condicion.replace(/Mostly Cloudy/gi, "<strong>Parcialmente Nublado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Partly Cloudy (Night)":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("parcialmentenubladonoche");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nubladonoche");
		replace = condicion.replace(/Partly Cloudy (Night)/gi, "<strong>Parcialmente Nublado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Clear (Night)":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nocheclara");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Luna");
		replace = condicion.replace(/Clear (Night)/gi, "<strong>Noche Clara</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Sunny":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("soleado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Soleado");
		replace = condicion.replace(/Sunny/gi, "<strong>Soleado</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Fair (Night)":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nocheclara");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Luna");
		replace = condicion.replace(/Fair (Night)/gi, "<strong>Noche Clara</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Fair":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("despejado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Soleado");
		replace = condicion.replace(/Fair/gi, "<strong>Claro</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Mixed Rain And Hail":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("helada");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Helada");
		replace = condicion.replace(/Mixed Rain And Hail/gi, "<strong>Lluvia y Granizo</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Hot":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("soleado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Soleado");
		replace = condicion.replace(/Hot/gi, "<strong>Caliente</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Isolated Thunderstorms":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("tormenta");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Tormenta");
		replace = condicion.replace(/Isolated Thunderstorms/gi, "<strong>Tormentas Aisladas</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Scattered Thunderstorms":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/Scattered Thunderstorms/gi, "<strong>Tormentas Eléctricas Dispersas</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Scattered Showers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/Scattered Showers/gi, "<strong>Chubascos Dispersos</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Heavy Snow":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Heavy Snow/gi, "<strong>Fuertes Nevadas</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Scattered Snow Showers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Scattered Snow Showers/gi, "<strong>Nieve Dispersa</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Thundershowers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("tormenta");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Tormenta");
		replace = condicion.replace(/Thundershowers/gi, "<strong>Tormentas</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Snow Showers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("nieve");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Nieve");
		replace = condicion.replace(/Snow Showers/gi, "<strong>Duchas de Nieve</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Isolated Thundershowers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/Isolated Thundershowers/gi, "<strong>Chaparrones Aislados</strong>");
		$('#TiempoE').html(replace);
		break;
		case "PM Thunderstorms":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/PM Thunderstorms/gi, "<strong>Chaparrones</strong>");
		$('#TiempoE').html(replace);
		break;
		case "PM Showers":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("lluvia");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Lluvia");
		replace = condicion.replace(/PM Thunderstorms/gi, "<strong>Chaparrones</strong>");
		$('#TiempoE').html(replace);
		break;
		case "Mostly Sunny":
		$('#clima').removeClass("helada despejado soleado huracan llovizna lluvia lluvianoche nieve nocheclara nublado nubladonoche parcialmentenubladonoche parcialnublado polvo tormenta tornado ventoso ventosonoche").addClass("soleado");
		$('#imagen').removeClass("Helada Soleado Huracan Llovizna Lluvia Luna Lluvianoche Nieve Nublado Nubladonoche ParcialNublado Sindatos Polvo Tormenta Tornado Ventoso Ventosonoche").addClass("Soleado");
		replace = condicion.replace(/PM Thunderstorms/gi, "<strong>Chaparrones</strong>");
		$('#TiempoE').html(replace);
		break;
	}
};

  // INICIO - traduce
function traduce()
{
	$(".dat h3").text(function(index, text) {
	  return text.replace(/Sun/g, "Domingo");
	});
	$(".dat h3").text(function(index, text) {
	  return text.replace(/Mon/g, "Lunes");
	});
	$(".dat h3").text(function(index, text) {
	  return text.replace(/Tue/g, "Martes");
	});
	$(".dat h3").text(function(index, text) {
	  return text.replace(/Wed/g, "Miercoles");
	});
	$(".dat h3").text(function(index, text) {
	  return text.replace(/Thu/g, "Jueves");
	});
	$(".dat h3").text(function(index, text) {
	  return text.replace(/Fri/g, "Viernes");
	});
	$(".dat h3").text(function(index, text) {   
	  return text.replace(/Sat/g, "Sabado");
	});
};

// INICIO - triggerIcon
function triggerIcon() 
{
	$(".tiempoClima").each(function() { //Inicio del each
	  var $this = $(this);
	  var Pronostico = $this.data('tiempo');
		if (Pronostico == 'Tornado') {
			  $this.addClass('Tornado75');
			  };
		if (Pronostico == 'Tropical Storm') {
			  $this.addClass('Tornado75');
			  };
		if (Pronostico == 'Hurricane') {
			  $this.addClass('Huracan75');
			  };
		if (Pronostico == 'Severe Thunderstorms') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'Thunderstorms') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'Mixed Rain And Snow') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Mixed Rain And Sleet') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Freezing Drizzle') {
			  $this.addClass('Llovizna75');
			  };
		if (Pronostico == 'Drizzle') {
			  $this.addClass('Llovizna75');
			  };
		if (Pronostico == 'Freezing Rain') {
			  $this.addClass('Lluvia75');
			  };
		if (Pronostico == 'Showers') {
			  $this.addClass('Lluvia75');
			  };
		if (Pronostico == 'Snow Flurries') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Light Snow Showers') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Blowing Snow') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Snow') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Hail') {
			  $this.addClass('Helada75');
			  };
		if (Pronostico == 'Sleet') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Dust') {
			  $this.addClass('Polvo75');
			  };
		if (Pronostico == 'Foggy') {
			  $this.addClass('');
			  };
		if (Pronostico == 'Haze') {
			  $this.addClass('');
			  };
		if (Pronostico == 'Smoky') {
			  $this.addClass('');
			  };
		if (Pronostico == 'Blustery') {
			  $this.addClass('');
			  };
		if (Pronostico == 'Windy') {
			  $this.addClass('Ventoso75');
			  };
		if (Pronostico == 'Cold') {
			  $this.addClass('Helada75');
			  };
		if (Pronostico == 'Cloudy') {
			  $this.addClass('Nublado75');
			  };
		if (Pronostico == 'Mostly Cloudy (Night)') {
			  $this.addClass('Nubladonoche75');
			  };
		if (Pronostico == 'Mostly Cloudy') {
			  $this.addClass('ParcialNublado75');
			  };
		if (Pronostico == 'Partly Cloudy (Night)') {
			  $this.addClass('Nubladonoche75');
			  };
		if (Pronostico == 'Partly Cloudy') {
			  $this.addClass('ParcialNublado75');
			  };
		if (Pronostico == 'Clear (Night)') {
			  $this.addClass('Luna75');
			  };
		if (Pronostico == 'Sunny') {
			  $this.addClass('Soleado75');
			  };
		if (Pronostico == 'Fair (Night)') {
			  $this.addClass('Luna75');
			  };
		if (Pronostico == 'Fair') {
			  $this.addClass('Soleado75');
			  };
		if (Pronostico == 'Mixed Rain And Hail') {
			  $this.addClass('Helada75');
			  };
		if (Pronostico == 'Hot') {
			  $this.addClass('Soleado75');
			  };
		if (Pronostico == 'Isolated Thunderstorms') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'Scattered Thunderstorms') {
			  $this.addClass('Lluvia75');
			  };
		if (Pronostico == 'Scattered Showers') {
			  $this.addClass('Lluvia75');
			  };
		if (Pronostico == 'Heavy Snow') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Scattered Snow Showers') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Thundershowers') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'Snow Showers') {
			  $this.addClass('Nieve75');
			  };
		if (Pronostico == 'Isolated Thundershowers') {
			  $this.addClass('Lluvia75');
			  };
		if (Pronostico == 'Thundershowers') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'Thundershowers') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'PM Thunderstorms') {
			  $this.addClass('Tormenta75');
			  };
		if (Pronostico == 'PM Showers') {
			  $this.addClass('Lluvia75');
			  };
		if (Pronostico == 'Mostly Sunny') {
			 $this.addClass('Soleado75');
			 };
	});//Fin del each
};

imprimirClima('Caracas.json');

$("#buscar").on('click', function(event){
	var ciudadSeleccionada = $("#localidad").val();
	var archivoCiudadSelec = $("#archivojson").val();
	//console.log(ciudadSeleccionada);
	imprimirClima(archivoCiudadSelec);
});

});



