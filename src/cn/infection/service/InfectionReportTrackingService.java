package cn.infection.service;

import java.util.List;

import cn.infection.entity.InfectionReportTracking;

public interface InfectionReportTrackingService {
	void insert(InfectionReportTracking model);

	List<InfectionReportTracking> getInfectionReportTrackings(Integer cardId);
}
