<%@ include file="TS_Common_Libraries.jsp" %>
<%@ include file="webusers/TS_RecoverySession.jsp" %>
<%@ page import="com.tfsla.diario.comentarios.services.CommentsModule" %>
<%@ page import="com.tfsla.diario.ediciones.model.TipoEdicion" %>
<%@ page import="com.tfsla.diario.ediciones.services.TipoEdicionBaseService" %>

<%
    org.opencms.jsp.CmsJspXmlContentBean cms = new org.opencms.jsp.CmsJspXmlContentBean(pageContext, request, response);
    Boolean guestCanComment = CommentsModule.getInstance(cms.getCmsObject()).getGuestComments();

    String publicationId = "1";
    String publicationUrl = "";
    TipoEdicionBaseService tService = new TipoEdicionBaseService();
    try {
        TipoEdicion tEdicion = tService.obtenerTipoEdicion(cms.getCmsObject(), cms.getCmsObject().getRequestContext().getUri());
        if (tEdicion != null) {
            publicationId = "" + tEdicion.getId();
            publicationUrl = tEdicion.getNombre();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<link rel="stylesheet" href="/system/modules/com.tfsla.diario.telesur/resources/css/navigataur.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1103464276336828',
      xfbml      : true,
      version    : 'v2.3'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>


<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=1103464276336828";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<script>
    $(document).ready(function () {
        $("#comentNativos").addClass("coment");
        $("#btn-face").addClass("activeComent");

        $("#btn-cf").click(function () {
            // alert("btn-facebook");
            $("#comentNativos").addClass("coment");
            $("#btn-face").addClass("activeComent");
            $(".fb_ltr").css({width: "940px"});
            $("#comentFace").removeClass("coment");
            $("#btn-nativo").removeClass("activeComent");


        });
        $("#btn-cn").click(function () {
            // alert("btn-nativo");
            $("#comentFace").addClass("coment");
            $("#comentNativos").removeClass("coment");
            $("#btn-nativo").addClass("activeComent");
            $("#btn-face").removeClass("activeComent");
        });
    });
</script>



<div class="contner">
    <div class="clearfix">
        <nt:news>
            <div class="nav">
                <input type="checkbox" id="toggle" />
                <label for="toggle" class="toggle" onclick></label>
                <ul class="menu">
                    <li id="btn-face" class="">
                        <a id="btn-cf" href="#.">
                            <span class="icofb"> </span>
                            Comment on facebook   (<span class="fb-comments-count" data-href="http://www.telesurtv.net<nt:link/>"></span>)</a>
                    </li>
                    <li id="btn-nativo" class="">
                        <a id="btn-cn" href="#.">
                            <span class="icots"> </span>
                           Comment on teleSUR (${news.commentcount})</a>
                    </li>		
                </ul>

            </div><!-- End of Navigation -->

    </div><!-- End of Header -->
    <div class="comentArtic">
        <div id="comentFace">
            <div class="wrapper">
                </br> 
                <div class="row clear"> 
                    <div class="fb-comments" data-href="http://www.telesurtv.net<nt:link/>" data-width="940" data-numposts="10" data-colorscheme="light"></div>             
                </div>
                </nt:news>
            </div>
        </div>
        <div id="comentNativos"> 

            <nt:news>
                <nt:conditional-include oncondition="${news.hideComments == 'false' }">			
                    <!--comment-->
                    <div class="wrapper">
                        <div class="row clear">
                            <div class="col">
                                <div class=""></div>
                                <div style="margin:30px 0"></div>                
                                <div class="col" >
                                    <div class="cont">
                                        <div class="comsup">
                                            <div class="titcomment">
                                                <div class="titlecom" id="comentarios">Comment</div>
                                                <div class="gblogrs">
                                                    <div class="num">${news.commentcount}</div>
                                                    <cms:img src="/arte/globe-red.png" width="31" height="27" alt="Comments" title="Comments"/>
                                                </div>	                                    
                                            </div>
                                            <% if ((guestCanComment && !userIsLoggedIn) || userIsLoggedIn) { %>

                                            <nt:comments-form style="TS-EN" lazyload="true" />	

                                            <% } else {%>        

                                            <div class="signin desktop">
                                                <p>Sign In or Register to leave a comment, use the forums and more</p>
                                                <div class="btnConf"> 
                                                    <a href="<cms:link>/english/users/login_native.html</cms:link>?R=<nt:link/>" alt="Sign In" title="Sign In">Sign In</a> 
                                                    <a href="<cms:link>/english/users/register.html</cms:link>" alt="Register" title="Register">Register</a> 
                                                </div>
                                                <div class="LogRedes">
                                                    <p>Or log in with:</p>
                                                    <a class="icoleft" href="javascript:openPopUpProviderWithRedirect('twitter', false, '<nt:link/>', '<%=publicationId%>', '<%=publicationUrl%>' );">
                                                        <cms:img width="43" height="35" alt="Login con Twitter" title="Login con Twitter" src="/arte/twitblue.png" scaleColor="transparent" />
                                                    </a>
                                                    <a class="icoleft" href="javascript:openPopUpProviderWithRedirect('facebook', false, '<nt:link/>', '<%=publicationId%>', '<%=publicationUrl%>' );">
                                                        <cms:img width="43" height="35" alt="Login con Facebook" title="Login con Facebook" src="/arte/fbblue.png" scaleColor="transparent" />
                                                    </a>
                                                    <a class="icoleft" href="javascript:openPopUpProviderWithRedirect('googlePlus', false, '<nt:link/>', '<%=publicationId%>', '<%=publicationUrl%>' );">
                                                        <cms:img width="35" height="35" alt="Login con Google +" title="Login con Google +" src="/arte/googleblue.jpg" scaleColor="transparent" />
                                                    </a>				
                                                </div>
                                                <div class="clear"></div>
                                            </div>

                                            <% } %>

                                            <nt:conditional-include oncondition="${news.commentcount > 0}">
                                                <div class="orderblog"> Order by  
                                                    <ul class="idTabs"> 
                                                        <li><a href="#newest">Newest First</a></li>
                                                        <li>|</li> 
                                                        <li><a href="#oldest">Popular First</a></li>
                                                    </ul>			                    	
                                                </div>

                                                <div class="clear"></div>

                                                <div class="postlist" id="newest">        	                            
                                                    <nt:comments-box style="TS-EN" withMoreAnswers="false" minAnswers="0"/>
                                                </div>
                                                <div class="postlist" id="oldest">
                                                    <% int countComment = 0; %>
                                                    <nt:comments-list page="" url="${param.path}"  withMoreAnswers="true" minAnswers="2">
                                                        <% countComment++; %>
                                                    </nt:comments-list>
                                                    <% if (countComment == 0) { %>
                                                    <div class="row clear">
                                                        <div class="col">
                                                            <div style="margin:30px 0"></div>                
                                                            <div class="col">	                    
                                                                <div class="cont">
                                                                    <div class="fraseComment">Post with no popular comments.</div>
                                                                </div>        
                                                            </div>		    			
                                                        </div>
                                                    </div>
                                                    <% } else { %>	
                                                    <nt:comments-box style="TS-EN" withMoreAnswers="true" minAnswers="2"/>
                                                    <% }%>		
                                                </div>
                                            </nt:conditional-include>

                                            <nt:conditional-include oncondition="${news.commentcount == 0}">
                                                <div class="row clear">
                                                    <div class="col">
                                                        <div style="margin:30px 0"></div>                
                                                        <div class="col">	                    
                                                            <div class="cont">
                                                                <div class="fraseComment">Post with no comments.</div>
                                                            </div>        
                                                        </div>		    			
                                                    </div>
                                                </div>		
                                            </nt:conditional-include>	                            	
                                        </div>
                                    </div>        
                                </div>	    			
                            </div>
                        </div>
                    </div>    
                     <a name="comsup"> </a> 
                    <!--FIN comment-->	    
                </nt:conditional-include> 

                <nt:conditional-include oncondition="${news.hideComments != 'false' }">
                    <!--comment-->
                    <div class="wrapper">
                        <div class="row clear">
                            <div class="col">
                                <div class="separador"></div>
                                <div style="margin:30px 0"></div>                
                                <div class="col">	                    
                                    <div class="cont">
                                        <div class="fraseComment">
                                            Comments are disabled in this post.
                                        </div>
                                    </div>        
                                </div>		    			
                            </div>
                        </div>
                    </div>    
                    <!--FIN comment-->	
                </nt:conditional-include>  
            </nt:news>
        </div>
        
    </div>
</div><!-- End of Container -->