package cn.infection.entity;

public class InfectionPlan {
	private Integer id;

	private Integer planid;

	private Integer schoolid;

	private String planimg;

	private String planName;

	private String schoolName;

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPlanid() {
		return planid;
	}

	public void setPlanid(Integer planid) {
		this.planid = planid;
	}

	public Integer getSchoolid() {
		return schoolid;
	}

	public void setSchoolid(Integer schoolid) {
		this.schoolid = schoolid;
	}

	public String getPlanimg() {
		return planimg;
	}

	public void setPlanimg(String planimg) {
		this.planimg = planimg == null ? null : planimg.trim();
	}
}