<%@ include file="TS_Common_Libraries.jsp" %>
<link href="<cms:link>../resources/css/dinamico.css</cms:link>" rel="stylesheet" type="text/css" />
<!-- descomentar para usar estilos cuando sea banner 950x90
<div class="banners pos1" style="margin: 0px 0 25px 5px;float:left">
-->

<!-- para banner 728x90-->
<div class="banners pos1" style="margin: 0px 119px 25px;"> 
    <a target="_blank" href="http://www.telesurtv.net/multimedia/Gira-del-Papa-Francisco-por-Latinoamerica-20150618-0046.html">
        <div id="cintillo-728">
            <div class="texto-2" style="color:#ffffff; text-decoration:initial;">


                <SCRIPT languaje="javascript">


                    //cambiar el texto
                    var before = ""
                    var current = ""

                    var montharray = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

                    function countdown(yr, m, d) {
                        var today = new Date()
                        var todayy = today.getYear()
                        if (todayy < 1000)
                            todayy += 1900
                        var todaym = today.getMonth()
                        var todayd = today.getDate()
                        var todaystring = montharray[todaym] + " " + todayd + ", " + todayy
                        var futurestring = montharray[m - 1] + " " + d + ", " + yr
                        var difference = (Math.round((Date.parse(futurestring) - Date.parse(todaystring)) / (24 * 60 * 60 * 1000)) * 1)
                        if (difference == 0)
                            document.write(current)
                        else if (difference > 0)
                            document.write("Sólo faltan " + difference + " días " + before + "</br>para la llegada a Bolivia")
                    }

                    //cambiar la fecha (AAAA-MM-DD)
                    countdown(2015, 07, 08)
                </SCRIPT>

                <div class="imagen">
                    <img src="<cms:link>/arte/gira-del-papa/bolivia.png</cms:link>">
                </div>

            </div>
        </div>
    </a>
</div>