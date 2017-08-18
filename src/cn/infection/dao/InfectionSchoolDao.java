package cn.infection.dao;

import java.util.List;


import cn.infection.entity.InfectionSchool;
import cn.infection.model.SchoolPage;

public interface InfectionSchoolDao {
    int deleteByPrimaryKey(Integer schoolId);

    int insert(InfectionSchool record);

    int insertSelective(InfectionSchool record);

    InfectionSchool selectByPrimaryKey(Integer schoolId);

    int updateByPrimaryKeySelective(InfectionSchool record);

    int updateByPrimaryKey(InfectionSchool record);

	List<InfectionSchool> getAllSchool(SchoolPage sPage);

	int getAllCount(SchoolPage sPage);
	
	List<InfectionSchool> getAllLevel();

	/**
	 * 根据办学级别查询所有的学校
	 * 
	 * @param levelId
	 * @return
	 */
	List<InfectionSchool> getAllSchoolByLevel(String levelId);
}