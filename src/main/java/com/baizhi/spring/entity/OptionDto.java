package com.baizhi.spring.entity;

import java.util.List;

public class OptionDto {
   private List<Option> list;

public OptionDto() {
	super();
	// TODO Auto-generated constructor stub
}

public OptionDto(List<Option> list) {
	super();
	this.list = list;
}

@Override
public String toString() {
	return "OptionDto [list=" + list + "]";
}

public List<Option> getList() {
	return list;
}

public void setList(List<Option> list) {
	this.list = list;
}
   
   
}
