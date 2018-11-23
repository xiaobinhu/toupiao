package com.baizhi.spring.entity;

public class Option {
    private int vo_id;
    private int vs_id;
    private String vo_option;
    private int vo_order;
    private int vo_is_delete;
	public Option() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Option(int vs_id, String vo_option, int vo_order, int vo_is_delete) {
		super();
		this.vs_id = vs_id;
		this.vo_option = vo_option;
		this.vo_order = vo_order;
		this.vo_is_delete = vo_is_delete;
	}
	public Option(int vo_id, int vs_id, String vo_option, int vo_order,
			int vo_is_delete) {
		super();
		this.vo_id = vo_id;
		this.vs_id = vs_id;
		this.vo_option = vo_option;
		this.vo_order = vo_order;
		this.vo_is_delete = vo_is_delete;
	}
	@Override
	public String toString() {
		return "Option [vo_id=" + vo_id + ", vs_id=" + vs_id + ", vo_option="
				+ vo_option + ", vo_order=" + vo_order + ", vo_is_delete="
				+ vo_is_delete + "]";
	}
	public int getVo_id() {
		return vo_id;
	}
	public void setVo_id(int vo_id) {
		this.vo_id = vo_id;
	}
	public int getVs_id() {
		return vs_id;
	}
	public void setVs_id(int vs_id) {
		this.vs_id = vs_id;
	}
	public String getVo_option() {
		return vo_option;
	}
	public void setVo_option(String vo_option) {
		this.vo_option = vo_option;
	}
	public int getVo_order() {
		return vo_order;
	}
	public void setVo_order(int vo_order) {
		this.vo_order = vo_order;
	}
	public int getVo_is_delete() {
		return vo_is_delete;
	}
	public void setVo_is_delete(int vo_is_delete) {
		this.vo_is_delete = vo_is_delete;
	}
    
    
    
}
