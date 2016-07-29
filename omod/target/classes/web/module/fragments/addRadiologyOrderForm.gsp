
<script type="text/javascript">
	function onQuestionSelect(concept) {
		$j("#conceptDescription").show();
		$j("#conceptDescription").html(concept.description);
	}
</script>

  




  <span>
        <select name="modalityConceptName" id="modalityConceptName" onchange="selectFunction(this.value)">
             <option name="modalityConceptName" selected="selected" value="modalityName">Select One</option>
           <% modalityConceptNameList.each { modalityName -> %>
                <option name="modalityConceptName" value="$modalityName">${modalityName}</option>
            <% } %>
        </select>        
        </span>


