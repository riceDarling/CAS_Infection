package cn.infection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.InfectionTypeDao;
import cn.infection.entity.InfectionType;
import cn.infection.model.TypePage;
import cn.infection.service.InfectionTypeService;

@Service
public class InfectionTypeServiceImpl implements InfectionTypeService {

	@Autowired
	private InfectionTypeDao itDao;
	
	@Override
	public int insertSelective(InfectionType record) {
		return itDao.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer typeid) {
		return itDao.deleteByPrimaryKey(typeid);
	}

	@Override
	public InfectionType selectByPrimaryKey(Integer typeid) {
		return itDao.selectByPrimaryKey(typeid);
	}

	@Override
	public int updateByPrimaryKeySelective(InfectionType record) {
		return itDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<InfectionType> getAllType(TypePage tPage) {
		return itDao.getAllType(tPage);
	}

	@Override
	public int getAllCount(TypePage tPage) {
		return itDao.getAllCount(tPage);
	}

	@Override
	public List<InfectionType> selectAllType() {
		return itDao.selectAllType();
	}

}
