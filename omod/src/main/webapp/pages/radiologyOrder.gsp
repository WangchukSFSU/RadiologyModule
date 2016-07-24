<%
 ui.decorateWith("appui", "standardEmrPage")

ui.includeJavascript("uicommons", "datatables/jquery.dataTables.min.js")
ui.includeCss("uicommons", "datatables/dataTables_jui.css")
%>

<script type="text/javascript">
   var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.escapeJs(patient.familyName + ', ' + patient.givenName ) }" , link: '${ui.escapeJs(returnUrl)}'},
        { label: "RadiologyOrder"}
    ];
var ret = "${returnUrl}";
var x = 1;
</script>

<div>
<div id="performedStatusesDropdown" class="performedStatusesContainer">
    <span>
        <select name="performedStatuses" id="performedStatuses" onchange="selectFunction(this.value)">
             <option name="performedStatuses" selected="selected" value="COMPLETED">COMPLETED</option>
           <% performedStatuses.each { performedStatuses -> %>
                <option name="performedStatuses" value="$performedStatuses">${performedStatuses.value}</option>
            <% } %>
        </select>        
        </span>
        
<span class="right"><button type="button">Add Radiology Order</button></span>
<span class="right"><button type="button">Message Patient</button></span>
     
</div>


<table>
  <tr>
    <th>Order</th>
    <th>OrderStartDate</th>
    <th>DateStudyTaken</th>
  </tr>
  <tr>
    
  </tr>
 <c:forEach items="${performedStatusest}" var="address">
  <tr>
   <td><c:out value="${address.value}" /></td>
   herkwrweerwerwerewerwdasdsadsasdasdasdad
  </tr>
 </c:forEach>
    

  
</table>


