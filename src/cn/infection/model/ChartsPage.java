package cn.infection.model;

public class ChartsPage {

	//时间搜索类型0:发病,1:诊断,2:死亡,3:填卡
	private	String timeType;
	//开始日期
	private String startTime;
	//结束日期
	private String endTime;
	//办学层次
	private String level;
	//信息名称
	private String schoolName;
	//学校ID
	private Integer schoolId;
	//疾病类型
	private String type;
	//疾病名称
	private String infectionName;
	
	public Integer getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	public String getTimeType() {
		return timeType;
	}
	public void setTimeType(String timeType) {
		this.timeType = timeType;
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
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInfectionName() {
		return infectionName;
	}
	public void setInfectionName(String infectionName) {
		this.infectionName = infectionName;
	}
}
