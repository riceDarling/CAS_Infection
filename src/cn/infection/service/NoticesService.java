package cn.infection.service;

import java.util.List;

import cn.infection.entity.Notices;
import cn.infection.model.NoticesPage;

public interface NoticesService {

	/**
	 * 新增通知
	 * @param notices
	 * @return
	 */
	int insert(Notices notices);
	
	/**
	 * 修改通知
	 * @param notices
	 * @return
	 */
	int update(Notices notices);
	
	/**
	 * 根据学校查询当日未读通知
	 * @param id
	 * @return
	 */
	List<Notices> selectByCond(NoticesPage nPage);
	
	/**
	 * 根据学校查询当日未读通知记录数
	 * @param id
	 * @return
	 */
	int getCountByCond(NoticesPage nPage);
	
	/**
	 * 全部标记为已读（当前登录人）
	 * @param notices
	 * @return
	 */
	int updateAll(Notices notices);

	/**
	 * 一键通知
	 * @param list
	 * @return
	 */
	int oneNotices(List<String> list);
}
