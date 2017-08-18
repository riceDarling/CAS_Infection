package cn.infection.service;

import java.util.List;

import cn.infection.entity.Infection;
import cn.infection.entity.InfectionSchool;
import cn.infection.model.InfectionPage;

public interface InfectionService {

	/**
	 * 新增传染病
	 * @param is
	 * @return
	 */
	int insert(Infection infec);
	
	/**
	 * 根据ID删除传染病
	 * @param is
	 * @return
	 */
	int delete(String id);
	
	/**
	 * 更新传染病
	 * @param is
	 * @return
	 */
	int update(Infection infec);
	
	/**
	 * 根据id查询一个传染病
	 * @param is
	 * @return
	 */
	Infection selectById(String id);

	/**
	 * 根据条件分页查询传染病
	 * @param iPage
	 * @return
	 */
	List<Infection> getAllInfection(InfectionPage iPage);
	
	/**
	 * 根据条件分页查询传染病记录数
	 * @param iPage
	 * @return
	 */
	int getAllCount(InfectionPage iPage);
	
	/**
	 * 根据种类查询全部的病种
	 * 
	 * @param typeId
	 * @return
	 */
	List<Infection> getAllByTypeId(String typeId);
}
