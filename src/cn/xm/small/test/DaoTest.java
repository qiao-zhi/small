package cn.xm.small.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import cn.xm.small.bean.Condition;
import cn.xm.small.bean.Register;
import cn.xm.small.dao.impl.RegisterDaoImpl;

public class DaoTest {

	private RegisterDaoImpl registerDao = new RegisterDaoImpl();

	@Test
	// 测试获取总数
	public void testGetTotal() throws Exception {
		Condition condition = new Condition();
		condition.setQueryAddress("地址");
//		condition.setQueryDate(new Date());
		condition.setQueryName("测试");

		Integer total = registerDao.getTotal(condition);
		System.out.println(total);
	}

	// 测试增加
	@Test
	public void testAdd() throws Exception {
		Register reg = new Register();
		reg.setName("测试名称2");
		reg.setAddress("测试地址2");
		reg.setDepartment("测试部门2");
		reg.setUnit("测试单位2");
		reg.setNumber(1);
		reg.setPrice(1.5f);
		reg.setTotalprice(1.5f);
		reg.setCome("来源2");
		reg.setBuytime(new Date());
		reg.setUseperson("使用人2");
		reg.setHandleperson("经办人2");
		reg.setAdmini("管理员部门2");
		registerDao.addRegister(reg);
	}

	// 测试删除
	@Test
	public void testDelete() throws Exception {
		registerDao.deleteRegisterById(2);
	}

	// 测试修改
	@Test
	public void testUpdate() throws Exception {
		Register reg = new Register();
		reg.setId(1);
		reg.setName("改过的");
		reg.setBuytime(new Date());
		registerDao.updateRegisterById(reg);
	}

	// 测试查分页对象
	@Test
	public void testgetAll() throws Exception {
		Condition condition = new Condition();
		condition.setQueryAddress("太原");
		condition.setQueryDate(new Date());
		condition.setQueryName("测试");
		List<Register> allRegister = registerDao.findUserListForPageBean(0, 1, condition);
		System.out.println(allRegister);
	}

	// 测试查单个
	@Test
	public void testgetOne() throws Exception {
		Register registerById = registerDao.getRegisterById(3);
		System.out.println(registerById);
	}

}
