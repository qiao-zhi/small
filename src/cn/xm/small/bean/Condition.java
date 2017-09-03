package cn.xm.small.bean;

import java.util.Date;

public class Condition {

	private String queryName;
	private String queryAddress;
	private Date queryDate;

	public String getQueryName() {
		return queryName;
	}

	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}

	public String getQueryAddress() {
		return queryAddress;
	}

	public void setQueryAddress(String queryAddress) {
		this.queryAddress = queryAddress;
	}

	public Date getQueryDate() {
		return queryDate;
	}

	public void setQueryDate(Date queryDate) {
		this.queryDate = queryDate;
	}

	public Condition() {
	}

}
