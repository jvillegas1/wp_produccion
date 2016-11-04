<%@ include file="TS_Common_Libraries.jsp" %>
<!--<nt:person-list size="5" state="1">
<img src="<nt:person-image width='100' height='100' scaletype='2' />" width="100" height="100" />
nombre: <nt:person-name /><br>
short description:<nt:person-shortdescription /><br>
long description:<nt:person-longdescription /><br>
custom 1 :<nt:person-custom1 /><br>
</nt:person-list>-->

                    
                       <br> Ranking de medallas juegos panamericanos:<br>



<script type='text/javascript'>
pais = new Array();
oro = new Array();
plata = new Array();
bronce = new Array();
totalfrases = 0;

function leerCITAS(json) {
totalfrases = json.feed.entry.length; 
console.log(json);
console.log(totalfrases);
for(i=0; i<totalfrases; i++) {
pais[i] = json.feed.entry[i].gsx$pais.$t;
oro[i] = json.feed.entry[i].gsx$oro.$t;
plata[i] = json.feed.entry[i].gsx$plata.$t;
bronce[i] = json.feed.entry[i].gsx$bronce.$t; 
}
}
function mostrarCITAS(donde) {
console.log(totalfrases);
var salida = "";

for(i=0; i<totalfrases; i++) {

salida += "<span class='frase'>"; 
salida += pais[i];
salida += "&nbsp;";
salida += "<span class='autor'>"+oro[i]+"</span>";
salida += "&nbsp;";
salida += "<span class='autor'>"+plata[i]+"</span>";
salida += "&nbsp;";
salida += "<span class='autor'>"+bronce[i]+"</span>";
salida += "</span'><br>";
document.getElementById(donde).innerHTML = salida;
}
}
</script>
<script src="http://spreadsheets.google.com/feeds/list/1iNmmrtMEmVmdBOqfItcLIINAqEUZPblscppk6HvAYE0/od6/public/values?alt=json-in-script&callback=leerCITAS" type="text/javascript">
</script>

<div id="frasesaleatorias">

</div>
<script type="text/javascript">
mostrarCITAS('frasesaleatorias');
</script>