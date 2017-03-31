package com.yike.DAO;

public class AccSMenu {
	private Boolean success;
	private AccBase menu;
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public AccBase getMenu() {
		return menu;
	}
	public void setMenu(AccBase menu) {
		this.menu = menu;
	}
	public AccSMenu(Boolean success, AccBase menu) {
		super();
		this.success = success;
		this.menu = menu;
	}
}
