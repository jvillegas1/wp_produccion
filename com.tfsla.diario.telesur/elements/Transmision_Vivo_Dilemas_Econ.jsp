<%
boolean useStreamingPpal = false;
String urlStreaming = null;

if (useStreamingPpal) {
   
     urlStreaming = "http://mblive.telesur.ultrabase.net/";
} else {
  
     urlStreaming = "http://mblivealterna.telesur.ultrabase.net/"; 
}
%>


    <table width="900" height="500" border="0" align="center" cellpadding="0" cellspacing="0" > 
        <tr>
            <td  width="358" rowspan="3"> </td>
             <td  height="40" width="548"> </td>   
            
         </tr>
         <tr> 
           	<td height="300" width="300">
            			<iframe width="96%" height="388" align="middle" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" scrolling="no" allowfullscreen="" id="envivoid" name="envivo" src="<%= urlStreaming%>" style="margin-top: 34px; margin-left: -17px;"></iframe>
            
            		</td>
          </tr>
          <tr>
          <td height="66" width="548"> </td>
          </tr>  		
         
    </table>