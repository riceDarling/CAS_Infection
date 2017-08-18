package cn.infection.entity;

/**
 * 报告
 * 
 * @author Administrator
 * 
 */
public class InfectionReport {
	private Integer cardId;
	// 报告学校
	private Integer schoolId;
	// 学校层次
	private Integer level;
	// 患者姓名
	private String patientName;
	// 所在班级
	private String classes;
	// 有效证件号
	private String idNumber;
	// 性别: 0 男，1 女
	private Integer sex;
	// 出生日期
	private String birthDay;
	// 家长姓名
	private String parentName;
	// 年龄
	private Integer age;
	// 所属区域
	private Integer area;
	// 详细地址
	private String address;
	// 传染病id
	private Integer infectionId;
	// 学校名称
	private String schoolName;
	// 疾病类型
	private String typeName;
	// 疾病类型id
	private Integer typeId;
	// 疾病名称
	private String infectionName;
	// 病历类型
	private Integer type;
	// 联系电话
	private String telephone;
	// 发病日期
	private String onsetTime;
	// 诊断日期
	private String diagnosisTime;
	// 最终诊断结果
	private String result;
	// 报告人
	private String reporter;
	// 填卡日期
	private String fillTime;
	// 密切接触这有无相似症状
	private Integer isInfection;
	// 审核1:通过0:未通过
	private Integer isPass;
	// 是否删除1:存在0:删除
	private Integer isDel;
	// 备注
	private String note;
	// 死亡日期
	private String deathTime;
	// 诊断病例
	private String diagnosisImg;
	// 订正日期
	private String revisedTime;

	// 审核日期
	private String auditTime;
	// 复课状态
	private Integer restore;
	// 复课证明图片
	private String restoreImg;

	// 密切接触者人数
	private Integer isInfectionnum;
	// 是否是0报告
	private Integer iszero;
	// 留调报告
	private String keeptuneimg;
	// 整改落实情况
	private String implementationimg;
	// 结案
	private Integer end;

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getIsInfectionnum() {
		return isInfectionnum;
	}

	public void setIsInfectionnum(Integer isInfectionnum) {
		this.isInfectionnum = isInfectionnum;
	}

	public Integer getIszero() {
		return iszero;
	}

	public void setIszero(Integer iszero) {
		this.iszero = iszero;
	}

	public String getKeeptuneimg() {
		return keeptuneimg;
	}

	public void setKeeptuneimg(String keeptuneimg) {
		this.keeptuneimg = keeptuneimg;
	}

	public String getImplementationimg() {
		return implementationimg;
	}

	public void setImplementationimg(String implementationimg) {
		this.implementationimg = implementationimg;
	}

	public Integer getRestore() {
		return restore;
	}

	public void setRestore(Integer restore) {
		this.restore = restore;
	}

	public String getRestoreImg() {
		return restoreImg;
	}

	public void setRestoreImg(String restoreImg) {
		this.restoreImg = restoreImg;
	}

	public String getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(String auditTime) {
		this.auditTime = auditTime;
	}

	public String getRevisedTime() {
		return revisedTime;
	}

	public void setRevisedTime(String revisedTime) {
		this.revisedTime = revisedTime;
	}

	public String getDiagnosisImg() {
		return diagnosisImg;
	}

	public void setDiagnosisImg(String diagnosisImg) {
		this.diagnosisImg = diagnosisImg;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getInfectionName() {
		return infectionName;
	}

	public void setInfectionName(String infectionName) {
		this.infectionName = infectionName;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getArea() {
		return area;
	}

	public void setArea(Integer area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getInfectionId() {
		return infectionId;
	}

	public void setInfectionId(Integer infectionId) {
		this.infectionId = infectionId;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public String getDeathTime() {
		return deathTime;
	}

	public void setDeathTime(String deathTime) {
		this.deathTime = deathTime;
	}

	public Integer getCardId() {
		return cardId;
	}

	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getOnsetTime() {
		return onsetTime;
	}

	public void setOnsetTime(String onsetTime) {
		this.onsetTime = onsetTime;
	}

	public String getDiagnosisTime() {
		return diagnosisTime;
	}

	public void setDiagnosisTime(String diagnosisTime) {
		this.diagnosisTime = diagnosisTime;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getFillTime() {
		return fillTime;
	}

	public void setFillTime(String fillTime) {
		this.fillTime = fillTime;
	}

	public Integer getIsInfection() {
		return isInfection;
	}

	public void setIsInfection(Integer isInfection) {
		this.isInfection = isInfection;
	}

	public Integer getIsPass() {
		return isPass;
	}

	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}