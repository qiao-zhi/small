package cn.xm.small.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.xm.small.bean.Condition;
import cn.xm.small.bean.Register;
import cn.xm.small.dao.RegisterDao;
import cn.xm.small.utils.DataSourceUtils;

public class RegisterDaoImpl implements RegisterDao {
	private QueryRunner runner;

	public RegisterDaoImpl() {
		runner = new QueryRunner(DataSourceUtils.getDataSource());
	}

	@Override
	public boolean addRegister(Register register) throws Exception {
		// INSERT INTO
		// `small`.`register`(`id`,`name`,`xinghao`,`address`,`department`,`unit`,`number`,`price`,`totalPrice`,`come`,`buyTime`,`usePerson`,`handlePerson`,`admini`)
		// VALUES (
		// '1','测试1','型号1','地址1','部门1','单位1','5','1.0','5.0','来源1','2017-01-07','使用者1','经办人1','管理员1');

		String sql = "INSERT INTO `small`.`register`(`id`,`name`,`xinghao`,`address`,`department`,`unit`,`number`,`price`,`totalPrice`,`come`,`buyTime`,`usePerson`,`handlePerson`,`admini`) VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int num = runner.update(sql, null, register.getName(), register.getXinghao(), register.getAddress(),
				register.getDepartment(), register.getUnit(), register.getNumber(), register.getPrice(),
				register.getTotalprice(), register.getCome(), register.getBuytime(), register.getUseperson(),
				register.getHandleperson(), register.getAdmini());
		System.out.println(num);
		return true;
	}

	@Override
	public boolean deleteRegisterById(Integer id) throws Exception {
		String sql = "delete from register where id=?";
		runner.update(sql, id);
		return true;
	}

	// UPDATE `small`.`register` SET
	// `name`='测试1',`xinghao`='型号11',`address`='地址11',`department`='部门11',`unit`='单位11',`number`='51',`price`='11',`totalPrice`='51',`come`='来源11',`buyTime`='2017-01-08',`usePerson`='使用者11',`handlePerson`='经办人11'
	// WHERE `id`='1';
	@Override
	public boolean updateRegisterById(Register register) throws Exception {
		String sql = "UPDATE `small`.`register` SET `name`=?,`xinghao`=?,`address`=?,`department`=?,`unit`=?,`number`=?,`price`=?,`totalPrice`=?,`come`=?,`buyTime`=?,`usePerson`=?,`handlePerson`=?,`admini`=? WHERE `id`=?;";
		int num = runner.update(sql, register.getName(), register.getXinghao(), register.getAddress(),
				register.getDepartment(), register.getUnit(), register.getNumber(), register.getPrice(),
				register.getTotalprice(), register.getCome(), register.getBuytime(), register.getUseperson(),
				register.getHandleperson(), register.getAdmini(), register.getId());
		return true;
	}

	@Override
	public Integer getTotal(Condition condition) throws Exception {
		// SELECT COUNT(id) FROM `small`.`register` WHERE 1=1 AND NAME LIKE
		// "%测试%" AND address LIKE "%地址%" AND buyTime < '2017-08-24'
		StringBuilder sql_builder = new StringBuilder();
		sql_builder.append("select count(id) from register where 1=1 ");
		if (condition.getQueryAddress() != null && !"".equals(condition.getQueryAddress().trim())) {
			sql_builder.append("and address like '%" + condition.getQueryAddress() + "%' ");
		}
		if (condition.getQueryName() != null && !"".equals(condition.getQueryName().trim())) {
			sql_builder.append("and name like '%" + condition.getQueryName() + "%' ");
		}
		if (condition.getQueryDate() != null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			sql_builder.append("and buyTime >'" + df.format(condition.getQueryDate())+"'");
		}

		String sql = sql_builder.toString();
		@SuppressWarnings("unchecked")
		Long query = (Long) runner.query(sql, new ScalarHandler<Object>());
		return query.intValue();

	}

	@Override
	public Register getRegisterById(Integer id) throws Exception {
		String sql = "SELECT * FROM `small`.`register` where id=?";
		Register register = runner.query(sql, new BeanHandler<Register>(Register.class), id);
		return register;
	}

	@Override
	public List<Register> findUserListForPageBean(int index, int currentCount, Condition condition) throws Exception {
		StringBuilder sql_builder = new StringBuilder();
		sql_builder.append("SELECT * FROM `small`.`register` where 1=1 ");
		if (condition.getQueryAddress() != null && !"".equals(condition.getQueryAddress().trim())) {
			sql_builder.append("and address like '%" + condition.getQueryAddress() + "%' ");
		}
		if (condition.getQueryName() != null && !"".equals(condition.getQueryName().trim())) {
			sql_builder.append("and name like '%" + condition.getQueryName() + "%' ");
		}
		if (condition.getQueryDate() != null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			sql_builder.append("and buyTime >'" + df.format(condition.getQueryDate())+"'");
		}

		sql_builder.append(" limit ?,?");
		String sql = sql_builder.toString();
		List<Register> list = new ArrayList<>();
		list = runner.query(sql, new BeanListHandler<Register>(Register.class), index, currentCount);
		System.out.println(list.size());
		return list;
	}

	// 测试日期的转换格式
	@Test
	public void test11() {
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(df.format(date));
	}

}
