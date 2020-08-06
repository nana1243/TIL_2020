package com.springbook.view.common;


public interface DAO<Id,Model> {
	
	
	public void insert();
	public void update();
	public void delete();
	public Model read(Model model);


}
