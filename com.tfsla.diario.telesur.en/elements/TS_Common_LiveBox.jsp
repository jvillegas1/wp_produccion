<%@ include file="TS_Common_Libraries.jsp" %>
<script language="JavaScript" type="text/JavaScript">
var win = null;
function NewWindow(mypage,myname,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
win = window.open(mypage,myname,settings)
}

function abrir2(url) {
open(url,'','top=70,left=120,width=445,height=500, scrollbars =NO, resizable=NO') ;
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>
<script>
    $(document).ready(function () {
      //  $("#svivo").html('<cms:include page="Live_Streaming.Code.jsp" />');
        $("#tit-svivo").addClass("menuA");
        
        if ((screen.width >= 320) && (screen.width <= 980)) {
           // $("#btn-svivo").addClass("savivoActHead");
            $("#btn-svivo").css({ background: "#9a1212 !important" });

        }
        else {
            //	$("link[rel=stylesheet]:not(:first)").attr({href : "detect800.css"});
       // alert("mayr");

        }
        //señal en vivo
        $("#btn-svivo").click(function () {
            $("#cajaPlayerUltra").html('<cms:include page="Live_Streaming.Code.jsp" />');
            $("#cajaPlayerUltraAudio").html("");
             $("#cajaPlayerUltraAudio").css("display", "none");
              $("#cajaPlayerUltra").css("display", "block");
            $("#tit-svivo").addClass("menuA");
            $("#tit-saudio").removeClass("menuA");
        });

        //solo audio
        $("#btn-saudio").click(function () {
            $("#cajaPlayerUltraAudio").html("");
            $("#cajaPlayerUltraAudio").append('<cms:include page="Live_Streaming_Code_SoloAudio.jsp" />');
            $("#cajaPlayerUltra").html("");
            $("#cajaPlayerUltra").css("display", "none");
             $("#cajaPlayerUltraAudio").css("display", "block");
            $("#tit-saudio").addClass("menuA");
            $("#tit-svivo").removeClass("menuA");
        });
    });
</script>
<div id="liveBox">
	<div class="wrap">
		<div id="cajaPlayerUltra" style="width: 50%;">
			<%--<iframe mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="http://mblive.telesur.ultrabase.net" align="middle" frameborder="0" height="534" width="100%"></iframe>--%>
		</div>
		 <div id="cajaPlayerUltraAudio" style="display: none;">
	
	        </div>
		<div class="liveRedes">
			<ul>    <ul>
		                    <li class="soloaudioli soloaudioliHead"><a id="btn-svivo" href="#"><img src="/export/sites/telesur/arte/ico-en-vivo.png" width="18" height="18" alt=""></a> <span id="tit-svivo">Live</span></li>
		                    <li class="soloaudioli soloaudioliHead"><a  id="btn-saudio" href="#"><img src="/arte/AUDIO_.png" width="18" height="18" alt=""></a> <span id="tit-saudio">Audio Only</span></li>
		                </ul>
				<li><a onclick="NewWindow('https://plus.google.com/share?url=http://goo.gl/13O8rM','playerrr','600','600','no');return false;" href='#.' style="text-align:right"><cms:img src="/arte/ico-google.png" height="18" scaleType="2" alt="Share on Google +" /></a></li>
				<li><a onclick="NewWindow('http://www.facebook.com/sharer.php?u=http://goo.gl/13O8rM&text=Look teleSUR stremaing','playerrr','600','600','no');return false;" href='#.'><cms:img src="/arte/ico-facebook.png" height="18" scaleType="2" alt="Share on Facebook" /></a></li>
				<li><a onclick="NewWindow('http://twitter.com/share?url=http://goo.gl/13O8rM&text=Look teleSUR stremaing','playerrr','600','600','no');return false;" href='#.'><cms:img src="/arte/ico-twitter.png" height="18" scaleType="2" alt="Share on twitter" /></a></li>
			</ul>
		</div>
	</div>
</div>