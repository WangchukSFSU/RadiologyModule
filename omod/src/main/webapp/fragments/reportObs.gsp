  
        <h1>Report Obs</h1>
  
  <h1>COMPLETED RADIOLOGY ORDERS Observation</h1>
<table id="table">
    
    <% getObs.each { observation -> %>
    <tr>
        <td>${observation.concept.getFullySpecifiedName(Locale.ENGLISH)}</td>
  <td>${observation.valueText}</td>
          
      

    </tr>
    <% } %>  

</table>
       