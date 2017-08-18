package cn.infection.dao;

import java.util.List;

import cn.infection.entity.Infection;
import cn.infection.model.InfectionPage;

public interface InfectionDao {
	int deleteByPrimaryKey(Integer infectionId);

	int insert(Infection record);

	int insertSelective(Infection record);

	Infection selectByPrimaryKey(Integer infectionId);

	int updateByPrimaryKeySelective(Infection record);

	int updateByPrimaryKey(Infection record);

	List<Infection> getAllInfection(InfectionPage iPage);

	int getAllCount(InfectionPage iPage);

	/**
	 * 根据种类查询全部的病种
	 * 
	 * @param typeId
	 * @return
	 */
	List<Infection> getAllByTypeId(String typeId);
}