

<%
 ui.decorateWith("appui", "standardEmrPage")

ui.includeJavascript("uicommons", "datatables/jquery.dataTables.min.js")
ui.includeCss("uicommons", "datatables/dataTables_jui.css")
%>

<script type="text/javascript">
   var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.escapeJs(patient.familyName + ', ' + patient.givenName ) }" , link: '${ui.escapeJs(returnUrl)}'},
         { label: "RadiologyOrder" }
  
    ];
var ret = "${returnUrl}";
var x = 1;
</script>

<script>
        jq = jQuery;
    jq(document).ready(function() {
    
    jq("#AddRadiologyOrderForm").hide();
    
 jq("#addRadiologyOrderBtn").click(function(){
     jq("#performedStatusCompletedOrder").hide();
    jq("#AddRadiologyOrderForm").show();
});
 
 
  
    
    });
    
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
        
<span class="right"><button type="button" id="addRadiologyOrderBtn">Add Radiology Order</button></span>
<span class="right"><button type="button">Message Patient</button></span>

</div>


<div id="performedStatusCompletedOrder">
    ${ ui.includeFragment("radiology", "performedStatusCompletedOrder") }
    
    </div>
    
    
    <div id="AddRadiologyOrderForm">
    ${ ui.includeFragment("radiology", "addRadiologyOrderForm") }
    
    </div>
    
    