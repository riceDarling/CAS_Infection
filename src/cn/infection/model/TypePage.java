package cn.infection.model;

import cn.infection.entity.InfectionType;
import cn.infection.utils.PageUtil;

public class TypePage extends PageUtil<InfectionType> {
	//类型名称
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
