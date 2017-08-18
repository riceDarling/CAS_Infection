package cn.infection.service;

import java.util.List;

import cn.infection.entity.InfectionSchool;
import cn.infection.model.SchoolPage;

public interface SchoolService {

	/**
	 * 新增学校
	 * @param is
	 * @return
	 */
	int insert(InfectionSchool is);
	
	/**
	 * 根据ID删除学校
	 * @param is
	 * @return
	 */
	int delete(String id);
	
	/**
	 * 更新学校
	 * @param is
	 * @return
	 */
	int update(InfectionSchool is);
	
	/**
	 * 根据id查询一个学校
	 * @param is
	 * @return
	 */
	InfectionSchool selectById(String id);

	/**
	 * 根据条件分页查询学校
	 * @param sPage
	 * @return
	 */
	List<InfectionSchool> getAllSchool(SchoolPage sPage);

	/**
	 * 根据条件分页查询学校记录数
	 * @param sPage
	 * @return
	 */
	int getAllCount(SchoolPage sPage);
	
	/**
	 * 获取全部级别
	 * @return
	 */
	List<InfectionSchool> getAllLevel();
	
	/**
	 * 根据办学级别查询所有的学校
	 * 
	 * @param levelId
	 * @return
	 */
	List<InfectionSchool> getAllSchoolByLevel(String levelId);
	
}
