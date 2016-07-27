/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.radiology;

import java.io.Serializable;

import org.openmrs.BaseOpenmrsObject;

/**
 * @author youdon
 */

public class RadiologyModalityList extends BaseOpenmrsObject implements Serializable {
	
	private Integer id;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return id;
	}
	
	private Integer modalityId;
	
	public void setModalityId(Integer modalityId) {
		this.modalityId = modalityId;
	}
	
	public Integer getModalityId() {
		return modalityId;
	}
	
}
