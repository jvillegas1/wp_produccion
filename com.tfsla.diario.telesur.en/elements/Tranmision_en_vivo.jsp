<%
boolean useStreamingPpal = false;
String urlStreaming = null;

if (useStreamingPpal) {
   
     urlStreaming = "http://mbliveec.telesur.ultrabase.net/";
} else {
 
     urlStreaming = "http://mbliveecbackup.telesur.ultrabase.net/";
}
%>


    <table width="900" height="500" border="0" align="center" cellpadding="0" cellspacing="0" > 
        <tr>
            <td  width="358" rowspan="3"> </td>
             <td  height="90" width="548"> </td>   
            
         </tr>
         <tr> 
           	<td height="330" width="521">
             			
             			<!--<iframe  align="left" width="501" height="318" scrolling="no" style="margin-left: 5px; margin-top: 20px" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="http://mblive.telesur.ultrabase.net/"></iframe>-->
             			<iframe  align="left" width="495" height="480" scrolling="no" style="margin-left: 5px; margin-top: -18px" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" allowfullscreen="" id="envivoid" name="envivo" src="<%=urlStreaming%>"></iframe>
            
            		</td>
          </tr>
          <tr>
          <td height="80" width="548"> </td>
          </tr>  		
         
    </table>