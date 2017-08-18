package cn.infection.dao;

import java.util.List;

import cn.infection.entity.InfectionPlan;

public interface InfectionPlanDao {
	int insert(InfectionPlan record);

	int insertSelective(InfectionPlan record);

	int updateByPrimaryKey(InfectionPlan record);
	
	List<InfectionPlan> getBySchoolId(Integer schoolId);
	
	InfectionPlan selectById(Integer id);
}