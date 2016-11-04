<%
boolean useStreamingPpal = true;
String urlStreaming = null;

if (useStreamingPpal) {
   
     urlStreaming = "http://mblivealterna.telesur.ultrabase.net/";
} else {
  
     urlStreaming = "http://mbliveocasional.telesur.ultrabase.net/"; 
}
%>


    <table width="900" height="500" border="0" align="center" cellpadding="0" cellspacing="0" > 
        <tr>
            <td  width="358" rowspan="3"> </td>
             <td  height="40" width="548"> </td>   
            
         </tr>
         <tr> 
           	<td height="300" width="300">
            			<iframe width="95%" height="525" align="middle" frameborder="0" mozallowfullscreen="" webkitallowfullscreen="" scrolling="no" allowfullscreen="" id="envivoid" name="envivo" src="<%= urlStreaming%>" style="margin-top: 20px; margin-left: -4px;"></iframe>
            
            		</td>
          </tr>
          <tr>
          <td height="66" width="548"> </td>
          </tr>  		
         
    </table>