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




<div id="content1" class="container">
        <select name="performedStatuses" id="selectlabtest1" onchange="selectFunction(this.value)">
            <option name="performedStatuses" value="COMPLETED">COMPLETED</option>
           <% performedStatuses.each { performedStatuses -> %>
                <option name="performedStatuses" value="$performedStatuses">${performedStatuses.value}</option>
            <% } %>
        </select>
     
</div>

 <option name="performedStatuses" value="COMPLETED">COMPLETED</option>
           <% performedStatuses.each { performedStatuses -> %>
                <option name="performedStatuses" value="$performedStatuses">${performedStatuses.value}</option>
            <% } %>




