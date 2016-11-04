$(".click-embed").click(function () {
    var elemEmbed = $(this).attr('id').trim();
    $("." + elemEmbed).select();
    return false;
});
function openVentana(id) {
    var id = id;
    $("." + id).slideDown(600);
}
function closeVentana(id) {
    var id = id;
    $("." + id).slideUp("fast");
    var iframe = "." + id + " " + "iframe";
    jQuery(iframe).attr("src", jQuery(iframe).attr("src"));
    jwplayer().stop();
}
//Funcion para boton de play en listado de audio

//primer click
$(document).ready(function () {
    $('.button-play').toggle(
            function () {
                var elem = $(this).attr('id').trim();
                var repro = "audio" + elem;
                $("." + elem).slideDown();
                $(this).empty();
                $(this).append("<img id='theImg' title='Pause' src='/arte/pause-ico.png'/>");
                jwplayer(repro).play();
            },
// Segundo click
            function () {
                var elem = $(this).attr('id').trim();
                var repro = "audio" + elem;
                $("." + elem).slideUp();
                $(this).empty();
                $(this).append("<img id='theImg' title='Play' src='/arte/play-ico.png'/>");
                jwplayer(repro).stop();
            }
    );
});

//    limpiar cache de addthis
if (window.addthis) {
    window.addthis = null;
    window._adr = null;
    window._atc = null;
    window._atd = null;
    window._ate = null;
    window._atr = null;
    window._atw = null;
}
var uniqueUrl = "http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5526cf6d4144ea13";
$.getScript(uniqueUrl)
        .done(function (script) {
            addthis.init();
        });
