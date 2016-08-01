
  
<% ui.includeCss("radiology", "addRadiologyOrderForm.css") %>

<script>
    
  jq = jQuery;
    
    
function autoCompleteStudy(study){
 var list = study.split(',');
    console.log(list);
    jq("#studyname").autocomplete({
       source : list
    });
}



</script>
<script>
    
  jq = jQuery;
    
    
function autoCompleteDiagnosis(diagnosis){
 var list = diagnosis.split(',');
    console.log(list);
    jq("#diagnosisname").autocomplete({
       source : list
    });
}



</script>
<script>
jq = jQuery;
  jq(document).ready(function() {
  jq("#dd").hide();
  
jq("#copyBtn").click(function(){
jq("#dd").show();

alert("HDSDS");
 


});
  



});

   function selectFunctiont(cat) {
alert("dasadasdadd"+cat);

var text = jq('#diagnosisname');
        text.val(cat);
}



</script>

 <div class="fields"><label>Modality </label>
  <span>
        <select name="modalityConceptName" id="modalityConceptName" onchange="selectFunction(this.value)">
             <option name="modalityConceptName" selected="selected" value="modalityName">Select One</option>
           <% modalityConceptNameList.each { modalityName -> %>
                <option name="modalityConceptName" value="$modalityName">${modalityName}</option>
            <% } %>
        </select>        
        </span>
</div>

 <div class="fields"><label>Study </label>
<input id="studyname" type="text" autocomplete="on" oninput="autoCompleteStudy('${studyConceptNameList}')" name="studyname"/>
</div>


 <div class="fields"><label>Diagnosis </label>
<input id="diagnosisname" type="text" autocomplete="on" oninput="autoCompleteDiagnosis('${diagnosislist}')" name="diagnosisname"/>
<input id="copyBtn" type="button" value="?" />


<select name="dd" id="dd" onchange="selectFunctiont(this.value)">
             <option name="ee" selected="selected" value="modalityName">Select One</option>
           <% diagnosislist.each { diagnosislist -> %>
                <option name="dd" value="$diagnosislist">${diagnosislist}</option>
            <% } %>
        </select>  
 </div>


 <div class="fields"><label>Instruction </label>

<input id="orderInstruction" type="text" name="orderInstruction"/>

</div>




 <div class="fields"><label>Priority </label>
  <span>
        <select name="priority" id="priority" onchange="selectFunction(this.value)">
             <option name="priority" selected="selected" value="priority">Select One</option>
           <% urgencies.each { urgencies -> %>
                <option name="priority" value="$urgencies">${urgencies}</option>
            <% } %>
        </select>        
        </span>
</div>





