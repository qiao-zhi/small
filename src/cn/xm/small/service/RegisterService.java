package cn.xm.small.service;

import java.util.List;

import cn.xm.small.bean.Condition;
import cn.xm.small.bean.Register;
import cn.xm.small.utils.PageBean;

public interface RegisterService {

	/**
	 * 增加
	 * 
	 * @param register
	 * @return
	 * @throws Exception
	 */
	public boolean addRegister(Register register) throws Exception;

	/**
	 * 根据id删除
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteRegisterById(Integer id) throws Exception;

	/**
	 * 修改
	 * 
	 * @param register
	 * @return
	 * @throws Exception
	 */
	public boolean updateRegisterById(Register register) throws Exception;

	/**
	 * 获取总数
	 * 
	 * @return
	 * @throws Exception
	 */
	public Integer getTotal(Condition condition) throws Exception;

	/**
	 * 获取单个
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Register getRegisterById(Integer id) throws Exception;

	/**
	 * 分页获取
	 * 
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Register> findPageBean(int currentPage, int currentCount, Condition condition) throws Exception;

}
