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
        $("#svivo").html('<cms:include page="Live_Streaming.Code.jsp" />');
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
        <div id="cajaPlayerUltra">

        </div>
        
        <div class="bannerVivo">
			<cms:include page="../elements/TS_Common_Banners.jsp">
				<cms:param name="template">vivo</cms:param>
				<cms:param name="key">Advert-183x374-d</cms:param>
			</cms:include>
			<div id='div-gpt-ad-1465262063828-0'>
				<script type='text/javascript'>
				googletag.cmd.push(function() { googletag.display('div-gpt-ad-1465262063828-0'); });
				</script>
			</div>
        </div>
 
         <div id="cajaPlayerUltraAudio" style="display: none;">

        </div>
        <div class="cajadevideo">
	<!--<div class="video" style="padding-bottom: 20%;">
       
        </div>-->
        </div>
        <div class="liveRedes">
            <ul>
                <ul>
                    <li class="soloaudioli soloaudioliHead"><a id="btn-svivo" href="#"><img src="/export/sites/telesur/arte/ico-en-vivo.png" width="18" height="18" alt=""></a> <span id="tit-svivo">Señal en Vivo</span></li>
                    <li class="soloaudioli soloaudioliHead"><a  id="btn-saudio" href="#"><img src="/arte/AUDIO_.png" width="18" height="18" alt=""></a> <span id="tit-saudio">Solo Audio</span></li>
                </ul>
                <li><a onclick="NewWindow('https://plus.google.com/share?url=http://goo.gl/13O8rM', 'playerrr', '600', '600', 'no');
                        return false;" href='#.' style="text-align:right"><cms:img src="/arte/ico-google.png" height="18" scaleType="2" alt="google plus" /></a></li>
                <li><a onclick="NewWindow('http://www.facebook.com/sharer.php?u=http://goo.gl/13O8rM&text=Conectate a teleSUR en streaming', 'playerrr', '600', '600', 'no');
                        return false;" href='#.'><cms:img src="/arte/ico-facebook.png" height="18" scaleType="2" alt="facebook" /></a></li>
                <li><a onclick="NewWindow('http://twitter.com/share?url=http://goo.gl/13O8rM&text=Conectate a teleSUR en streaming', 'playerrr', '600', '600', 'no');
                        return false;" href='#.' ><cms:img src="/arte/ico-twitter.png" height="18" scaleType="2" alt="twitter" /></a></li>
            </ul>
        </div>
    </div>
</div>