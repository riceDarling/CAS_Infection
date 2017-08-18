package cn.infection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.InfectionDao;
import cn.infection.dao.InfectionSchoolDao;
import cn.infection.entity.Infection;
import cn.infection.entity.InfectionSchool;
import cn.infection.model.InfectionPage;
import cn.infection.service.InfectionService;
import cn.infection.service.SchoolService;

@Service
public class InfectionServiceImpl implements InfectionService {

	@Autowired
	private InfectionDao inDao;

	@Override
	public int insert(Infection infec) {
		return inDao.insertSelective(infec);
	}

	@Override
	public int delete(String id) {
		return inDao.deleteByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public int update(Infection infec) {
		return inDao.updateByPrimaryKeySelective(infec);
	}

	@Override
	public Infection selectById(String id) {
		return inDao.selectByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public List<Infection> getAllInfection(InfectionPage iPage) {
		return inDao.getAllInfection(iPage);
	}

	@Override
	public int getAllCount(InfectionPage iPage) {
		return inDao.getAllCount(iPage);
	}

	@Override
	public List<Infection> getAllByTypeId(String typeId) {
		return inDao.getAllByTypeId(typeId);
	}
	
}
