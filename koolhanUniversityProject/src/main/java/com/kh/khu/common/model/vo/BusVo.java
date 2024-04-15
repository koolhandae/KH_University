package com.kh.khu.common.model.vo;

public class BusVo {
	
	private String routenm; // 정류소 도착 여부
	private String gpslati; // 구간 ID
	private String gpslong; // 제공시간
	private String nodeord; // 맵매칭 x좌표
	private String nodenm; // 맵매칭 y좌표
	private String nodeid; // 버스 ID
	
	public BusVo() {}

	public BusVo(String routenm, String gpslati, String gpslong, String nodeord, String nodenm, String nodeid) {
		super();
		this.routenm = routenm;
		this.gpslati = gpslati;
		this.gpslong = gpslong;
		this.nodeord = nodeord;
		this.nodenm = nodenm;
		this.nodeid = nodeid;
	}

	public String getRoutenm() {
		return routenm;
	}

	public void setRoutenm(String routenm) {
		this.routenm = routenm;
	}

	public String getGpslati() {
		return gpslati;
	}

	public void setGpslati(String gpslati) {
		this.gpslati = gpslati;
	}

	public String getGpslong() {
		return gpslong;
	}

	public void setGpslong(String gpslong) {
		this.gpslong = gpslong;
	}

	public String getNodeord() {
		return nodeord;
	}

	public void setNodeord(String nodeord) {
		this.nodeord = nodeord;
	}

	public String getNodenm() {
		return nodenm;
	}

	public void setNodenm(String nodenm) {
		this.nodenm = nodenm;
	}

	public String getNodeid() {
		return nodeid;
	}

	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}

	@Override
	public String toString() {
		return "BusVo [routenm=" + routenm + ", gpslati=" + gpslati + ", gpslong=" + gpslong + ", nodeord=" + nodeord
				+ ", nodenm=" + nodenm + ", nodeid=" + nodeid + "]";
	}

	

}
