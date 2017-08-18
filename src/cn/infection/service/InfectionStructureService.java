package cn.infection.service;

import java.util.List;

import cn.infection.entity.InfectionStructure;

public interface InfectionStructureService {
	int insert(InfectionStructure record);

	int update(InfectionStructure record);

	List<InfectionStructure> selectBySchoolId(Integer schoolId);

	InfectionStructure selectById(Integer id);
	
	Integer selectBySchoolIdNum(Integer schoolId);
	 
	void insertS(List<InfectionStructure> record);

	void updateS(List<InfectionStructure> record);
}
