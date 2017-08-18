package cn.infection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.InfectionPlanDao;
import cn.infection.entity.InfectionPlan;
import cn.infection.service.InfectionPlanService;
@Service
public class InfectionPlanServiceImpl implements InfectionPlanService {

	@Autowired
	private InfectionPlanDao infectionPlanDao;
	@Override
	public void insert(InfectionPlan record) {
		infectionPlanDao.insert(record);
	}
	@Override
	public List<InfectionPlan> getBySchoolId(Integer schoolId) {
		return infectionPlanDao.getBySchoolId(schoolId);
	}
	@Override
	public InfectionPlan selectById(Integer id) {
		return infectionPlanDao.selectById(id);
	}
	@Override
	public int updateByPrimaryKey(InfectionPlan record) {
		return infectionPlanDao.updateByPrimaryKey(record);
	}

}
