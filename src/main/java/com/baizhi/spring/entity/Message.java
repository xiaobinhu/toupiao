package com.baizhi.spring.entity;

public class Message{
    private String vs_title;
    private  int vs_id;
    private  int changeCount;
    private  int personCount;
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Message(String vs_title, int vs_id, int changeCount, int personCount) {
		super();
		this.vs_title = vs_title;
		this.vs_id = vs_id;
		this.changeCount = changeCount;
		this.personCount = personCount;
	}
	public Message(int vs_id, int changeCount, int personCount) {
		super();
		this.vs_id = vs_id;
		this.changeCount = changeCount;
		this.personCount = personCount;
	}
	@Override
	public String toString() {
		return "Message [vs_title=" + vs_title + ", vs_id=" + vs_id
				+ ", changeCount=" + changeCount + ", personCount="
				+ personCount + "]";
	}
	public String getVs_title() {
		return vs_title;
	}
	public void setVs_title(String vs_title) {
		this.vs_title = vs_title;
	}
	public int getVs_id() {
		return vs_id;
	}
	public void setVs_id(int vs_id) {
		this.vs_id = vs_id;
	}
	public int getChangeCount() {
		return changeCount;
	}
	public void setChangeCount(int changeCount) {
		this.changeCount = changeCount;
	}
	public int getPersonCount() {
		return personCount;
	}
	public void setPersonCount(int personCount) {
		this.personCount = personCount;
	}

      
    
     
    
    
}
