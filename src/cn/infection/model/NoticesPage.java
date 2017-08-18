package cn.infection.model;

import cn.infection.utils.PageUtil;

public class NoticesPage extends PageUtil {

	private String isRead;

	private Integer schoolId;

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	
}
