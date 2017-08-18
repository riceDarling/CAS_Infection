package cn.infection.entity;

/**
 * 学校
 * @author Administrator
 *
 */
public class InfectionSchool {
    private Integer schoolId;

    private String schoolName;

    private String address;

    private Integer level;

    private String postalcode;

    private String limkman;

    private String telephone;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getLimkman() {
		return limkman;
	}

	public void setLimkman(String limkman) {
		this.limkman = limkman;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}