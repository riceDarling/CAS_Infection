package cn.infection.entity;

public class InfectionReportTracking {
	private Integer id;

	private Integer cardid;

	private String trackingtime;

	private String trackingpeoplename;

	private String trackingtext;

	private String trackingimg;

	public String getTrackingtext() {
		return trackingtext;
	}

	public void setTrackingtext(String trackingtext) {
		this.trackingtext = trackingtext;
	}

	public String getTrackingimg() {
		return trackingimg;
	}

	public void setTrackingimg(String trackingimg) {
		this.trackingimg = trackingimg;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCardid() {
		return cardid;
	}

	public void setCardid(Integer cardid) {
		this.cardid = cardid;
	}

	public String getTrackingtime() {
		return trackingtime;
	}

	public void setTrackingtime(String trackingtime) {
		this.trackingtime = trackingtime;
	}

	public String getTrackingpeoplename() {
		return trackingpeoplename;
	}

	public void setTrackingpeoplename(String trackingpeoplename) {
		this.trackingpeoplename = trackingpeoplename == null ? null : trackingpeoplename.trim();
	}
}