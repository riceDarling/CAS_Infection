package cn.infection.service;

import cn.infection.entity.InfectionAccount;

public interface AccountService {

	InfectionAccount getAccountByName(String name);

	/**
	 * 插入一个用户
	 * @param ia
	 * @return
	 */
	int insertSelective(InfectionAccount ia);

	/**
	 * 修改用户
	 * @param ia
	 * @return
	 */
	int update(InfectionAccount ia);
}
