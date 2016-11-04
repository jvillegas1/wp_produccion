
var geturl;

 geturl = $.ajax({
    type: "GET",
    url: 'http://www.telesurtv.net',
    success: function () {

       var geoip = geturl.getResponseHeader ("X-Planisys-CDN-geoip");
       console.log(geturl.getAllResponseHeaders());
            console.log("X-Planisys-CDN-geoip: " + geoip);
          var pais = geoip.substring(geoip.length - 2, geoip.length);  
          var capital = "";
          console.log("X-Planisys-CDN-geoip: " + pais);
          
   switch (pais){
    case "VE":
    capital = "Caracas";
    break;
    case "AR":
    capital = "Buenos_Aires";
    break;
     case "BR":
    capital = "Rio_de_Janeiro";
    break;
     default:
     capital = "Caracas";
    
   }
        console.log(capital);
        /*  $.getJSON("http://www.telesurtv.net/_static_rankings/jsonClima/"+capital+".json", function(ciudad) {   activar esta linea y desactivar la de abajo cuando se tengan json de otros paises */
            $.getJSON("http://www.telesurtv.net/_static_rankings/jsonClima/Caracas.json", function(ciudad) {
            console.log(ciudad.Tiempo);      
		var html = "";
		var temperatura = ciudad.Temperatura;
		var temperatura1 = temperatura.substring(0,2); 
		var Ciudad1 = ciudad.Ciudad;
		
		if(temperatura === undefined || temperatura == null || temperatura.length <= 0 || Ciudad1 === undefined || Ciudad1 == null || Ciudad1.length <= 0){
		html = "";
		}else {
		html = "<span style='margin-left: 35px;'> <strong>"+temperatura1+"</strong>° "+Ciudad1+"</span>";
		}
		
		$('.dateHead #gruiz').html(html);
            var condicion = ciudad.Tiempo;
             switch (condicion){
            case "Partly Cloudy":
                  $('.dateHead #gruiz').addClass("ParcialNublado32");                  
                  
                 break;
            case "Tropical Storm":
                  $('.dateHead #gruiz').addClass("Tormenta32");
                  
                 break;
            case "Hurricane":
                  $('.dateHead #gruiz').addClass("Huracan32");
                  
                 break;
            case "Severe Thunderstorms":
                  $('.dateHead #gruiz').addClass("Tormenta32");
                  
                 break;
            case "Thunderstorms":
                  $('.dateHead #gruiz').addClass("Tormenta32");
                  
                 break;
            case "Mixed Rain And Snow":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Mixed Rain And Sleet":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Freezing Drizzle":
                  $('.dateHead #gruiz').addClass("Llovizna32");
                  
                 break;
            case "Drizzle":
                  $('.dateHead #gruiz').addClass("Llovizna32");
                  
                 break;
            case "Freezing Rain":
                  $('.dateHead #gruiz').addClass("Lluvia32");
                  
                 break;
            case "Showers":
                  $('.dateHead #gruiz').addClass("Lluvia32");
                  
                 break;
            case "Snow Flurries":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Light Snow Showers":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Blowing Snow":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Snow":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Hail":
                  $('.dateHead #gruiz').addClass("Helada32");
                  
                 break;
            case "Sleet":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Dust":
                  $('.dateHead #gruiz').addClass("Polvo32");
                  
                 break;
            case "Foggy":
                  $('.dateHead #gruiz').addClass("Polvo32");
                  
                 break;
            case "Haze":
                  $('.dateHead #gruiz').addClass("");
                  
                 break;
            case "Smoky":
                  $('.dateHead #gruiz').addClass("");
                  
                 break;
            case "Blustery":
                  $('.dateHead #gruiz').addClass("");
                  
                 break;
            case "Windy":
                  $('.dateHead #gruiz').addClass("Ventoso32");
                  
                 break;
            case "Cold":
                  $('.dateHead #gruiz').addClass("Helada32");
                  
                 break;
            case "Cloudy":
                  $('.dateHead #gruiz').addClass("Nublado32");
                  
                 break;
            case "Mostly Cloudy (Night)":
                  $('.dateHead #gruiz').addClass("Nubladonoche32");
                  
                 break;
            case "Mostly Cloudy":
                  $('.dateHead #gruiz').addClass("ParcialNublado32");
                  
                 break;
            case "Partly Cloudy (Night)":
                  $('.dateHead #gruiz').addClass("Nubladonoche32");
                  
                 break;
            case "Clear (Night)":
                  $('.dateHead #gruiz').addClass("Luna32");
                  
                 break;
            case "Sunny":
                  $('.dateHead #gruiz').addClass("Soleado32");
                  
                 break;
            case "Fair (Night)":
                  $('.dateHead #gruiz').addClass("Luna32");
                  
                 break;
            case "Fair":
                  $('.dateHead #gruiz').addClass("Soleado32");
                  
                 break;
            case "Mixed Rain And Hail":
                  $('.dateHead #gruiz').addClass("Helada32");
                  
                 break;
            case "Hot":
                  $('.dateHead #gruiz').addClass("Soleado32");
                  
                 break;
            case "Isolated Thunderstorms":
                  $('.dateHead #gruiz').addClass("Tormenta32");
                  
                 break;
            case "Scattered Thunderstorms":
                  $('.dateHead #gruiz').addClass("Lluvia32");
                  
                 break;
            case "Scattered Showers":
                  $('.dateHead #gruiz').addClass("Lluvia32");
                  
                 break;
            case "Heavy Snow":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Scattered Snow Showers":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Thundershowers":
                  $('.dateHead #gruiz').addClass("Tormenta32");
                  
                 break;
            case "Snow Showers":
                  $('.dateHead #gruiz').addClass("Nieve32");
                  
                 break;
            case "Isolated Thundershowers":
                  $('.dateHead #gruiz').addClass("Lluvia32");
                  
                 break;
            case "PM Thunderstorms":
                  $('.dateHead #gruiz').addClass("Lluvia32");
                  
                 break;
            case "PM Showers":
                  $('.dateHead #gruiz').addClass("Lluvia32");                  

                 break;
            case "Mostly Sunny":
                  $('.dateHead #gruiz').addClass("Soleado32");                  

                 break;    
             }
            }).error(function(jqXHR, textStatus, errorThrown){ /* assign handler */
           
            console.log("error leyendo el json!");
        });
        
        
         
    }

  });
  