

jQuery.fn.GetRelacionadasHorizontal = function(){
	
	var feed 	= "http://www.telesurtv.net/english/rss/Rss_ByTags.xml?tag=colombia"
	var $ASIDE	= "";
	var i = 0;

	
	 $.ajax(feed, {
      accepts:{
        xml:"application/rss+xml"
      },
      dataType:"xml",
      success:function(data) {
            $(data).find("item").each(function () { // or "item" or whatever suits your feed
              i++;
              if(i>3){
                return false
              }
              var el = $(this);
              $ASIDE += "<div class='col-xs-12 col-sm-4 col-lg-4 col_sin'>";
              $ASIDE += '<article>';
              $ASIDE += "<h1><a href='"+ el.find("link").text()+"' target='_blank'>"+ el.find("title").text()+"</a></h1>";
              $ASIDE += "<p>"+ el.find("description").text()+"</p>";
              $ASIDE += '</article>';
              $ASIDE += '</div>';

            });
            $("#relacionados").append($ASIDE);

          }   
        });
	
}//END GetRelacionadasHorizontal 
	

jQuery.fn.GetRelacionadasVertical = function(){
	
	
	var feed 	= "http://www.telesurtv.net/english/rss/Rss_ByTags.xml?tag=colombia"
	var $ASIDE	= "";
	var i =0;

	
	 $.ajax(feed, {
      accepts:{
        xml:"application/rss+xml"
      },
      dataType:"xml",
      success:function(data) {
            $(data).find("item").each(function () { // or "item" or whatever suits your feed
              i++;
              if(i>3){
                return false
              }
              var el = $(this);
              $ASIDE += '<article>';
              $ASIDE += "<h1><a href='"+ el.find("link").text()+"' target='_blank'>"+ el.find("title").text()+"</a></h1>";
              $ASIDE += "<p>"+ el.find("description").text()+"</p>";
              $ASIDE += '</article>';

            });
            $("#relacionados").append($ASIDE);

          }   
        });
	
}

//END GetRelacionadasVertical