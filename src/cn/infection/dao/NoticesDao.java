package cn.infection.dao;

import java.util.List;

import cn.infection.entity.Notices;
import cn.infection.model.NoticesPage;

public interface NoticesDao {

	int insert(Notices notices);
	
	int update(Notices notices);
	
	List<Notices> selectByCond(NoticesPage nPage);
	
	int getCountByCond(NoticesPage nPage);
	
	int updateAll(Notices notices);
}
