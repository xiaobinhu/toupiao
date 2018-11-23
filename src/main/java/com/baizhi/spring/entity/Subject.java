package com.baizhi.spring.entity;

public class Subject {
	private int vs_id;
	private String vs_title;
	private int vs_type;
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Subject(int vs_id, String vs_title, int vs_type) {
		super();
		this.vs_id = vs_id;
		this.vs_title = vs_title;
		this.vs_type = vs_type;
	}
	public Subject(String vs_title, int vs_type) {
		super();
		this.vs_title = vs_title;
		this.vs_type = vs_type;
	}
	public int getVs_id() {
		return vs_id;
	}
	public void setVs_id(int vs_id) {
		this.vs_id = vs_id;
	}
	public String getVs_title() {
		return vs_title;
	}
	public void setVs_title(String vs_title) {
		this.vs_title = vs_title;
	}
	public int getVs_type() {
		return vs_type;
	}
	public void setVs_type(int vs_type) {
		this.vs_type = vs_type;
	}
	@Override
	public String toString() {
		return "Subject [vs_id=" + vs_id + ", vs_title=" + vs_title
				+ ", vs_type=" + vs_type + "]";
	}
	
	
	
}
