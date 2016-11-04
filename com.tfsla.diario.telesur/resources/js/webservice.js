function getParameterByName(name) { 
 if (name !== "" && name !== null && name != undefined) 
 { name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), 
  results = regex.exec(location.search); 
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); } 
  else { var arr = location.href.split("/"); return arr[arr.length - 1]; } } 


function addVideos() {

 var postRequest = new FormData();
 
var prueba = getParameterByName('valor');
var embed = document.createElement( 'html' );
embed.innerHTML = "<script src='http://multimedia.telesurtv.net/player/insertar.js?slug="+prueba+"'></script>";

 
 
 var  url = "http://multimedia.telesurtv.net/player/insertar.js?slug=en-que-consistio-el-plan-condor"
 //var shit = encodeURIComponent(src);
 
 
   var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
 
 console.log(script);
postRequest.append("section", "section");
postRequest.append("video-type", "embedded");
postRequest.append("file[0].name", "asdasd");
postRequest.append("file[0]",embed);
postRequest.append("file[0].agency", "asdasd");
postRequest.append("file[0].author", "asdasd");
postRequest.append("file[0].keywords", "asd");
postRequest.append("file[0].title", "asdasd");
 //console.log(postRequest);
 

 
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