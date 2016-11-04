                      function siguiente(){
				indice = $('#position').val();
				indice = parseInt(indice) == contadorEquipos ? 0 : parseInt(indice) + 1;
				$('#position').val(indice);
				
				for (i=0;i<equipos.length;i++){ 
					for (j=0;j<equipos[indice].length;j++){ 
						switch (j) { 
							case 0: 
													
								//$('#contenedorFoto').attr("src", equipos[indice][j], "width", 200);
								$('#contenedorFoto').html(equipos[indice][j]);
								//html('<img src="'+equipos[indice][j]+'" width="200" height="200" border="0" />');
								break;
							case 1: 
								$('#nombre').html(equipos[indice][j]);
								break;
							case 2: 
								$('#cargo').html(equipos[indice][j]);
								break;
							case 3: 
								$('#curriculum').html(equipos[indice][j]);
								break;
							case 4: 
								$('#twitterimagen').html(equipos[indice][j]);
								//html(equipos[indice][j]);
								break;
							default:
								$('#twitter').html(equipos[indice][j]);
								//attr("href", equipos[indice][j], "title", equipos[indice][j]);
								
								
													
								
						}
					} 
				}
			}
			
			function previo(){
				indice = $('#position').val();
				indice = parseInt(indice) == 0 ? contadorEquipos : parseInt(indice) - 1;
				$('#position').val(indice);
				
							
				for (i=0;i<equipos.length;i++){ 
					for (j=0;j<equipos[indice].length;j++){ 
						switch (j) { 
							case 0: 
								//$('#contenedorFoto').attr("src", equipos[indice][j], "width", 200);
								$('#contenedorFoto').html(equipos[indice][j]);
								break;
							case 1: 
								$('#nombre').html(equipos[indice][j]);
								break;
							case 2: 
								$('#cargo').html(equipos[indice][j]);
								break;
							case 3: 
								$('#curriculum').html(equipos[indice][j]);
								break;
							case 4: 
								$('#twitterimagen').html(equipos[indice][j]);
								break;
							default:
								$('#twitter').html(equipos[indice][j]);
								
						}
					} 
				}
			}


	//Se dispara al cargarse la pagina
				$(document).ready(function(){
				var indice = null;
				if (gup('indice')==""){ 
				indice='0'; // Se setea en 0 si la pagina se carga directamente 
				} else { 
				indice = gup('indice'); // Se obtiene el parametro enviado por GET								
				$('#position').val(indice);} 
				for (i=0;i<equipos.length;i++){ 
					for (j=0;j<equipos[indice].length;j++){ 
						switch (j) { 
							case 0: 
								$('#contenedorFoto').html(equipos[indice][j]);
								//$('#contenedorFoto').attr("src", equipos[indice][j], "width", 200);
								break;
							case 1: 
								$('#nombre').html(equipos[indice][j]);
								break;
							case 2: 
								$('#cargo').html(equipos[indice][j]);
								break;
							case 3: 
								$('#curriculum').html(equipos[indice][j]);
								break;
							case 4: 
								$('#twitterimagen').html(equipos[indice][j]);
								break;
							default:
								$('#twitter').html(equipos[indice][j]);
								
						}
					} 
				} 
			});
			
			/**
			* Funcion para capturar varibales enviadas por get a una pagina a traves de javascript
			* 
			* @param name Cadena de texto que identifica el nombre de la varibale a capturar por el metodo get en la URL
			* @return Retorna el valor de la cadena pasada por el url
			*/
			function gup( name ){				
				var regexS = "[\\?&]"+name+"=([^&#]*)";
				var regex = new RegExp ( regexS );
				var tmpURL = window.location.href;
				var results = regex.exec( tmpURL );
				if( results == null ){
					return"";					
				} else {
					return results[1];
				}
			}
			
			/**
			* Funcion que se encarga de llenar el contenido con el indice seleccionado
			*
			* @param ind Especifica el indice seleccionado
			**/
			function contenido(ind){			
				$('#position').val(ind);
				for (i=0;i<equipos.length;i++){ 
					for (j=0;j<equipos[ind].length;j++){ 
						switch (j) { 
							case 0: 
								$('#contenedorFoto').html(equipos[indice][j]);
								//$('#contenedorFoto').attr("src", equipos[indice][j], "width", 200);
								break;
							case 1: 
								$('#nombre').html(equipos[ind][j]);
								break;
							case 2: 
								$('#cargo').html(equipos[ind][j]);
								break;
							case 3: 
								$('#curriculum').html(equipos[ind][j]);
								break;
							case 4: 
								$('#twitterimagen').html(equipos[indice][j]);
								break;
							default:
								$('#twitter').html(equipos[indice][j]);
									
						}
					} 
				}
			}