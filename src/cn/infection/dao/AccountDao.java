package cn.infection.dao;

import cn.infection.entity.InfectionAccount;

public interface AccountDao {

	InfectionAccount getAccountByName(String name);

	int insertSelective(InfectionAccount ia);
	
	int update(InfectionAccount ia);
}
