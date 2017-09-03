package cn.xm.small.service.impl;

import java.util.List;

import cn.xm.small.bean.Condition;
import cn.xm.small.bean.Register;
import cn.xm.small.dao.RegisterDao;
import cn.xm.small.dao.impl.RegisterDaoImpl;
import cn.xm.small.service.RegisterService;
import cn.xm.small.utils.PageBean;

public class RegisterServiceImpl implements RegisterService {

	private RegisterDao registerDao;

	public RegisterServiceImpl() {
		registerDao = new RegisterDaoImpl();
	}

	@Override
	public boolean addRegister(Register register) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.addRegister(register);
	}

	@Override
	public boolean deleteRegisterById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.deleteRegisterById(id);
	}

	@Override
	public boolean updateRegisterById(Register register) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.updateRegisterById(register);
	}

	@Override
	public Integer getTotal(Condition condition) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.getTotal(condition);
	}

	@Override
	public Register getRegisterById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return registerDao.getRegisterById(id);
	}

	@Override
	public PageBean<Register> findPageBean(int currentPage, int currentCount, Condition condition) throws Exception {
		// 目的：就是想办法封装一个PageBean 并返回
		PageBean<Register> pageBean = new PageBean();
		// 1、当前页private int currentPage;
		pageBean.setCurrentPage(currentPage);
		// 2、当前页显示的条数private int currentCount;
		pageBean.setCurrentCount(currentCount);
		// 3、总条数private int totalCount;
		int totalCount = 0;
		try {
			totalCount = registerDao.getTotal(condition);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pageBean.setTotalCount(totalCount);
		// 4、总页数private int totalPage;
		/*
		 * 总条数 当前页显示的条数 总页数 10 4 3 11 4 3 12 4 3 13 4 4
		 * 
		 * 公式：总页数=Math.ceil(总条数/当前显示的条数)
		 * 
		 */
		int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
		pageBean.setTotalPage(totalPage);
		// 5、每页显示的数据private List<T> productList = new ArrayList<T>();
		/*
		 * 页数与limit起始索引的关系 例如 每页显示4条 页数 其实索引 每页显示条数 1 0 4 2 4 4 3 8 4 4 12 4
		 * 
		 * 索引index = (当前页数-1)*每页显示的条数
		 * 
		 */
		int index = (currentPage - 1) * currentCount;

		List<Register> userList = registerDao.findUserListForPageBean(index, currentCount, condition);
		pageBean.setProductList(userList);
		System.out.println(userList);

		return pageBean;

	}

}
