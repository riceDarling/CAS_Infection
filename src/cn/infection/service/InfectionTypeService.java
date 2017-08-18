package cn.infection.service;

import java.util.List;

import cn.infection.entity.InfectionType;
import cn.infection.model.TypePage;

public interface InfectionTypeService {

	/**
	 * 新增类型
	 * @param record
	 * @return
	 */
	int insertSelective(InfectionType record);
	
	/**
	 * 根据typeid删除类型
	 * @param typeid
	 * @return
	 */
	int deleteByPrimaryKey(Integer typeid);
	
	/**
	 * 根据typeid查询类型
	 * @param typeid
	 * @return
	 */
	InfectionType selectByPrimaryKey(Integer typeid);

	/**
	 * 更新类型
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(InfectionType record);
	
	/**
	 * 根据条件分页查询类型
	 * @param tPage
	 * @return
	 */
	List<InfectionType> getAllType(TypePage tPage);

	/**
	 * 根据条件分页查询类型记录数
	 * @param tPage
	 * @return
	 */
	int getAllCount(TypePage tPage);

	/**
	 * 获取全部类型
	 * @return
	 */
	List<InfectionType> selectAllType();
}
