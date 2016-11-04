<%@ page import="org.opencms.jsp.CmsJspActionElement" %>
<%@ page import="org.opencms.jsp.CmsJspLoginBean" %>
<%@ page import="org.opencms.file.CmsUser" %>
<%@ page import="org.opencms.file.CmsObject" %>
<%@ page import="com.tfsla.opencms.webusers.RegistrationModule" %>
<%@ page import="com.tfsla.opencms.webusers.TfsUserHelper" %>
<%@ page import="com.tfsla.statistics.model.TfsUserStatsOptions" %>
<%@ page import="com.tfsla.statistics.model.TfsHitUser" %>
<%@ page import="com.tfsla.exceptions.BusinessException" %>
<%@ page import="com.tfsla.rankUsers.service.RankService" %>
<%@ page import="com.tfsla.rankUsers.model.TfsUserRankResults" %>
<%@ page import="java.util.*" %>
<%@ page import="org.opencms.file.CmsGroup" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<%!
        public String getImgUsuario(String UserName,CmsObject cms) 
       {
       	  String foto = "";
       	  try {
	          CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, UserName);
	          TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
	          
	          String picture = tfsUser.getValorAdicional("USER_PICTURE");
	          
	          if(picture != null && !picture.equals(""))
	          	foto = picture;
	          	
	          String UserId= currentUser.getId().toString();
	          
	          String path = "/usuarios/img/";
	          String ext = "";
	          boolean resourceExists = false;
	         
		  if(foto.equals("")){
		          if(cms.existsResource(path+UserId+".jpg")){
		              resourceExists = true;
		              ext = ".jpg";
			    }
			    
			    if(!resourceExists){
		        	if(cms.existsResource(path+UserId+".jpeg")){
			            resourceExists = true;
			            ext = ".jpeg";
			         }
			    }			    
			    
			    if(!resourceExists){
		        	if(cms.existsResource(path+UserId+".gif")){
			            resourceExists = true;
			            ext = ".gif";
			         }
			    }
				
			    if(!resourceExists){
			        if(cms.existsResource(path+UserId+".png")){
			            resourceExists = true;
			            ext = ".png";
			        }
			    }
			    
			    if(!resourceExists){
		        	if(cms.existsResource(path+UserId+".bmp")){
			            resourceExists = true;
			            ext = ".bmp";
			         }
			    }			    
			    
			    if(!resourceExists){
		   		foto = "/arte/miPerfil_sinFotoUser.jpg";
			    }else{
		   		foto = path+UserId+ext;
			    }  
		 }
	  } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
	 return foto;
        }
       
        public String getApodoUsuario(String Username, CmsObject cms) 
        {
            String Apodo = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  
                  Apodo = tfsUser.getValorAdicional("APODO");
                  
                  if(Apodo ==null || Apodo.equals("") || Apodo == ""){
                  
                       if(Username.indexOf("@")>-1){
                       	String[] arrayUser = Username.split("@");
                       	Apodo = arrayUser[0];
                       }else{
                        Apodo = Username;
                       }
                  }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  Apodo;
        };
        
        
        public String getMiSitioUsuario(String Username, CmsObject cms) 
        {
            String MiSitio = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  
                  MiSitio = tfsUser.getValorAdicional("MI_SITIO");
                  
                  if(MiSitio == null){
                  	MiSitio = "" ;
                  }
                  
		  if(MiSitio != "" && !MiSitio.equals("") && MiSitio.indexOf("http") != 0){
		  	MiSitio = "http://" + MiSitio;
		  }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  MiSitio;
        };
        
       	public String getInteresUsuario(String Username, CmsObject cms, String rama) 
        {
            String interes = "false";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  String campo ="INTERES_"+rama;
                  interes = tfsUser.getValorAdicional(campo);
                  
                  if(interes == null || interes.equals("") || interes == ""){ interes = "false" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  interes;
        };
        
       	public String getProvinciaUsuario(String Username, CmsObject cms) 
        {
            String provincia = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  provincia = tfsUser.getValorAdicional("PROVINCIA");
                  
                  if(provincia == null || provincia.equals("") || provincia == ""){ provincia = "" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  provincia;
        };
        
        public String getLocalidadUsuario(String Username, CmsObject cms) 
        {
            String localidades = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  localidades = tfsUser.getValorAdicional("LOCALIDAD");
                  
                  if(localidades == null || localidades.equals("") || localidades == ""){ localidades = "" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  localidades;
        };

        public String getMostrarEmailUsuario(String Username, CmsObject cms) 
        {
            String mostrarMail = "false";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  mostrarMail = tfsUser.getValorAdicional("MOSTRAR_MAIL_PERFIL");
                  
                  if(mostrarMail == null || mostrarMail.equals("") || mostrarMail == ""){ mostrarMail = "" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  mostrarMail;
        };
        
        // Este campo dice si se muestra el apodo o el nombre real en las notas y comentarios.
        public String getAutorComentariosNotas (String Username, CmsObject cms) 
        {
            String autorComentariosNotas = "apodo";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  autorComentariosNotas  = tfsUser.getValorAdicional("AUTOR_COMENTARIOS_NOTAS");
                  
                  if(autorComentariosNotas == null || autorComentariosNotas.equals("") || autorComentariosNotas == ""){ autorComentariosNotas = "apodo" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  autorComentariosNotas ;
        };
        
        public Boolean getPuedanSeguirme(String Username, CmsObject cms) 
        {
            Boolean puedanSeguirme = false;
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  
                  if(tfsUser.getValorAdicional("PUEDAN_SEGUIRME") == null || tfsUser.getValorAdicional("PUEDAN_SEGUIRME") == ""){
                  	puedanSeguirme = false;
                  }
                  else{
                  	if(tfsUser.getValorAdicional("PUEDAN_SEGUIRME").equals("si"))
	                  	puedanSeguirme = true;
	                else
	                	puedanSeguirme = false;
                  }
                  
           } catch (Exception e) {
                //System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return puedanSeguirme;
        };        
        
        public String getFacebookUrl(String Username, CmsObject cms) 
        {
            String facebookUrl = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  facebookUrl = tfsUser.getValorAdicional("URL_FACEBOOK");
                  
                  if(facebookUrl == null || facebookUrl.equals("") || facebookUrl == ""){ facebookUrl = "" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  facebookUrl;
        };
        
        public String getTwitterUrl(String Username, CmsObject cms) 
        {
            String twitterUrl = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  twitterUrl = tfsUser.getValorAdicional("URL_TWITTER");
                  
                  if(twitterUrl == null || twitterUrl.equals("") || twitterUrl == ""){ twitterUrl = "" ; }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  twitterUrl;
        };
        
        public String getPopularidadPorc(String internalUser, CmsObject cms, HttpServletRequest request) 
        {
		float puestogralUser = 0;
		float puestogral = 1;
		
		//actualiza usuario mejor rankeado, una vez cada 4 horas.
		puestogral = updateTopRanking(request);
			
		try {
			CmsUser usuario = RegistrationModule.getInstance(cms).retrieveUser(cms, internalUser);
			String uid = usuario.getId().toString();
			TfsUserStatsOptions options2 = new TfsUserStatsOptions();
			options2.setSitio("tycsports");
			options2.setUsuario(uid);
			options2.setRankMode(TfsUserStatsOptions.RANK_GENERAL);
			//options2.setMaxResults(1);
			options2.setShowGeneralRank(true);
			
			RankService rServiceUser = new RankService();
			TfsUserRankResults resUser = rServiceUser.getStatistics(options2);
			
			if ( resUser != null && resUser.getRank() != null ) {
				for (TfsHitUser rankElementUser : resUser.getRank()) {
					puestogralUser = rankElementUser.getGeneralRank();
				}
			}
		} catch (Exception e) {
			// out.println("error al traer la popularidad");
		}
		
		
		float porcentajeUsuario = 0;
		int porcentajeUsuarioInt = 0;
		
		if ( puestogralUser > 0 ) {
			porcentajeUsuario = (puestogralUser * 100 ) /  (puestogral);
			porcentajeUsuarioInt  = Math.round(porcentajeUsuario);
		} else
			porcentajeUsuarioInt = 0;
		
		
	 	return String.valueOf(porcentajeUsuarioInt);
         };
         
         
          public String getCantComentarios(String internalUser, CmsObject cms, HttpServletRequest request){
          	
          	int comentarios = 0;		
	
		try {
			CmsUser usuario = RegistrationModule.getInstance(cms).retrieveUser(cms, internalUser);
			String uid = usuario.getId().toString();
			TfsUserStatsOptions options2 = new TfsUserStatsOptions();
			options2.setSitio("tycsports");
			options2.setUsuario(uid);
			options2.setRankMode(TfsUserStatsOptions.RANK_GENERAL);
			//options2.setMaxResults(1);
			options2.setShowComentariosRealizados(true);
			
			RankService rServiceUser = new RankService();
			TfsUserRankResults resUser = rServiceUser.getStatistics(options2);
			
			if ( resUser != null && resUser.getRank() != null ) {
				for (TfsHitUser rankElementUser : resUser.getRank()) {
					 comentarios = rankElementUser.getComentariosRealizados();
				}
			}
		} catch (Exception e) {
			// out.println("error al traer la popularidad");
		}
		
		return String.valueOf(comentarios);
	
	}


         public float updateTopRanking(HttpServletRequest request){
         
         	float puestogral = 0;

         	ServletContext context = request.getSession().getServletContext();
		
		//seteo la hora actual
		Date updateTime = new Date();

		//recupero la fecha de la ultima actualizacion
		Date lastUpdate = ( context.getAttribute("lastUpdate") != null ) ? (Date) context.getAttribute("lastUpdate"): null;
		
		//recupero el valor de la ultima actualización
		puestogral = ( context.getAttribute("topRanking") != null ) ? (Float) context.getAttribute("topRanking") : 0;
		
		if ( lastUpdate == null || ( updateTime.getTime() - lastUpdate.getTime() >  14400000 ) ) {
			/*
			Date now = new Date();
			Calendar cal = new GregorianCalendar();
			cal.setTime(now);
			cal.add(Calendar.HOUR,-4320);
			
			TfsUserStatsOptions options = new TfsUserStatsOptions();
			options.setSitio("tycsports");
			options.setRankMode(TfsUserStatsOptions.RANK_GENERAL);
			//options.setMaxResults(1);
			options.setShowComentariosRealizados(true);
			options.setShowNotasPublicadas(true);
			options.setShowGeneralRank(true);
			options.setShowComentariosRealizados(true);
			options.setFrom(cal.getTime());
			options.setTo(now);
			
			RankService rService = new RankService();
			TfsUserRankResults res = rService.getStatistics(options);
			
			if ( res != null && res.getRank() != null ) {
				for (TfsHitUser rankElement : res.getRank()) {
					try {
						puestogral = rankElement.getGeneralRank();
						
						context.setAttribute("lastUpdate", updateTime);
						context.setAttribute("topRanking", puestogral);
					}
					catch (Exception e){
						//
					}	
				}
			}	
			*/
		}

		return puestogral;
         
         };
         
        public String getDescripcionUsuario(String Username, CmsObject cms) 
        {
            String Descripcion = "";
        
            try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  
                  Descripcion = tfsUser.getValorAdicional("DESCRIPCION");
                  
                  if(Descripcion == null || Descripcion.equals("null") || Descripcion == "" ){ Descripcion = "" ;}
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return  Descripcion;
        };
        
        public String getImgPaisUsuario(String UserName, CmsObject cms) 
        {
        
           String ImgPais = "";
           
           try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, UserName);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  String pais = tfsUser.getPais();
                  
                  String paisID = pais;
                  if(pais.equals("") || pais == null ){ paisID = "0";}
                  
                  ImgPais = "/arte/banderas/48x48/pais"+paisID+".png";
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           if(ImgPais.equals("")){ ImgPais = "/arte/banderas/48x48/pais0.png";}
           
           return ImgPais;
        };
        
        public String getPaisUsuario(String UserName, CmsObject cms) 
        {
        
           String Pais = "";
           
           try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, UserName);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  String pais = tfsUser.getPais();
                  
                  String paisID = pais;
                  if(pais.equals("")){ paisID = "0";}
                  
                  Pais = getDescripcionPais(paisID);
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return Pais;
        }
        
        public String getImgEquipoUsuario(String Username, CmsObject cms) 
        {
          
           String equipoImg = "";
           String nombreEquipo = "";
           
           try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  String pais = tfsUser.getPais();
                  String equipo = tfsUser.getValorAdicional("EQUIPO");
                  String equipoImgSrc = "";
                  
                  String paisID = pais;
                  if(pais.equals("")){ paisID = "0";}
                     
                  if( equipo == null || equipo =="" || equipo.equals("0")  || paisID.equals("0")  ){
                             equipoImg = "/arte/perfil/noEquipo.png";
                   }else{
                             equipoImgSrc = getDatoEquipo(pais, equipo, "img");
                             equipoImg = "/arte/equipos/50x49/"+paisID+"/"+equipoImgSrc+".png";
                  }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           if(equipoImg.equals("")){ equipoImg = "/arte/perfil/noEquipo.png";}
           
           return equipoImg;
        }
        
        public String getEquipoUsuario(String Username, CmsObject cms) 
        {
          
           String equipoDesc = "";
           String nombreEquipo = "";
           
           try {
                  CmsUser currentUser = RegistrationModule.getInstance(cms).retrieveUser(cms, Username);
                  TfsUserHelper tfsUser = new TfsUserHelper(currentUser);
                  String pais = tfsUser.getPais();
                  String equipo = tfsUser.getValorAdicional("EQUIPO");
                  String equipoImgDesc = "";
                  
                  String paisID = pais;
                  if(pais.equals("")){ paisID = "0";}
                     
                  if( equipo == null || equipo =="" || equipo.equals("0")  || paisID.equals("0")  ){
                             equipoDesc = "Sin equipo";
                   }else{
                             equipoDesc = getDatoEquipo(pais, equipo, "descripcion");
                  }
                  
           } catch (Exception e) {
                // System.out.println("No se pudieron obterner los datos del usuario");
           }
           
           return equipoDesc;
        }
        
        public String getDescripcionPais(String IdPais){
              String Paises[] = new String [13];
              
              Paises[0] = "";
              Paises[1] = "Argentina";
              Paises[2] = "Bolivia";
              Paises[3] = "Brasil";
              Paises[4] = "Chile";
              Paises[5] = "Colombia";
              Paises[6] = "Ecuador";
              Paises[7] = "México";
              Paises[8] = "Paraguay";
              Paises[9] = "Perú";
              Paises[10] = "Uruguay";
              Paises[11] = "Venezuela";
              Paises[12] = "Otros";
              
              String Pais = "";
        	
              Pais = Paises[Integer.parseInt(IdPais)];	
        	
              return Pais; 
        }
        
        // Tipo = img | descripcion
        public String getDatoEquipo(String IdPais, String IdEquipo, String Tipo){
        
        	// indice - IdPais | subindice = IdEquipo | 0 = Descripcion | 1 = nombre archivo
                
               
		String DatosEquipo[][][] = new String [13][27][2]; 
		
		//Argentina
		DatosEquipo[1][0][0] = "Sin equipo";
		DatosEquipo[1][0][1] = "noEquipo";
		DatosEquipo[1][1][0] = "All Boys";
		DatosEquipo[1][1][1] = "allBoys";
		DatosEquipo[1][2][0] = "Argentinos Jrs.";
		DatosEquipo[1][2][1] = "argentinos";
		DatosEquipo[1][3][0] = "Atlético Rafaela";
		DatosEquipo[1][3][1] = "rafaela";
		DatosEquipo[1][4][0] = "Arsenal";
		DatosEquipo[1][4][1] = "arsenal";
		DatosEquipo[1][5][0] = "Banfield";
		DatosEquipo[1][5][1] = "banfield";
		DatosEquipo[1][6][0] = "C.A. Belgrano";
		DatosEquipo[1][6][1] = "belgrano";
		DatosEquipo[1][7][0] = "Boca Jrs."; 
		DatosEquipo[1][7][1] = "boca";
		DatosEquipo[1][8][0] ="Colón";
		DatosEquipo[1][8][1] ="colon";
		DatosEquipo[1][9][0] ="Estudiantes";
		DatosEquipo[1][9][1] = "estudiantes";
		DatosEquipo[1][10][0] ="Gimnasia";
		DatosEquipo[1][10][1] = "gimnasia";
		DatosEquipo[1][11][0] ="Godoy Cruz";
		DatosEquipo[1][11][1] = "godoyCruz";
		DatosEquipo[1][12][0] ="Huracán";
		DatosEquipo[1][12][1] ="huracan";
		DatosEquipo[1][13][0] ="Independiente";
		DatosEquipo[1][13][1] = "independiente";
		DatosEquipo[1][14][0] ="Lanús";
		DatosEquipo[1][14][1] = "lanus";
		DatosEquipo[1][15][0] ="Newell's";
		DatosEquipo[1][15][1] = "newells";
		DatosEquipo[1][16][0] ="Olimpo";
		DatosEquipo[1][16][1] = "olimpo";
		DatosEquipo[1][17][0] ="Quilmes";
		DatosEquipo[1][17][1] ="quilmes";
		DatosEquipo[1][18][0] ="Racing";
		DatosEquipo[1][18][1] ="racing";
		DatosEquipo[1][19][0] ="River Plate";
		DatosEquipo[1][19][1] ="river";
		DatosEquipo[1][20][0] ="Rosario Central";
		DatosEquipo[1][20][1] ="rosario";
		DatosEquipo[1][21][0] ="San Lorenzo";
		DatosEquipo[1][21][1] ="sanLorenzo";
		DatosEquipo[1][22][0] ="San Martín de San Juan";
		DatosEquipo[1][22][1] ="sanmartin";
		DatosEquipo[1][23][0] ="Talleres";
		DatosEquipo[1][23][1] ="talleres";
		DatosEquipo[1][24][0] ="Tigre";
		DatosEquipo[1][24][1] ="tigre";
		DatosEquipo[1][25][0] ="Unión de Santa Fe";
		DatosEquipo[1][25][1] ="santafe";
		DatosEquipo[1][26][0] ="Vélez";
		DatosEquipo[1][26][1] ="velez";
		
		//Bolivia
		DatosEquipo[2][0][0] ="Seleccione equipo";
		DatosEquipo[2][0][1] = "noEquipo";
		DatosEquipo[2][1][0] ="Aurora";
		DatosEquipo[2][1][1] = "aurora";
		DatosEquipo[2][2][0] ="Blooming";
		DatosEquipo[2][2][1] ="blooming";
		DatosEquipo[2][3][0] ="Bolívar";
		DatosEquipo[2][3][1] ="bolivar";
		DatosEquipo[2][4][0] ="Guabirá";
		DatosEquipo[2][4][1] ="guabira";
		DatosEquipo[2][5][0] ="J. Wilsterman";
		DatosEquipo[2][5][1] ="jWilstermann";
		DatosEquipo[2][6][0] ="La Paz FC";
		DatosEquipo[2][6][1] ="laPaz";
		DatosEquipo[2][7][0] ="Nacional Potosí";
		DatosEquipo[2][7][1] ="nPotosi";
		DatosEquipo[2][8][0] ="Oriente Petrolero";
		DatosEquipo[2][8][1] ="oPetrolero";
		DatosEquipo[2][9][0] ="Real Mamoré";
		DatosEquipo[2][9][1] ="rMamore";
		DatosEquipo[2][10][0] ="Real Potosí";
		DatosEquipo[2][10][1] ="rPotosi";
		DatosEquipo[2][11][0] ="San José";
		DatosEquipo[2][1][1] ="sanJose";
		DatosEquipo[2][12][0] ="The Strongest";
		DatosEquipo[2][12][1] ="theStrongest";
		DatosEquipo[2][13][0] ="Universitario de Sucre";
		DatosEquipo[2][13][1] ="universitario";
		
		//Brasil
		DatosEquipo[3][0][0] ="Seleccione equipo";
		DatosEquipo[3][0][1] ="noEquipo";
		DatosEquipo[3][1][0] ="Atletico Mineiro";
		DatosEquipo[3][1][1] ="aMineiro";
		DatosEquipo[3][2][0] ="Avaí";
		DatosEquipo[3][2][1] ="avai";
		DatosEquipo[3][3][0] ="Botafogo";
		DatosEquipo[3][3][1] ="botafogo";
		DatosEquipo[3][4][0] ="Ceara";
		DatosEquipo[3][4][1] ="ceara";
		DatosEquipo[3][5][0] ="Corinthians";
		DatosEquipo[3][5][1] ="corinthians";
		DatosEquipo[3][6][0] ="Cruzeiro";
		DatosEquipo[3][6][1] ="cruzeiro";
		DatosEquipo[3][7][0] ="Flamengo";
		DatosEquipo[3][7][1] ="flamengo";
		DatosEquipo[3][8][0] ="Fluminense";
		DatosEquipo[3][8][1] ="fluminense";
		DatosEquipo[3][9][0] ="Atlético Goianiense";
		DatosEquipo[3][9][1] ="goianiense";
		DatosEquipo[3][10][0] ="Goias";
		DatosEquipo[3][10][1] ="goias";
		DatosEquipo[3][11][0] ="Gremio Prudente";
		DatosEquipo[3][11][1] ="gremio";
		DatosEquipo[3][12][0] ="Gremio P.";
		DatosEquipo[3][12][1] ="gremioP";
		DatosEquipo[3][13][0] ="Guarani";
		DatosEquipo[3][13][1] ="guarani";
		DatosEquipo[3][14][0] ="Inter";
		DatosEquipo[3][14][1] ="inter";
		DatosEquipo[3][15][0] ="Palmeiras";
		DatosEquipo[3][15][1] ="palmeiras";
		DatosEquipo[3][16][0] ="Atlético Paranaense";
		DatosEquipo[3][16][1] ="paranaense";
		DatosEquipo[3][17][0] ="Santos";
		DatosEquipo[3][17][1] ="santos";
		DatosEquipo[3][18][0] ="San Pablo";
		DatosEquipo[3][18][1] ="sanPablo";
		DatosEquipo[3][19][0] ="Vasco Da Gama";
		DatosEquipo[3][19][1] ="vDaGama";
		DatosEquipo[3][20][0] ="Vitória";
		DatosEquipo[3][20][1] ="victoria";
		
		//Chile
		DatosEquipo[4][0][0]="Seleccione equipo"; 
		DatosEquipo[4][0][1]="noEquipo";
		DatosEquipo[4][1][0]="Audax"; 
		DatosEquipo[4][1][1]= "audax";
		DatosEquipo[4][2][0]="Cobreloa"; 
		DatosEquipo[4][2][1]="cobreloa";
		DatosEquipo[4][3][0]="Cobresal"; 
		DatosEquipo[4][3][1]="cobresal";
		DatosEquipo[4][4][0]="Colo Colo"; 
		DatosEquipo[4][4][1]="ColoColo";
		DatosEquipo[4][5][0]="Everton"; 
		DatosEquipo[4][5][1]="everton";
		DatosEquipo[4][6][0]="Huachipato"; 
		DatosEquipo[4][6][1]="huachipato";
		DatosEquipo[4][7][0]="La Serena"; 
		DatosEquipo[4][7][1]="laSerena";
		DatosEquipo[4][8][0]="Ñublense"; 
		DatosEquipo[4][8][1]="nublense";
		DatosEquipo[4][9][0]="O'Higgins"; 
		DatosEquipo[4][9][1]="oHiggins";
		DatosEquipo[4][10][0]="Palestino"; 
		DatosEquipo[4][10][1]="palestino";
		DatosEquipo[4][11][0]="San Luis"; 
		DatosEquipo[4][11][1]="sanLuis";
		DatosEquipo[4][12][0]="Santiago Wanderers"; 
		DatosEquipo[4][12][1]="sWanderers";
		DatosEquipo[4][13][0]="Unión Española"; 
		DatosEquipo[4][13][1]="uEspanola";
		DatosEquipo[4][14][0]="San Felipe"; 
		DatosEquipo[4][14][1]="sanFelipe";
		DatosEquipo[4][15][0]="Universidad Católica"; 
		DatosEquipo[4][15][1]="uCatolica";
		DatosEquipo[4][16][0]="Universidad de Chile"; 
		DatosEquipo[4][16][1]="uDeChile";
		DatosEquipo[4][17][0]="Universidad de Concepción"; 
		DatosEquipo[4][17][1]="uDeConcepcion";
		
		DatosEquipo[4][18][0]="Unión La Calera"; 
		DatosEquipo[4][18][1]="uDeLaCalera";
		DatosEquipo[4][19][0]="Deportes Antofagasta"; 
		DatosEquipo[4][19][1]="deportesAntofogasta";
		DatosEquipo[4][20][0]="Rangers"; 
		DatosEquipo[4][20][1]="rangers";
		DatosEquipo[4][21][0]="Deportes Iquique"; 
		DatosEquipo[4][21][1]="deportesIquique";
		DatosEquipo[4][22][0]="San Marcos de Arica"; 
		DatosEquipo[4][22][1]="sanMarcosDeArica";		
		
		//Colombia
		DatosEquipo[5][0][0]="Seleccione equipo"; 
		DatosEquipo[5][0][1]= "noEquipo";
		DatosEquipo[5][1][0]="América"; 
		DatosEquipo[5][1][1]= "america";
		DatosEquipo[5][2][0]="Bucaramanga";
		DatosEquipo[5][2][1]="bucaramanga";
		DatosEquipo[5][3][0]="Deportivo Cali"; 
		DatosEquipo[5][3][1]="cali";
		DatosEquipo[5][4][0]="Boyacá Chicó"; 
		DatosEquipo[5][4][1]="chico";
		DatosEquipo[5][5][0]="Cúcuta"; 
		DatosEquipo[5][5][1]="cucuta";
		DatosEquipo[5][6][0]="Envigado"; 
		DatosEquipo[5][6][1]="envigado";
		DatosEquipo[5][7][0]="La Equidad"; 
		DatosEquipo[5][7][1]="equidad";
		DatosEquipo[5][8][0]="Huila"; 
		DatosEquipo[5][8][1]="huila";
		DatosEquipo[5][9][0]="Itagui"; 
		DatosEquipo[5][9][1]="itagui";
		DatosEquipo[5][10][0]="Junior"; 
		DatosEquipo[5][10][1]="junior";
		DatosEquipo[5][11][0]="Independiente Medellín"; 
		DatosEquipo[5][11][1]="medellin";
		DatosEquipo[5][12][0]="Millonarios"; 
		DatosEquipo[5][12][1]="millonarios";
		DatosEquipo[5][13][0]="Atlético Nacional"; 
		DatosEquipo[5][13][1]="nacional";
		DatosEquipo[5][14][0]="Once Caldas"; 
		DatosEquipo[5][14][1]="onceCaldas";
		DatosEquipo[5][15][0]="Pasto"; 
		DatosEquipo[5][15][1]="pasto";
		DatosEquipo[5][16][0]="Pereira"; 
		DatosEquipo[5][16][1]="pereira";
		DatosEquipo[5][17][0]="Deportes Quindío"; 
		DatosEquipo[5][17][1]="quindo";
		DatosEquipo[5][18][0]="Real Cartagena"; 
		DatosEquipo[5][18][1]="rCartagena";
		DatosEquipo[5][19][0]="Independiente Santa Fe"; 
		DatosEquipo[5][19][1]="staFe";
		DatosEquipo[5][20][0]="Tolima"; 
		DatosEquipo[5][20][1]="tolima";
		DatosEquipo[5][21][0]="Tulúa"; 
		DatosEquipo[5][21][1]="tulua";
		DatosEquipo[5][22][0]="Deportes Tolima"; 
		DatosEquipo[5][22][1]="deportesTolima";
		
		//Ecuador
		DatosEquipo[6][0][0]="Seleccione equipo"; 
		DatosEquipo[6][0][1]= "noEquipo";
		DatosEquipo[6][1][0]="Barcelona"; 
		DatosEquipo[6][1][1]= "barcelona";
		DatosEquipo[6][2][0]="Deportivo Cuenca"; 
		DatosEquipo[6][2][1]="depCuenca";
		DatosEquipo[6][3][0]="Deportivo Quito"; 
		DatosEquipo[6][3][1]="depQuito";
		DatosEquipo[6][4][0]="El Nacional"; 
		DatosEquipo[6][4][1]="elNacional";
		DatosEquipo[6][5][0]="Emelec"; 
		DatosEquipo[6][5][1]="emelec";
		DatosEquipo[6][6][0]="Espoli"; 
		DatosEquipo[6][6][1]="espoli";
		DatosEquipo[6][7][0]="Independiente José Terán"; 
		DatosEquipo[6][7][1]="jTeran";
		DatosEquipo[6][8][0]="Liga de Quito"; 
		DatosEquipo[6][8][1]="ligadeQuito";
		DatosEquipo[6][9][0]="Macará"; 
		DatosEquipo[6][9][1]="macara";
		DatosEquipo[6][10][0]="Manta"; 
		DatosEquipo[6][10][1]="manta";
		DatosEquipo[6][11][0]="Olmedo"; 
		DatosEquipo[6][11][1]="olmedo";
		DatosEquipo[6][12][0]="Universidad Católica"; 
		DatosEquipo[6][12][1]="uCatolica";
		
		DatosEquipo[6][13][0]="Liga de Loja"; 
		DatosEquipo[6][13][1]="ligaDeLoja";
		DatosEquipo[6][14][0]="Técnico Universitario"; 
		DatosEquipo[6][14][1]="tecnicoUniversitario";
		
		//Mexico
		DatosEquipo[7][0][0]="Seleccione equipo"; 
		DatosEquipo[7][0][1]="noEquipo";
		DatosEquipo[7][1][0]="América"; 
		DatosEquipo[7][1][1]="america";
		DatosEquipo[7][2][0]="Atlante"; 
		DatosEquipo[7][2][1]="atlante";
		DatosEquipo[7][3][0]="Atlas"; 
		DatosEquipo[7][3][1]="atlas";
		DatosEquipo[7][4][0]="Estudiantes Tecos"; 
		DatosEquipo[7][4][1]="eTecos";
		DatosEquipo[7][5][0]="Cruz Azul"; 
		DatosEquipo[7][5][1]="cruzAzul";
		DatosEquipo[7][6][0]="Chivas Guadalajara"; 
		DatosEquipo[7][6][1]="chivas";
		DatosEquipo[7][7][0]="Jaguares de Chiapas"; 
		DatosEquipo[7][7][1]="jaguares";
		DatosEquipo[7][8][0]="Monarcas Morelia"; 
		DatosEquipo[7][8][1]="morelia";
		DatosEquipo[7][9][0]="Monterrey"; 
		DatosEquipo[7][9][1]="monterrey";
		DatosEquipo[7][10][0]="Necaxa"; 
		DatosEquipo[7][10][1]="necaxa";
		DatosEquipo[7][11][0]="Pachuca"; 
		DatosEquipo[7][11][1]="pachuca";
		DatosEquipo[7][12][0]="Puebla"; 
		DatosEquipo[7][12][1]="puebla";
		DatosEquipo[7][13][0]="Pumas UNAM"; 
		DatosEquipo[7][13][1]="pumas";
		DatosEquipo[7][14][0]="Querétaro"; 
		DatosEquipo[7][14][1]="queretaro";
		DatosEquipo[7][15][0]="Santos Laguna"; 
		DatosEquipo[7][15][1]="santos";
		DatosEquipo[7][16][0]="San Luis"; 
		DatosEquipo[7][16][1]="sanluis";
		DatosEquipo[7][17][0]="Tigres"; 
		DatosEquipo[7][17][1]="tigres";
		DatosEquipo[7][18][0]="Toluca"; 
		DatosEquipo[7][18][1]="toluca";
		
		DatosEquipo[7][19][0]="Xolos de Tijuana"; 
		DatosEquipo[7][19][1]="xolosDeTijuana";
		DatosEquipo[7][20][0]="León"; 
		DatosEquipo[7][20][1]="leon";
		
		
		
		//Paraguay
		DatosEquipo[8][0][0]="Seleccione equipo"; 
		DatosEquipo[8][0][1]= "noEquipo";
		DatosEquipo[8][1][0]="3 de Febrero"; 
		DatosEquipo[8][1][1]= "3deFebrero";
		DatosEquipo[8][2][0]="Cerro Porteño"; 
		DatosEquipo[8][2][1]="cerro";
		DatosEquipo[8][3][0]="Guaraní"; 
		DatosEquipo[8][3][1]="guarani";
		DatosEquipo[8][4][0]="Libertad"; 
		DatosEquipo[8][4][1]="libertad";
		DatosEquipo[8][5][0]="Nacional"; 
		DatosEquipo[8][5][1]="nacional";
		DatosEquipo[8][6][0]="Olimpia"; 
		DatosEquipo[8][6][1]="olimpia";
		DatosEquipo[8][7][0]="Rubio Ñu"; 
		DatosEquipo[8][7][1]="Rubionu";
		DatosEquipo[8][8][0]="Sol de América"; 
		DatosEquipo[8][8][1]="soldeAmerica";
		DatosEquipo[8][9][0]="Sport Colombia"; 
		DatosEquipo[8][9][1]="sportColombia";
		DatosEquipo[8][10][0]="Sportivo Luqueño"; 
		DatosEquipo[8][10][1]="luqueno";
		DatosEquipo[8][11][0]="Tacuary"; 
		DatosEquipo[8][11][1]="tacuary";
		DatosEquipo[8][12][0]="Trinidense"; 
		DatosEquipo[8][12][1]="trinidense";
		DatosEquipo[8][13][0]="Cerro Porteño Pte. Franco"; 
		DatosEquipo[8][13][1]="cerroPortenioPteFranco";

		
		//Perú
		DatosEquipo[9][0][0]="Seleccione equipo"; 
		DatosEquipo[9][0][1]= "noEquipo";
		DatosEquipo[9][1][0]="Alianza Atletico"; 
		DatosEquipo[9][1][1]= "aAtletico";
		DatosEquipo[9][2][0]="Alianza Lima"; 
		DatosEquipo[9][2][1]="aLima";
		DatosEquipo[9][3][0]="Cesar Vallego"; 
		DatosEquipo[9][3][1]="cVallego";
		DatosEquipo[9][4][0]="Cienciano"; 
		DatosEquipo[9][4][1]="cienciano";
		DatosEquipo[9][5][0]="José Gálvez"; 
		DatosEquipo[9][5][1]="galvez";
		DatosEquipo[9][6][0]="Sport Huancayo"; 
		DatosEquipo[9][6][1]="huancayo";
		DatosEquipo[9][7][0]="Inti Gas"; 
		DatosEquipo[9][7][1]="initgas";
		DatosEquipo[9][8][0]="Iquitos"; 
		DatosEquipo[9][8][1]="iquitos";
		DatosEquipo[9][9][0]="Juan Aurich"; 
		DatosEquipo[9][9][1]="jAurich";
		DatosEquipo[9][10][0]="León de Huánuco"; 
		DatosEquipo[9][10][1]="leonDeH";
		DatosEquipo[9][11][0]="Melgar"; 
		DatosEquipo[9][11][1]="melgar";
		DatosEquipo[9][12][0]="Universidad San Martín"; 
		DatosEquipo[9][12][1]="sMartin";
		DatosEquipo[9][13][0]="Sport Boys"; 
		DatosEquipo[9][13][1]="sportBoys";
		DatosEquipo[9][14][0]="Sporting Cristal"; 
		DatosEquipo[9][14][1]="sportingCristal";
		DatosEquipo[9][15][0]="Total Chalaco"; 
		DatosEquipo[9][15][1]="totalChalaco";
		DatosEquipo[9][16][0]="U. de Lima"; 
		DatosEquipo[9][16][1]="uDeLima";
		DatosEquipo[9][16][0]="Real Garcilaso"; 
		DatosEquipo[9][16][1]="realGarcilaso";
		
		
		//Uruguay
		DatosEquipo[10][0][0]="Seleccione equipo"; 
		DatosEquipo[10][0][1]= "noEquipo";
		DatosEquipo[10][1][0]="Bella Vista"; 
		DatosEquipo[10][1][1]= "bellaVista";
		DatosEquipo[10][2][0]="Central Español"; 
		DatosEquipo[10][2][1]="cEspanol";
		DatosEquipo[10][3][0]="Cerro"; 
		DatosEquipo[10][3][1]="cerro";
		DatosEquipo[10][4][0]="El Tanque Sisley"; 
		DatosEquipo[10][4][1]="elTanqueSisley";
		DatosEquipo[10][5][0]="Danubio"; 
		DatosEquipo[10][5][1]="danubio";
		DatosEquipo[10][6][0]="Defensor Sporting"; 
		DatosEquipo[10][6][1]="dSporting";
		DatosEquipo[10][7][0]="Fénix"; 
		DatosEquipo[10][7][1]="fenix";
		DatosEquipo[10][8][0]="Liverpool"; 
		DatosEquipo[10][8][1]="liverpool";
		DatosEquipo[10][9][0]="Miramar"; 
		DatosEquipo[10][9][1]="miramar";
		DatosEquipo[10][10][0]="Nacional"; 
		DatosEquipo[10][10][1]="nacional";
		DatosEquipo[10][11][0]="Peñarol"; 
		DatosEquipo[10][11][1]="penarol";
		DatosEquipo[10][12][0]="Racing Club Montevideo"; 
		DatosEquipo[10][12][1]="racingClub";
		DatosEquipo[10][13][0]="Rampla Juniors"; 
		DatosEquipo[10][13][1]="rampla";
		DatosEquipo[10][14][0]="River Plate"; 
		DatosEquipo[10][14][1]="rPlate";
		DatosEquipo[10][15][0]="Tacuarembó"; 
		DatosEquipo[10][15][1]="tacuarembo";
		DatosEquipo[10][16][0]="Montevideo Wanderers"; 
		DatosEquipo[10][16][1]="wanderers";
		
		//Venezuela
		DatosEquipo[11][0][0]="Seleccione equipo"; 
		DatosEquipo[11][0][1]= "noEquipo";
		DatosEquipo[11][1][0]="Deportivo Anzoátegui"; 
		DatosEquipo[11][1][1]= "anzoategui";
		DatosEquipo[11][2][0]="Aragua"; 
		DatosEquipo[11][2][1]="aragua";
		DatosEquipo[11][3][0]="Atlético Venezuela"; 
		DatosEquipo[11][3][1]="aVenezuela";
		DatosEquipo[11][4][0]="Carabobo"; 
		DatosEquipo[11][4][1]="carabobo";
		DatosEquipo[11][5][0]="Caracas"; 
		DatosEquipo[11][5][1]="caracas";
		DatosEquipo[11][6][0]="Caroní"; 
		DatosEquipo[11][6][1]="Caroni";
		DatosEquipo[11][7][0]="Deportivo Lara"; 
		DatosEquipo[11][7][1]="depLara";
		DatosEquipo[11][8][0]="Deportivo Petare"; 
		DatosEquipo[11][8][1]="depPetare";
		DatosEquipo[11][9][0]="E. de Mérida"; 
		DatosEquipo[11][9][1]="EdeMerida";
		DatosEquipo[11][10][0]="El Vigía"; 
		DatosEquipo[11][10][1]="elVigia";
		DatosEquipo[11][11][0]="Mineros de Guayana"; 
		DatosEquipo[11][11][1]="MdeGuayana";
		DatosEquipo[11][12][0]="Monagas"; 
		DatosEquipo[11][12][1]="monagas";
		DatosEquipo[11][13][0]="Real Esppor"; 
		DatosEquipo[11][13][1]="rEsppor";
		DatosEquipo[11][14][0]="Deportivo Táchira"; 
		DatosEquipo[11][14][1]="tachira";
		DatosEquipo[11][15][0]="Trujillanos"; 
		DatosEquipo[11][15][1]="trujillanos";
		DatosEquipo[11][16][0]="Yaracuyanos"; 
		DatosEquipo[11][16][1]="yaracuyanos";
		DatosEquipo[11][17][0]="Zamora"; 
		DatosEquipo[11][17][1]="zamora";
		DatosEquipo[11][18][0]="Zulia"; 
		DatosEquipo[11][18][1]="zulia";
		DatosEquipo[11][18][0]="Deportivo Lara"; 
		DatosEquipo[11][18][1]="deportivoLara";
		
		//Otros
		DatosEquipo[12][0][0]="Seleccione equipo"; 
		DatosEquipo[12][0][1]= "noEquipo";
     
        	String equipo = "";
        	
        	if(Tipo.equals("descripcion")){
        	   equipo = DatosEquipo[Integer.parseInt(IdPais)][Integer.parseInt(IdEquipo)][0];
        	}else{
        	   equipo = DatosEquipo[Integer.parseInt(IdPais)][Integer.parseInt(IdEquipo)][1];
        	}
        	
        	return equipo; 
            
        }
%>