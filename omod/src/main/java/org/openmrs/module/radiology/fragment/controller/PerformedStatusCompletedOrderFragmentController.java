/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology.fragment.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import org.openmrs.Concept;
import org.openmrs.ConceptName;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.radiology.RadiologyOrder;
import org.openmrs.module.radiology.RadiologyService;
import org.openmrs.module.radiology.Study;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author youdon
 */
public class PerformedStatusCompletedOrderFragmentController {
	
	public void controller(@RequestParam("patientId") Patient patient, FragmentModel model,
			@RequestParam(value = "returnUrl", required = false) String returnUrl) {
		
		System.out.println("PPPPPPP " + patient);
		
		List<RadiologyOrder> radiologyOrders = getCompletedRadiologyOrdersByPatient(patient);
		
		ArrayList<ConceptName> conceptStudy = new ArrayList();
		ArrayList<Date> dateCreated = new ArrayList();
		
		/*
		 * for (RadiologyOrder radiologyorder : radiologyOrders) {
		 * ConceptName studyConceptName = Context.getConceptService()
		 * .getConcept(radiologyorder.getConcept()
		 * .getConceptId())
		 * .getName();
		 * conceptStudy.add(studyConceptName);
		 * dateCreated.add(radiologyorder.getDateCreated());
		 * radiologyorder.getDateCreated();
		 * System.out.println("PPPPPPLLLLLLLLLLLLLLLLLP " + radiologyorder.getConcept());
		 * }
		 */
		
		model.put("radiologyOrders", radiologyOrders);
		
		model.addAttribute("patient", patient);
		model.addAttribute("returnUrl", returnUrl);
		
	}
	
	public List<RadiologyOrder> getCompletedRadiologyOrdersByPatient(Patient p) {
		System.out.println("getLabOrdersByPatient");
		Vector<RadiologyOrder> radiologyOrders = new Vector<RadiologyOrder>();
		
		List<Order> orders = Context.getOrderService()
				.getAllOrdersByPatient(p);
		
		int testOrderTypeId = Context.getOrderService()
				.getOrderTypeByName("Radiology Order")
				.getOrderTypeId();
		
		RadiologyOrder radiologyOrder;
		for (Order order : orders) {
			// if (order.getOrderType().getOrderTypeId() == 3) { OrderType ot = new OrderType();
			if (order.getOrderType()
					.getOrderTypeId() == testOrderTypeId) {
				
				radiologyOrder = Context.getService(RadiologyService.class)
						.getRadiologyOrderByOrderId(order.getOrderId());
				
				if (radiologyOrder.isCompleted()) {
					radiologyOrders.add(radiologyOrder);
					
				}
				
			}
		}
		return radiologyOrders;
	}
	
}
