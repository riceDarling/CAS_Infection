package cn.infection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import cn.infection.dao.InfectionPlanDao;
import cn.infection.dao.InfectionSchoolDao;
import cn.infection.entity.InfectionPlan;
import cn.infection.entity.InfectionSchool;
import cn.infection.model.SchoolPage;
import cn.infection.service.SchoolService;

@Service
@Transactional
public class SchoolServiceImpl implements SchoolService {

	@Autowired
	private InfectionSchoolDao isDao;
	
	@Autowired
	private InfectionPlanDao infectionPlanDao;

	@Override
	public int insert(InfectionSchool is) {
		try {
			isDao.insertSelective(is);
			InfectionPlan ifp=new InfectionPlan();
			for(int i=1;i<13;i++){
				ifp.setSchoolid(is.getSchoolId());
				ifp.setPlanid(i);
				ifp.setId(null);
				infectionPlanDao.insert(ifp);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// 就是这一句了，加上之后，如果抛了异常,会回滚的
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return is.getSchoolId();
	}

	@Override
	public int delete(String id) {
		return isDao.deleteByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public int update(InfectionSchool is) {
		return isDao.updateByPrimaryKeySelective(is);
	}

	@Override
	public InfectionSchool selectById(String id) {
		return isDao.selectByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public List<InfectionSchool> getAllSchool(SchoolPage sPage) {
		return isDao.getAllSchool(sPage);
	}

	@Override
	public int getAllCount(SchoolPage sPage) {
		return isDao.getAllCount(sPage);
	}

	@Override
	public List<InfectionSchool> getAllLevel() {
		return isDao.getAllLevel();
	}

	@Override
	public List<InfectionSchool> getAllSchoolByLevel(String levelId) {
		return isDao.getAllSchoolByLevel(levelId);
	}
	
	
}
