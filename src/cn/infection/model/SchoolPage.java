package cn.infection.model;

import cn.infection.entity.InfectionSchool;
import cn.infection.utils.PageUtil;

public class SchoolPage extends PageUtil<InfectionSchool> {
	//学校编号
	private Integer schoolId;
	//学校名称
	private String schoolName;
	//级别
	private Integer level;
	
	public Integer getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	
}
