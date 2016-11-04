

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html version="xhtml 1.1" xml:lang="es" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/MarkUp/SCHEMA/xhtml11.xsd">
<head>

	


	<title>Documento XHTML básico</title>


</head>
<body>


<div id="result"></div>
	<script src="/system/modules/com.tfsla.diario.telesur/resources/js/jquery-1.11.0.min.js"></script>
	<script src="/system/modules/com.tfsla.diario.telesur/resources/js/webservice.js"></script>

<%String user_nick = request.getParameter("user");
String pass_nick = request.getParameter("clave");
out.println(pass_nick);%>

	<button onclick="addVideos()">Click me</button>             
<div class="content"></div>


</body>
</html>

<script type="text/javascript">

function obtenerDatos(formulario)
{
	var dia = formulario.name.value	

	alert(name);
}

function miOnLoad(){
   getParameterByName('embed');  
    getParameterByName('name'); 
}


   
  
  function getParameterByName(variable) {
   var query = window.location.search.substring(1);
   var vars = query.split("&");
   for (var i=0; i < vars.length; i++) {
       var pair = vars[i].split("=");
       if(pair[0] == variable) {
           return pair[1];
       }
   }
   return false;
}
	function addVideos() {
	
	

		var postRequest = new FormData();
                var embed = getParameterByName('embed');
                var name = getParameterByName('name');
                var agency = getParameterByName('agency');
                var author = getParameterByName('author');
                var keywords = getParameterByName('keywords');                
                alert (name);

		postRequest.append("section", "section");
		postRequest.append("video-type", "embedded");
		postRequest.append("file[0].name", name);
		postRequest.append("file[0]", "src=\"<script src=\'http://multimedia.telesurtv.net/player/insertar.js?slug="+embed+" \'><\/script>\"");		
		postRequest.append("file[0].agency", agency);
		postRequest.append("file[0].author", author);
		postRequest.append("file[0].keywords", keywords);
		postRequest.append("file[0].title", name);
		console.log(postRequest);
		
		


		var auto = $.ajax({
			type: "POST",
			contentType: false,
			url: "/system/modules/com.tfsla.diario.base/templates/webservices/authorizationService.jsp?username=gruiz&password=325693",
			dataType: "json",
			success: function(data)  {
 //procesar resultado
 var token = data.token;
 posting(token);
 console.log(token);
}
});

function posting (token){
			$.ajax({
				type: "POST",
				contentType: false,
				url: "/system/modules/com.tfsla.diario.base/templates/webservices/videosAddService.jsp?token="+token+"",
				data: postRequest,
				processData: false,
				dataType: "json",
				success: function(data)  {
 //procesar resultado
 console.log(data.data);

}
});
		}
	}

	</script>