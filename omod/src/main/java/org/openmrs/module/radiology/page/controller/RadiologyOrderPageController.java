/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.page.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.openmrs.ConceptName;
import org.openmrs.api.context.Context;
import org.openmrs.module.radiology.PerformedProcedureStepStatus;
import org.openmrs.module.radiology.RadiologyModalityList;
import org.openmrs.module.radiology.RadiologyProperties;
import org.openmrs.module.radiology.RadiologyService;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public class RadiologyOrderPageController {
	
	@Autowired
	private RadiologyProperties radiologyProperties;
	
	public void controller(PageModel model, @RequestParam(value = "returnUrl", required = false) String returnUrl,
			@RequestParam(value = "patientId", required = false) String page) {
		
		Map<String, String> performedStatuses = new HashMap<String, String>();
		
		for (PerformedProcedureStepStatus performedStatus : PerformedProcedureStepStatus.values()) {
			performedStatuses.put(performedStatus.name(), performedStatus.name());
			System.out.println("list performned status " + performedStatus.name());
		}
		
		RadiologyService radiologyservice = Context.getService(RadiologyService.class);
		
		final List<RadiologyModalityList> modalityListFromDb = radiologyservice.getAllModality();
		
		ArrayList<ConceptName> modalityConceptNameList = new ArrayList();
		
		for (RadiologyModalityList modalityConceptId : modalityListFromDb) {
			
			int modalityConceptIdInteger = modalityConceptId.getModalityId();
			ConceptName modalityConceptName = Context.getConceptService()
					.getConcept(modalityConceptIdInteger)
					.getName();
			modalityConceptNameList.add(modalityConceptName);
			
		}
		
		// RadiologyProperties rd = new RadiologyProperties();
		
		// String radiologyConceptClassNames = radiologyProperties.getRadiologyConceptClassNames();
		
		// System.out.println("JJJJJJJJJJJJJJJJJJJJJJJJJ" + radiologyConceptClassNames);
		
		model.addAttribute("modalityConceptNameList", modalityConceptNameList);
		model.addAttribute("performedStatuses", performedStatuses);
		model.addAttribute("returnUrl", returnUrl);
		// model.addAttribute("radiologyConceptClassNames", radiologyConceptClassNames);
	}
	
	public void getRadiologyOrderForm(FragmentModel model) {
		
		System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFFSADADASDASASD");
		ModelAndView mav = new ModelAndView("radiology/radiologyOrderAll.page");
		System.out.println("ORDER SAVEDCSDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
		
	}
	
}
