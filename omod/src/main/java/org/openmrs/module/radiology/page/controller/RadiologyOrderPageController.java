/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.page.controller;

import java.util.HashMap;
import java.util.Map;
import org.openmrs.module.radiology.PerformedProcedureStepStatus;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

public class RadiologyOrderPageController {
	
	public void controller(PageModel model, @RequestParam(value = "returnUrl", required = false) String returnUrl,
			@RequestParam(value = "patientId", required = false) String page) {
		
		Map<String, String> performedStatuses = new HashMap<String, String>();
		
		for (PerformedProcedureStepStatus performedStatus : PerformedProcedureStepStatus.values()) {
			performedStatuses.put(performedStatus.name(), performedStatus.name());
			System.out.println("list performned status " + performedStatus.name());
		}
		
		model.addAttribute("returnUrl", returnUrl);
		model.addAttribute("performedStatuses", performedStatuses);
		
	}
	
	@ModelAttribute("performedStatusest")
	private Map<String, String> getPerformedStatusList() {
		
		final Map<String, String> performedStatusest = new HashMap<String, String>();
		performedStatusest.put("", "Select");
		
		for (PerformedProcedureStepStatus performedStatus : PerformedProcedureStepStatus.values()) {
			performedStatusest.put(performedStatus.name(), performedStatus.name());
		}
		
		return performedStatusest;
	}
	
}
