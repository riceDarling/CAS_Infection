package cn.infection.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import cn.infection.dao.InfectionStructureDao;
import cn.infection.entity.InfectionAccount;
import cn.infection.entity.InfectionStructure;
import cn.infection.service.InfectionStructureService;

@Service
@Transactional
public class InfectionStructureServiceImpl implements InfectionStructureService {

	@Autowired
	private InfectionStructureDao isDao;

	@Override
	public int insert(InfectionStructure record) {
		return isDao.insert(record);
	}

	@Override
	public int update(InfectionStructure record) {
		return isDao.update(record);
	}

	@Override
	public List<InfectionStructure> selectBySchoolId(Integer schoolId) {
		return isDao.selectBySchoolId(schoolId);
	}

	@Override
	public InfectionStructure selectById(Integer id) {
		return isDao.selectById(id);
	}

	@Override
	public Integer selectBySchoolIdNum(Integer schoolId) {
		// TODO Auto-generated method stub
		return isDao.selectBySchoolIdNum(schoolId);
	}

	@Override
	public void insertS(List<InfectionStructure> record) {
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			Integer schoolId=account.getSchoolId();
			for (InfectionStructure infectionStructure : record) {
				infectionStructure.setSchoolid(schoolId);
				isDao.insert(infectionStructure);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 就是这一句了，加上之后，如果抛了异常,会回滚的
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}

	@Override
	public void updateS(List<InfectionStructure> record) {
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			Integer schoolId=account.getSchoolId();
			//删除原有的
			isDao.deleteBySchoolId(schoolId);
			//添加新的
			for (InfectionStructure infectionStructure : record) {
				infectionStructure.setSchoolid(schoolId);
				isDao.insert(infectionStructure);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 就是这一句了，加上之后，如果抛了异常,会回滚的
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
	}

}
