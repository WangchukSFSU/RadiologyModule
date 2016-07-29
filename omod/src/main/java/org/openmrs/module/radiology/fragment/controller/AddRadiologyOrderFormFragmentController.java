/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.fragment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.openmrs.Concept;
import org.openmrs.ConceptName;
import org.openmrs.Order;
import org.openmrs.api.context.Context;
import org.openmrs.module.radiology.PerformedProcedureStepStatus;
import org.openmrs.module.radiology.RadiologyModalityList;
import org.openmrs.module.radiology.RadiologyOrder;
import org.openmrs.module.radiology.RadiologyService;
import org.openmrs.module.radiology.ScheduledProcedureStepStatus;
import org.openmrs.module.radiology.Study;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author youdon
 */
public class AddRadiologyOrderFormFragmentController {
	
	// static final String RADIOLOGY_ORDER_FORM_VIEW = "/module/radiology/addRadiologyOrderForm";
	
	public void controller(FragmentModel model) {
		
		System.out.println("AddRadiologyOrderFormFragmentController");
		// ModelAndView modelAndView = new ModelAndView(RADIOLOGY_ORDER_FORM_VIEW);
		
		if (Context.isAuthenticated()) {
			model.addAttribute("order", new Order());
			final RadiologyOrder radiologyOrder = new RadiologyOrder();
			radiologyOrder.setStudy(new Study());
			model.addAttribute("radiologyOrder", radiologyOrder);
		}
		
		// return modelAndView;
	}
	
}
