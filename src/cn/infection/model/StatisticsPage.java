package cn.infection.model;

import cn.infection.utils.PageUtil;

public class StatisticsPage extends PageUtil {
	// 学校层次(办学层次)
	private Integer level;
	// 学校
	private Integer schoolId;
	// 学校名称
	private String schoolName;
	// 疾病分类，疾病类型
	private String typeName;
	// 疾病id
	private Integer infectionId;
	// 疾病名称
	private String infectionName;
	// 日期类型
	// 时间搜索类型0:发病,1:诊断,2:死亡,3:填卡
	private String timeType;
	// 开始时间
	private String startTime;
	// 结束时间
	private String endTime;

	/**
	 * @return the level
	 */
	public Integer getLevel() {
		return level;
	}

	/**
	 * @param level
	 *            the level to set
	 */
	public void setLevel(Integer level) {
		this.level = level;
	}

	/**
	 * @return the schoolName
	 */
	public String getSchoolName() {
		return schoolName;
	}

	/**
	 * @param schoolName
	 *            the schoolName to set
	 */
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	/**
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}

	/**
	 * @param typeName
	 *            the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
	 * @return the infectionName
	 */
	public String getInfectionName() {
		return infectionName;
	}

	/**
	 * @param infectionName
	 *            the infectionName to set
	 */
	public void setInfectionName(String infectionName) {
		this.infectionName = infectionName;
	}

	/**
	 * @return the timeType
	 */
	public String getTimeType() {
		return timeType;
	}

	/**
	 * @param timeType
	 *            the timeType to set
	 */
	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}

	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime
	 *            the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/**
	 * @return the endTime
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * @param endTime
	 *            the endTime to set
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * @return the schoolId
	 */
	public Integer getSchoolId() {
		return schoolId;
	}

	/**
	 * @param schoolId the schoolId to set
	 */
	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	/**
	 * @return the infectionId
	 */
	public Integer getInfectionId() {
		return infectionId;
	}

	/**
	 * @param infectionId the infectionId to set
	 */
	public void setInfectionId(Integer infectionId) {
		this.infectionId = infectionId;
	}

}
