package com.yike.DAO;

import java.util.List;

public class AccMenuM {
	int total;
	List<AccBase> rows;
	String footer;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public List<AccBase> getRows() {
		return rows;
	}
	public void setRows(List<AccBase> rows) {
		this.rows = rows;
	}
	public String getFooter() {
		return footer;
	}
	public void setFooter(String footer) {
		this.footer = footer;
	}
	public AccMenuM(int total, List<AccBase> rows, String footer) {
		super();
		this.total = total;
		this.rows = rows;
		this.footer = footer;
	}
	
}
