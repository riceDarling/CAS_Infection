package cn.infection.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.AccountDao;
import cn.infection.entity.InfectionAccount;
import cn.infection.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	private AccountDao accountDao;
	
	@Override
	public InfectionAccount getAccountByName(String name) {
		return accountDao.getAccountByName(name);
	}

	@Override
	public int insertSelective(InfectionAccount ia) {
		return accountDao.insertSelective(ia);
	}

	@Override
	public int update(InfectionAccount ia) {
		return accountDao.update(ia);
	}

}
