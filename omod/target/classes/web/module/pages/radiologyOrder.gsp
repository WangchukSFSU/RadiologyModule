

<%
ui.decorateWith("appui", "standardEmrPage")

ui.includeJavascript("uicommons", "datatables/jquery.dataTables.min.js")
ui.includeCss("uicommons", "datatables/dataTables_jui.css")
%>
<% ui.includeCss("radiology", "radiologyOrder.css") %>
    
<% ui.includeCss("radiology", "performedStatusCompletedOrder.css") %>
   <% ui.includeJavascript("jquery.js") %>
<script type="text/javascript">
    var breadcrumbs = [
    { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.escapeJs(patient.familyName + ', ' + patient.givenName ) }" , link: '${ui.escapeJs(returnUrl)}'},
    { label: "RadiologyOrder" }

    ];
var ret = "${returnUrl}";
    var xxx = 1;
</script>

<script>
    jq = jQuery;
    jq(document).ready(function() { 
    jq("#AddRadiologyOrderForm").hide();
    jq("#EmailForm").hide();
    jq("#performedStatusInProgressOrder").hide();
    jq("#performedStatusCompletedObsSelect").hide();
    
    jq("#performedStatusCompletedOrder").show();
    


    jq("#addRadiologyOrderBtn").click(function(){
    jq("#performedStatusCompletedOrder").hide();
    jq("#EmailForm").hide();
    jq("#performedStatusInProgressOrder").hide();
    jq("#performedStatusCompletedObsSelect").hide();
    
    jq("#AddRadiologyOrderForm").show();
    });

    jq("#emailform").click(function(){
    jq("#performedStatusCompletedOrder").hide();
    jq("#performedStatusInProgressOrder").hide();
    jq("#performedStatusCompletedObsSelect").hide();
    jq("#EmailForm").show();
    jq("#AddRadiologyOrderForm").hide();
    });


    
   jq("#table tr").click(function(){
    jq(this).addClass('selected').siblings().removeClass('selected');    
    var value=jq(this).find('td:first').html();
    alert(value); 
    var splitvalue = value.split(',');
     jq("#performedStatusCompletedObsSelect").show();
     jq("#performedStatusCompletedOrder").hide();
    ordervalue = splitvalue[0];
   
   var orderId = ordervalue.substr(7);

    <% if (radiologyOrders) { %>
   
    <% radiologyOrders.each { anOrder -> %>
    
    var radiologyorderId = ${anOrder.orderId} ;

    if(orderId == radiologyorderId) {
   
    
  jq('#completedOrderObs').append( '<tr><td> Observation </td><td> Study</td><td> Provider</td><td> Instructions </td><td> Diagnosis</td><td> Treatment</td><td> StudyResult</td><td> ContactRadiologist</td></tr>' );
  jq('#completedOrderObs').append( '<tr><td> Observation </td><td> ${anOrder.study.studyname}</td><td> Provider</td><td> ${anOrder.instructions} </td><td> Diagnosis</td><td> Treatment</td><td> StudyResult</td><td> ContactRadiologist</td></tr>' );


    }
    
    

   <% } %>
    <% } %> 
 
    
    });
    
    });




    function selectFunction(selectedValue) {

    if(selectedValue == "COMPLETED") {
  
    jq("#performedStatusCompletedOrder").show(); 
    jq("#EmailForm").hide();
    jq("#performedStatusInProgressOrder").hide();
    jq("#AddRadiologyOrderForm").hide();
    jq("#performedStatusCompletedObsSelect").hide();
    
    }  
   
     if(selectedValue == "IN_PROGRESS") {
    
    jq("#performedStatusCompletedOrder").hide();
    jq("#EmailForm").hide();
    jq("#performedStatusInProgressOrder").show();
    jq("#AddRadiologyOrderForm").hide();
    jq("#performedStatusCompletedObsSelect").hide();
    
    
    alert("jiiii progress" + selectedValue);
    } 
    
    }
</script>

<div>
    <div id="performedStatusesDropdown" class="performedStatusesContainer">
        <span>
            <select name="performedStatuses" id="performedStatuses" onchange="selectFunction(this.value)">
                <option name="performedStatuses" selected="selected" value="${performedStatuses.value}">COMPLETED</option>
                <% performedStatuses.each { performedStatuses -> %>
                <option name="performedStatuses" value="${performedStatuses.value}">${performedStatuses.value}</option>
                <% } %>
            </select>        
        </span>

        <span class="right"><button type="button" id="addRadiologyOrderBtn">Add Radiology Order</button></span>
        <span class="right"><button type="button" id="emailform">Message Patient</button></span>

    </div>


   

     <div id="performedStatusInProgressOrder">
        ${ ui.includeFragment("radiology", "performedStatusInProgressOrder",[ returnUrl: '${returnUrl}',
        patient: '${patient}'
        ]) }

    </div>
    

    <div id="AddRadiologyOrderForm">
        ${ ui.includeFragment("radiology", "addRadiologyOrderForm",[ returnUrl: '${returnUrl}',
        patient: '${patient}'
        ]) }
    </div>



    <div id="EmailForm">
        ${ ui.includeFragment("radiology", "emailform",[ returnUrl: '${returnUrl}',
        patient: '${patient}'
        ]) }
    </div>


    
    <div id="performedStatusCompletedOrder">
  
<h1>COMPLETED RADIOLOGY ORDERS</h1>
<table id="table">
    <thead>
        <tr>
            <th>Order</th>
            <th>OrderStartDate</th>
            <th>DatePictureTaken</th>
        </tr>
    </thead>
    <% radiologyOrders.each { anOrder -> %>
    <tr>
        <td>orderid${anOrder.orderId},
            ${anOrder.patient}
            ${anOrder.study.studyname}</td>
        <td>${ anOrder.dateCreated } </td>
        <td>${anOrder.instructions}</td>

    </tr>
    <% } %>  

</table>
</div>


<div id = "performedStatusCompletedObsSelect">
    
  <h1>COMPLETED RADIOLOGY ORDERS Observation</h1>
  
<table id="completedOrderObs">
   
    

</table>

</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     