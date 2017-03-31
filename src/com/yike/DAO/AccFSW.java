package com.yike.DAO;

import java.util.List;

public class AccFSW {
	private AccBase accordion;
	private List<AccBase> accordions;
	public List<AccBase> getAccordions() {
		return accordions;
	}
	public void setAccordions(List<AccBase> accordions) {
		this.accordions = accordions;
	}
	public AccBase getAccordion() {
		return accordion;
	}
	public void setAccordion(AccBase accordion) {
		this.accordion = accordion;
	}
	public AccFSW(AccBase accordion, List<AccBase> accordions) {
		super();
		this.accordion = accordion;
		this.accordions = accordions;
	}
}
