<%@ include file="TS_Common_Libraries.jsp" %>


<nt:news>
    <% String width = "600";
        String height = "340";
        int contadorVideo = 0;
    %>
    <nt:conditional-include oncondition="${news.sectionname == 'imreporter'}">
        <%
            width = "540";
            height = "304";
        %>
    </nt:conditional-include>	





        <nt:preview-image>
            <div itemscope class=".itemscope" itemtype="http://schema.org/ImageObject">				
                <c:set var="imageDescription" scope="page"><nt:image-description/></c:set>
                <c:set var="imageSource" scope="page"><nt:image-source/></c:set>    
                <nt:conditional-include oncondition="${(imageDescription != '') && (imageSource != '')}">					
                    <c:set var="imageFull" scope="page"><nt:image-path/></c:set>
                    <c:set var="imageDescriptionContent" scope="page"><nt:image-description/> | Foto: <nt:image-source/></c:set>
                </nt:conditional-include>
                <nt:conditional-include oncondition="${(imageDescription != '') && (imageSource == '')}">					
                    <c:set var="imageFull" scope="page"><nt:image-path/></c:set>
                    <c:set var="imageDescriptionContent" scope="page"><nt:image-description/></c:set>
                </nt:conditional-include>
                <nt:conditional-include oncondition="${(imageDescription == '') && (imageSource != '')}">
                    <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                    <c:set var="imageDescriptionContent" scope="page"><nt:image-description/> | Foto: <nt:image-source/></c:set>
                    <c:set var="imageFull" scope="page"><nt:image-path/></c:set>
                </nt:conditional-include>
                <nt:conditional-include oncondition="${(imageDescription == '') && (imageSource == '')}">
                    <meta itemprop="description" content='${news.titles[news.titleDetailNum]}'>
                    <c:set var="imageFull" scope="page"><nt:image-path/></c:set>
                </nt:conditional-include>	
            </div>
        </nt:preview-image> 


                    <div class="image1" style="background: url(${imageFull}) 50% 0 no-repeat fixed;">

        <h1 class="tith2">${news.titles[news.titleDetailNum]}</h1>
        
    </div>
</nt:news>
<script type="text/javascript">
    $(window).load(function () {
        //error
        $('.prev, .next').removeAttr('style');
    });

    function StopVideos() {
        var YTid;
        $(".iframeYT").each(function () {
            YTid = $(this).attr("id");
            $('#' + YTid)[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
            //YTid.stopVideo();
        });
    <%--jwplayer().stop();--%>
    }

    $(document).ready(function () {
        $("body").on("click", ".flex-next,.flex-prev", function () {
            StopVideos();
        });
    });
</script>