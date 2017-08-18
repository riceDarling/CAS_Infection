package cn.infection.dao;

import java.util.List;

import cn.infection.entity.InfectionStructure;


public interface InfectionStructureDao {
   
    int insert(InfectionStructure record);

    int update(InfectionStructure record);
    
    List<InfectionStructure> selectBySchoolId(Integer schoolId);
    
    InfectionStructure selectById(Integer id);
    
    Integer selectBySchoolIdNum(Integer schoolId);
    
    int deleteBySchoolId(Integer schoolId);
}