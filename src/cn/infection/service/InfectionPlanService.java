package cn.infection.service;

import java.util.List;

import cn.infection.entity.InfectionPlan;

public interface InfectionPlanService {
	void insert(InfectionPlan record);

	List<InfectionPlan> getBySchoolId(Integer schoolId);

	InfectionPlan selectById(Integer id);

	int updateByPrimaryKey(InfectionPlan record);
}
