package cn.infection.dao;

import java.util.List;

import cn.infection.entity.InfectionType;
import cn.infection.model.TypePage;

public interface InfectionTypeDao {
    int deleteByPrimaryKey(Integer typeId);

    int insert(InfectionType record);

    int insertSelective(InfectionType record);

    InfectionType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(InfectionType record);

    int updateByPrimaryKey(InfectionType record);

	List<InfectionType> getAllType(TypePage tPage);

	int getAllCount(TypePage tPage);
	
	List<InfectionType> selectAllType();
	
}