jQuery(document).ready(function($){
    //Call actions player
    function callPlayer(frame_id, func, args) {
        if (window.jQuery && frame_id instanceof jQuery) frame_id = frame_id.get(0).id;
        var iframe = document.getElementById(frame_id);
        if (iframe && iframe.tagName.toUpperCase() != 'IFRAME') {
            iframe = iframe.getElementsByTagName('iframe')[0];
        }
        if (iframe) {
            // Frame exists, 
            iframe.contentWindow.postMessage(JSON.stringify({
                "event": "command",
                "func": func,
                "args": args || [],
                "id": frame_id
            }), "*");
        }
    }


    //Once
    $('iframe').each(function(i) {
        //add name
       // console.log(i);


        $(this).attr('id', (i+1));
        //enable API js
        //***********   falta si ya tiene ?  *************//
        var numsrc = $(this).attr('src');

//console.log(numsrc);


pat = /www.youtube.com/

//alert(pat.test(numsrc)) //cadena a buscar

valnumsrc = pat.test(numsrc);

//console.log(valnumsrc);

       if (valnumsrc) {
         console.log("entro aqui");
         var existe = numsrc.indexOf("?enablejsapi=1");
        if(existe==-1){        
            var res = numsrc.replace(numsrc, numsrc+"?enablejsapi=1");
            $(this).attr('src', res);
        }
        };


        
    });

    //On scroll
    $(window).scroll(function(){
            
        $('iframe').is(function() {
            var viwewing =  $(this).visible();
            var numvalue = $(this).attr('id');
            var numsrc = $(this).attr('src');
                    
            //si es el ID visible
            if(viwewing){ 
                callPlayer( numvalue,"playVideo");               
             }

             //pausa todos los videos
             else{
                callPlayer( numvalue,"pauseVideo");
                //callPlayer( numvalue,"mute");
             }
        });  
    })
})