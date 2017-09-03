package cn.xm.small.Servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xm.small.bean.Condition;
import cn.xm.small.bean.Register;
import cn.xm.small.service.RegisterService;
import cn.xm.small.service.impl.RegisterServiceImpl;
import cn.xm.small.utils.PageBean;
import cn.xm.small.utils.TokenProcessor;

/**
 * @author liqiang
 * @version 创建时间：2017年8月23日 下午8:40:59
 * @description:
 */
@WebServlet("/fenYe")
public class FenYe extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		/*** 增加防止表单重复提交的token ***/
		TokenProcessor tp = TokenProcessor.getTp();
		HttpSession session = request.getSession();
		// 添加的token
		String add = tp.getToken();
		session.setAttribute("add", add); // 用session将数据带过去
		// 修改的token
		String update = tp.getToken();
		session.setAttribute("update", update); // 用session将数据带过去

		String getTag = request.getParameter("getTag");
		// 组装查询条件
		Condition condition = new Condition();

		// 组装名称
		String queryName = request.getParameter("queryName");
		// 如果是点击页号提交方式为get提交进行转码
		if (getTag != null && !"".equals(getTag.trim())) {
			queryName = new String(queryName.getBytes("iso-8859-1"), "utf-8");
		}
		if (queryName != null && !"".equals(queryName)) {
			condition.setQueryName(queryName);
			// 回显数据
			request.setAttribute("queryName", queryName);
		}

		// 组装地址
		String queryAddress = request.getParameter("queryAddress");
		if (getTag != null && !"".equals(getTag.trim())) {
			queryAddress = new String(queryAddress.getBytes("iso-8859-1"), "utf-8");
		}
		if (queryAddress != null && !"".equals(queryAddress)) {
			condition.setQueryAddress(queryAddress);
			// 回显数据
			request.setAttribute("queryAddress", queryAddress);
		}

		// 组装日期
		String queryDate = request.getParameter("queryDate");
		/*
		 * if (getTag != null && !"".equals(getTag.trim())) { queryDate = new
		 * String(queryAddress.getBytes("iso-8859-1"), "utf-8"); }
		 */
		if (queryDate != null && !"".equals(queryDate)) {
			if ("1".equals(queryDate)) {
				System.out.println(queryDate);
				Date date = new Date();
				date.setMonth(date.getMonth() - 3);
				condition.setQueryDate(date);
			}
			if ("2".equals(queryDate)) {
				System.out.println(queryDate);
				Date date = new Date();
				System.out.println(date);
				date.setMonth(date.getMonth() - 6);
				System.out.println(date);
				condition.setQueryDate(date);
			}
			if ("3".equals(queryDate)) {
				System.out.println(queryDate);
				Date date = new Date();
				System.out.println(date);
				date.setMonth(date.getMonth() - 12);
				System.out.println(date);
				condition.setQueryDate(date);
			}
			request.setAttribute("queryDate", queryDate);
		}

		RegisterService service = new RegisterServiceImpl();

		// 模拟当前是第一页，如果刚进来显示第一页数据
		String currentPageStr = request.getParameter("currentPage");
		if (currentPageStr == null)
			currentPageStr = "1";
		int currentPage = Integer.parseInt(currentPageStr);
		// 认为每页显示12条，后期可以根据用户输入设置每页显示的页数
		int currentCount = 8;

		PageBean<Register> pageBean = null;
		try {
			pageBean = service.findPageBean(currentPage, currentCount, condition);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("pageBean", pageBean);
		System.out.println(pageBean.getProductList());

		request.getRequestDispatcher("/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
