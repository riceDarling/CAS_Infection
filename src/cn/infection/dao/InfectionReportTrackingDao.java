package cn.infection.dao;

import java.util.List;

import cn.infection.entity.InfectionReportTracking;

public interface InfectionReportTrackingDao {
	void insert(InfectionReportTracking model);

	List<InfectionReportTracking> getInfectionReportTrackings(Integer cardId);
}