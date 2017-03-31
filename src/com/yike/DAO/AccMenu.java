package com.yike.DAO;

import java.util.List;

public class AccMenu {
	String success;
	List<AccFSW> accordions;
	String message;
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public List<AccFSW> getAccordions() {
		return accordions;
	}
	public void setAccordions(List<AccFSW> accordions) {
		this.accordions = accordions;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public AccMenu(String success, List<AccFSW> accordions, String message) {
		super();
		this.success = success;
		this.accordions = accordions;
		this.message = message;
	}
	
}
