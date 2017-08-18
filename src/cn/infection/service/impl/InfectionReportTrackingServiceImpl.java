package cn.infection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.InfectionReportTrackingDao;
import cn.infection.entity.InfectionReportTracking;
import cn.infection.service.InfectionReportTrackingService;

@Service
public class InfectionReportTrackingServiceImpl implements InfectionReportTrackingService {

	@Autowired
	private InfectionReportTrackingDao irtDao;
	@Override
	public void insert(InfectionReportTracking model) {
		irtDao.insert(model);	
	}

	@Override
	public List<InfectionReportTracking> getInfectionReportTrackings(Integer cardId) {
		return irtDao.getInfectionReportTrackings(cardId);
	}

}
