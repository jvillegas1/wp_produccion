jQuery.fn.GetProgramas = function(primero, ultimo, programa){

			var path 	= "http://multimedia.telesurtv.net/api/clip/?callback=?";
			var categoria	= "";
			var fecha	= "";
			var descripcion = "";
			var $FRAME	= "";
			var $ASIDE	= "";

			$.getJSON(path,{
				detalle: "completo",
				primero: primero,
				ultimo: ultimo,
				tipo: "programa",
				programa: programa
			})
			.done(function(data){
			
				$.each(data,function(i){

					categoria_slug  = "";
					categoria_nombre = "";
					fecha		= GetVideoDate(data[i].fecha);
					titulo		= data[i].titulo;
					duracion	= GetVideoDuration(data[i].duracion);
					imagen		= data[i].thumbnail_gigante;
					video_slug	= data[i].slug;
					video_file	= data[i].archivo_url;
					url		= data[i].url;
					PathVideo	= data[i].descarga_url;
					Descripcion	= data[i].programa.descripcion;
					Descripcion = Descripcion.replace(new RegExp('\\n','g'),'');
					Descripcion = Descripcion.replace(new RegExp('\\r','g'),'');
					watchVideoFN	= "$().watchVideo(\'"+video_file+"\',\'"+imagen+"\',\'"+categoria_slug+"\',\'"+Descripcion+"\',\'"+fecha+"\',\'"+titulo+"\',\'"+video_slug+"\');";



					$ASIDE += '<div class="box" style="cursor: pointer">';
					$ASIDE += '<div class="contImg"><a href="#player" onclick="'+watchVideoFN+'"><img src="/arte/ico-play.png" alt="Telesur" class="icoPlay"><img src="'+imagen+'" height="82" alt="Telesur"></a></div>';
					$ASIDE += '<hgroup><h3><a href="#player" onclick="'+watchVideoFN+'">'+titulo.slice(0,65)+'</a></h3> <small>'+fecha+' · '+duracion+'</small></hgroup>';
					$ASIDE += '</div>';


		});//END EACH
		$("#ContenedorUltimos").append($FRAME+$ASIDE);




		});//END DONE


		}//END GetVideos 
		
