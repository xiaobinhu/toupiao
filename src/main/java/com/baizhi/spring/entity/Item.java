package com.baizhi.spring.entity;

public class Item {
    private int vi_id;
    private String vu_user_id;
    private int vs_id;
    private int vo_id;
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(int vi_id, String vu_user_id, int vs_id, int vo_id) {
		super();
		this.vi_id = vi_id;
		this.vu_user_id = vu_user_id;
		this.vs_id = vs_id;
		this.vo_id = vo_id;
	}
	public Item(String vu_user_id, int vs_id, int vo_id) {
		super();
		this.vu_user_id = vu_user_id;
		this.vs_id = vs_id;
		this.vo_id = vo_id;
	}
	@Override
	public String toString() {
		return "Item [vi_id=" + vi_id + ", vu_user_id=" + vu_user_id
				+ ", vs_id=" + vs_id + ", vo_id=" + vo_id + "]";
	}
	public int getVi_id() {
		return vi_id;
	}
	public void setVi_id(int vi_id) {
		this.vi_id = vi_id;
	}
	public String getVu_user_id() {
		return vu_user_id;
	}
	public void setVu_user_id(String vu_user_id) {
		this.vu_user_id = vu_user_id;
	}
	public int getVs_id() {
		return vs_id;
	}
	public void setVs_id(int vs_id) {
		this.vs_id = vs_id;
	}
	public int getVo_id() {
		return vo_id;
	}
	public void setVo_id(int vo_id) {
		this.vo_id = vo_id;
	}
	
    
    
    
}
