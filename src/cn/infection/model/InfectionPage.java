package cn.infection.model;

import cn.infection.entity.Infection;
import cn.infection.utils.PageUtil;

public class InfectionPage extends PageUtil<Infection> {
	//传染病名称
	private String name;
	//传染病类型
	private Integer typeId;
	
	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
