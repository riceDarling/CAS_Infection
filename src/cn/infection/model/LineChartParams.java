package cn.infection.model;

public class LineChartParams {
	
	//对比初始年
	private String startYear;
	//对比结束年
	private String endYear;
	//对比月
	private String month;
	//办学层次
	private String level;
	//学校名称
	private String schoolId;
	//疾病类型
	private String type;
	//疾病名称
	private String infectionName;
	//SQL使用的年
	private String year;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
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
