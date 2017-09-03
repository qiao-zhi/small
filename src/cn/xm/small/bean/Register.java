package cn.xm.small.bean;

import java.util.Date;

public class Register {
	@Override
	public String toString() {
		return "Register [id=" + id + ", name=" + name + ", xinghao=" + xinghao + ", address=" + address
				+ ", department=" + department + ", unit=" + unit + ", number=" + number + ", price=" + price
				+ ", totalprice=" + totalprice + ", come=" + come + ", buytime=" + buytime + ", useperson=" + useperson
				+ ", handleperson=" + handleperson + ", admini=" + admini + "]";
	}

	private Integer id;

	private String name;

	private String xinghao;

	private String address;

	private String department;

	private String unit;

	private Integer number;

	private Float price;

	private Float totalprice;

	private String come;

	private Date buytime;

	private String useperson;

	private String handleperson;

	private String admini;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getXinghao() {
		return xinghao;
	}

	public void setXinghao(String xinghao) {
		this.xinghao = xinghao == null ? null : xinghao.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department == null ? null : department.trim();
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit == null ? null : unit.trim();
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}

	public String getCome() {
		return come;
	}

	public void setCome(String come) {
		this.come = come == null ? null : come.trim();
	}

	public Date getBuytime() {
		return buytime;
	}

	public void setBuytime(Date buytime) {
		this.buytime = buytime;
	}

	public String getUseperson() {
		return useperson;
	}

	public void setUseperson(String useperson) {
		this.useperson = useperson == null ? null : useperson.trim();
	}

	public String getHandleperson() {
		return handleperson;
	}

	public void setHandleperson(String handleperson) {
		this.handleperson = handleperson == null ? null : handleperson.trim();
	}

	public String getAdmini() {
		return admini;
	}

	public void setAdmini(String admini) {
		this.admini = admini == null ? null : admini.trim();
	}
}