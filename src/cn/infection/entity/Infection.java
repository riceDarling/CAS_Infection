package cn.infection.entity;

/**
 * 传染病
 * @author Administrator
 *
 */
public class Infection {
	// id
	private Integer infectionId;
	// 传染病名称
	private String infectionName;
	// 类型
	private Integer type;
	// /是否删除1:存在0:删除
	private Integer isDel;
	// 类型名称
	private String typeName;
	//至少隔离天数
	private Integer insulateTime;

	public Integer getInsulateTime() {
		return insulateTime;
	}

	public void setInsulateTime(Integer insulateTime) {
		this.insulateTime = insulateTime;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getInfectionId() {
		return infectionId;
	}

	public void setInfectionId(Integer infectionId) {
		this.infectionId = infectionId;
	}

	public String getInfectionName() {
		return infectionName;
	}

	public void setInfectionName(String infectionName) {
		this.infectionName = infectionName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}
}