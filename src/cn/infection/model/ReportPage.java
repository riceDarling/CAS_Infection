package cn.infection.model;

import cn.infection.utils.PageUtil;

public class ReportPage extends PageUtil {

	// 学校
	private Integer schoolId;
	// 疾病类型
	private Integer type;
	// 开始时间
	private String startTime;
	// 结束时间
	private String endTime;
	// 时间搜索类型0:发病,1:诊断,2:死亡,3:填卡
	private String timeType;
	// 审核状态1:通过0:未通过 2已删除
	private Integer isPass;

	// 学校类型
	private Integer schooltype;
	// 疾病类型
	private Integer infectionType;
	// 疾病id
	private Integer infectionId;

	public Integer getSchooltype() {
		return schooltype;
	}

	public void setSchooltype(Integer schooltype) {
		this.schooltype = schooltype;
	}

	public Integer getInfectionType() {
		return infectionType;
	}

	public void setInfectionType(Integer infectionType) {
		this.infectionType = infectionType;
	}

	public Integer getInfectionId() {
		return infectionId;
	}

	public void setInfectionId(Integer infectionId) {
		this.infectionId = infectionId;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getIsPass() {
		return isPass;
	}

	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getTimeType() {
		return timeType;
	}

	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}
}
