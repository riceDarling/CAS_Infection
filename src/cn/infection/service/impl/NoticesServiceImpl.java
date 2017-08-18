package cn.infection.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.NoticesDao;
import cn.infection.entity.Notices;
import cn.infection.model.NoticesPage;
import cn.infection.service.NoticesService;

@Service
public class NoticesServiceImpl implements NoticesService{

	@Autowired
	private NoticesDao nDao;
	
	@Override
	public int insert(Notices notices) {
		notices.setIsRead(0);
		notices.setContent("请尽快上传文件");
		notices.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return nDao.insert(notices);
	}

	@Override
	public int update(Notices notices) {
		notices.setIsRead(1);
		return nDao.update(notices);
	}

	@Override
	public List<Notices> selectByCond(NoticesPage nPage) {
		return nDao.selectByCond(nPage);
	}

	@Override
	public int getCountByCond(NoticesPage nPage) {
		return nDao.getCountByCond(nPage);
	}

	@Override
	public int updateAll(Notices notices) {
		return nDao.updateAll(notices);
	}

	@Override
	public int oneNotices(List<String> list) {
		Notices notices = new Notices();
		notices.setContent("请尽快上传文件");
		notices.setIsRead(0);
		notices.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		int size = list.size();
		for (int i = 0; i < size; i++) {
			notices.setSchoolId(Integer.parseInt(list.get(i)));
			nDao.insert(notices);
		}
		return size;
	}
}