jQuery.fn.GetHeaders = function(programa){

			var path  = "http://multimedia.telesurtv.net/api/clip/?callback=?";
			var categoria = "";
			var fecha = "";
			var descripcion = "";
			var $HEADER  = "";


			$.getJSON(path,{
				detalle: "completo",
				tipo: "programa",
				ultimo: "1",
				cache: false,
				programa: programa
			})
			.done(function(data){
				$.each(data,function(i){

					categoria_slug  = "";
					categoria_nombre = "";
					fecha		= GetVideoDate(data[0].fecha);
					titulo		= data[0].titulo;
					duracion	= GetVideoDuration(data[0].duracion);
					imagen		= data[0].thumbnail_gigante;
					thumbnail_grande = data[0].thumbnail_gigante;
					video_slug	= data[0].slug;
					video_file	= data[0].archivo_url;
					url		= data[0].url;
					PathVideo	= data[0].descarga_url;
					Descripcion	= data[0].programa.descripcion;
					Descripcion = Descripcion.replace(new RegExp('\\n','g'),'');
					Descripcion = Descripcion.replace(new RegExp('\\r','g'),'');
					


    
    					$HEADER += '<title>teleSURtv.net | Programas | '+titulo+'</title>';
					$HEADER += '<meta property="twitter:card" content="summary" />';
					$HEADER += '<meta property="twitter:url" content="http://www.telesurtv.net/seccion/programas/programas.html?prog='+programa+'/" />';
					$HEADER += '<meta property="twitter:title" content="teleSURtv.net | Programas | '+titulo+'" />';
					$HEADER += '<meta property="twitter:description" content="'+Descripcion+'" />';
					$HEADER += '<meta property="twitter:image" content="'+thumbnail_grande+'" />';
					$HEADER += '<meta property="twitter:site" content="@telesurtv" />';
					$HEADER += "<meta property='og:locale' content='es_ES'/>";
					$HEADER += "<meta property='og:type' content='article'/>";
					$HEADER += "<meta property='og:title' content='teleSURtv.net | Programas | "+titulo+"'/>";
					$HEADER += "<meta property='og:description' content='"+Descripcion+"'/>";
					$HEADER += "<meta property='og:url' content='http://www.telesurtv.net/seccion/programas/programas.html?prog="+programa+"'/>";
					$HEADER += "<meta property='og:site_name' content='La Señal Informativa de América Latina'/>";
					$HEADER += "<meta property='og:image' content='"+thumbnail_grande+"'/>";
					$HEADER += '<link rel="canonical" href="http://www.telesurtv.net/seccion/programas/programas.html?prog='+programa+'" />';
					
					

		});//END EACH
		
			//console.log($HEADER);
			$("head").append($HEADER);


		});//END DONE

			
		}//END GetHeaders


		jQuery.fn.GetDestacadoProgramas = function(programa){

			var path  = "http://multimedia.telesurtv.net/api/clip/?callback=?";
			var categoria = "";
			var fecha = "";
			var descripcion = "";
			var $FRAME  = "";
			var $ASIDE  = "";
			var INFO ="";
			var finaltwitter="";

			$.getJSON(path,{
				detalle: "completo",
				tipo: "programa",
				primero: "1",
				ultimo:"2",
				cache: false,
				programa: programa
			})
			.done(function(data){
				categoria_slug  = "";
				categoria_nombre = "";
				fecha   = GetVideoDate(data[0].fecha);
				titulo    = data[0].titulo;
				duracion  = GetVideoDuration(data[0].duracion);
				imagen    = data[0].thumbnail_gigante;
				video_slug  = data[0].slug;
				video_file  = data[0].archivo_url;
				descripcion = data[0].programa.descripcion;
				horario = data[0].programa.horario;
				twitter = data[0].programa.twitter;
				banner = data[0].programa.banner_url;
				url_descarga = data[0].archivo_url;
				visitas = data[0].estadisticas.vistas;
				widgetTwitter = data[0].programa.twitter_widget;
				conductores = data[0].programa.conductores;
				
				$.each(conductores,function(e){
				
				nombreConductor = conductores[e].nombre;
				twitterConductor = conductores[e].twitter;
				linktwitter = twitterConductor.replace("@", "");

				
				finaltwitter +="<div class='twitterUsr'>";
				finaltwitter += "<strong>"+nombreConductor+"</strong>";
				finaltwitter += "<a href='http://www.twitter.com/"+linktwitter+"' target='_blank'>"+twitterConductor+"</a>";
				finaltwitter += "</div>";
				
			
				
				});//END EACH
				widgetDefault = '<a class=\"twitter-timeline\" data-dnt=\"true\" href=\"https:\/\/twitter.com\/teleSURtv\" data-widget-id=\"595268460306964481\">Tweets por el @teleSURtv.<\/a>\r\n<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=\/^http:\/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\":\/\/platform.twitter.com\/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");<\/script>';
				if((widgetTwitter=="null") || (widgetTwitter==""))
				{
					widgetTwitter = widgetDefault;
				}

				$FRAME += '<div  class="wpVideo"><div id="VideoPrincipal"></div></div>';

				watchVideoFN  = "$().watchVideo(\'"+video_file+"\',\'"+imagen+"\',\'"+categoria_slug+"\',\'"+categoria_nombre+"\',\'"+fecha+"\',\'"+titulo+"\',\'"+video_slug+"\');";

				VideoInfo = GetVideoInfo(categoria_nombre,fecha,titulo,video_file,video_slug);
		//PARA EL DESTACADA
		$ASIDE += '<div class="data" id="data"><em class="fecha">'+fecha+'</em> <em class="rep">'+visitas+' Reproducciones</em><h2>'+titulo+'</h2><p>'+descripcion+'</p><a href="'+url_descarga+'?descarga" target"_blank">Descargar</a>';
		//PARA LA INFO DEL DESTACADA


		if (twitter!=null) {
			INFO += '<div class="usser">';
			INFO += finaltwitter;
		}
		else {
			INFO += '<div class="usser" style="    background-image:none;">';
			INFO += ' <div class="twitterUsr" style="line-height: 200%;"></div>';
		}


		INFO +='</div>';
		INFO +='</div>';
		INFO += '<div class="prog">';
		if (horario!="") {
			INFO += '<div class="horario"><strong>'+horario+'</div>';
		};

		if (descripcion!="") {

			INFO += '<div class="info">'+descripcion+'</div>';
		};

		INFO +='<div class="share"><div class="addthis_sharing_toolbox"></div></div></div></div>';

		$("#BloqueDestacado").append($FRAME+$ASIDE);
		$(".infoPrograma").append(INFO);

		if (banner!="http://media-telesur.openmultimedia.biz/programas/placeholder.gif"){
		$(".logoProg").append(' <img src="'+banner+'" alt="'+titulo+'" scaleColor="transparent">');
		}
		else{
		$(".headProgramas").css({ 'display': "none" });
		}
		
		$("#boxTwitter").append(widgetTwitter);


		jwplayer("VideoPrincipal").setup({
			file: data[0].archivo_url,
			image: data[0].thumbnail_gigante,
			width: "100%",
			aspectratio: "16:9"
		});

		});//END DONE


		}//END GetDestacado 


		jQuery.fn.GetRecomendamos = function(){

			var path  = "http://multimedia.telesurtv.net/api/clip/?callback=?";
			var categoria = "";
			var fecha = "";
			var descripcion = "";
			var $FRAME  = "";
			var $ASIDE  = "";
			var INFO ="";

			$.getJSON(path,{
				detalle:"completo",
				seleccionado:"true",
				ultimo:"2"
			})
			.done(function(data){
				$.each(data,function(i){
					categoria_slug  = (data[i].categoria==null?'':data[i].categoria.slug);
					categoria_nombre= (data[i].categoria==null?'':data[i].categoria.nombre);
					fecha   = GetVideoDate(data[i].fecha);
					titulo    = data[i].titulo;
					tituloLimpio = titulo.replace(/"/gi, "&quot;");
					duracion  = GetVideoDuration(data[i].duracion);
					imagen    = data[i].thumbnail_gigante;
					video_slug  = data[i].slug;
					video_file  = data[i].archivo_url;
					url   = data[i].url;
					watchVideoFN  = "$().watchVideo(\'"+video_file+"\',\'"+imagen+"\',\'"+categoria_slug+"\',\'"+categoria_nombre+"\',\'"+fecha+"\',\'"+tituloLimpio+"\',\'"+video_slug+"\');";


					$ASIDE += '<div class="box">';
					$ASIDE += '<div class="contImg"><a href="#player" onclick="'+watchVideoFN+'"><img src="/arte/ico-play.png" alt="Telesur" class="icoPlay"><img src="'+imagen+'"  width="306" height="173"></a></div>';
					$ASIDE += '<hgroup>';
					$ASIDE += '<h3><a href="#player">'+categoria+'</a></h3> <small>'+fecha+' · '+duracion+'</small>';
					$ASIDE += '<h2><a href="#player">'+titulo.slice(0,70)+'</a></h2>';
					$ASIDE += ' </hgroup>';
					$ASIDE += ' </div>';

		});//END EACH

		$("#BloqueRecomendamos").append($ASIDE);

		});//END DONE


		}//END GetRecomendamos

		jQuery.fn.watchVideo = function(file,image,categoria,descripcion,fecha,titulo,video_slug,PathVideo){

			jwplayer("VideoPrincipal").load({
				file: file,
				image: image
			});

			VideoInfo = GetVideoInfo(categoria_slug,descripcion,fecha,titulo,video_slug,file);

			$("#data").html(VideoInfo);
			jwplayer("VideoPrincipal").play({});
		}

		function GetVideoInfo(categoria_slug,descripcion,fecha,titulo,video_slug, videoDescarga){
			$hGroup = '<em class="fecha">'+fecha+'</em>';
			$hGroup += '<h2>'+titulo+'</h2>';
			$hGroup += '<p>'+descripcion+'</p>';
			$hGroup += '<a href="'+videoDescarga+'?descarga">Descargar</a>';
			//$hGroup += '<div class="coment">5 Comentarios</div>';


			return $hGroup;
		}
		function GetVideoDate(raw){
			var matches = raw.match(/(\d+)-(\d+)-(\d+) (\d+):(\d+):(\d+)/);
		/*return new Date( matches[1], // año
		(+matches[2])-1, // mes
		matches[3], // día
		matches[4], // hora
		matches[5], // minuto
		matches[6]); //segundo*/
		return matches[3]+" de "+GetMonthName((+matches[2])-1);
		}

		function GetMonthName(month){
			switch(month){
				case 0:
				result="Enero";
				break;
				case 1:
				result="Febrero";
				break;
				case 2:
				result="Marzo";
				break;
				case 3:
				result="Abril";
				break;
				case 4:
				result="Mayo";
				break;
				case 5:
				result="Junio";
				break;
				case 6:
				result="Julio";
				break;
				case 7:
				result="Agosto";
				break;
				case 8:
				result="Septiembre";
				break;
				case 9:
				result="Octubre";
				break;
				case 10:
				result="Noviembre";
				break;
				case 11:
				result="Diciembre";
				break;
		}//END SWITCH
		return result;
		}

		function GetVideoDuration(raw){
			var duracion_texo = "",
		umbral_arria = 55, // redondear arriba de 55 segundos Ã³ minutos
		ubral_abajo = 5, // redondear abajo de 05 segundos Ã³ minutos
		matches = raw.match(/(\d{2}):(\d{2}):(\d{2})/),
		horas = parseInt(matches[1]),
		minutos = parseInt(matches[2]),
		segundos = parseInt(matches[3]);

		// redondear segundos
		if (segundos > umbral_arria){
			segundos = 0; minutos++; 
		}else if (segundos < ubral_abajo && minutos > 0){
			segundos = 0;
		}

		// redondear minutos
		if (minutos > umbral_arria){
			minutos = 0; horas++; 
		}else if (minutos < ubral_abajo && horas > 0){
			minutos = 0;
		}

		// formar cadena
		if (horas > 0) duracion_texo += horas + "h ";
		if (minutos > 0) duracion_texo += minutos + "m ";
		if (segundos > 0) duracion_texo += segundos + "s";

		return duracion_texo.replace(/^\s+|\s+$/g, '');
		}