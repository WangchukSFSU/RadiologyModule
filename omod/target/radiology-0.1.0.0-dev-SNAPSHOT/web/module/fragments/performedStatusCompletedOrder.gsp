
    




<% radiologyOrders.each { mm -> %>
           
                <p id="modlist" name ="modlist"  >  ${ mm.study.studyname } 
                 </p>
            <br>
            <% } %>
            
            
            
        <h1>COMPLETED RADIOLOGY ORDERS</h1>


 <table id="labTablee" border="1" class="display" cellspacing="0" width="50%">
<thead>
                <tr>
                    <th>Order</th>
                    <th>OrderStartDate</th>
                    <th>DatePictureTaken</th>
                </tr>
</thead>
<tbody>
 <% radiologyOrders.each { anOrder -> %>
 
<tr>
<td>

orderid#${anOrder.orderId},
 ${anOrder.patient}
 ${anOrder.study.studyname}
 
</td>

<td>
  ${ anOrder.dateCreated } 
</td>
<td>
   ${anOrder.instructions}
</td>
</tr>
    <% } %>  

</tbody>     
            </table>
            
            
            
        