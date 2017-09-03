package cn.xm.small.dao;

import java.util.List;

import cn.xm.small.bean.Condition;
import cn.xm.small.bean.Register;

public interface RegisterDao {

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
	 * 分页获取对象
	 * 
	 * @param index
	 * @param currentCount
	 * @return
	 */
	public List<Register> findUserListForPageBean(int index, int currentCount,Condition condition) throws Exception;

}
