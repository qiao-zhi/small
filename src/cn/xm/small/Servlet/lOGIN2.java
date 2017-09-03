package cn.xm.small.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liqiang
 * @version 创建时间：2017年8月28日 下午4:46:09
 * @description:
 */
@WebServlet("/lOGIN2")
public class lOGIN2 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// 判断带过的随机数是否有效
		boolean isValied = isTokenValid(request);

		if (!isValied) {
			System.out.println("无效，请不要重复提交！");
			return;
		}

		request.getSession().removeAttribute("rand");
		System.out.println("正在提交。。。。。。。。。");
	}

	private boolean isTokenValid(HttpServletRequest request) {

		// 服务器端带随机数
		String ser_hid = (String) request.getSession().getAttribute("rand");

		// 客户端带过来带随机数
		String cli_hid = request.getParameter("hid");
		System.out.println(ser_hid + "         " + cli_hid + "    5");
		if (cli_hid == null) {
			return false;
		}
		if (ser_hid == null) {
			return false;
		}
		if (!cli_hid.equals(ser_hid)) {
			return false;
		}
		return true;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
