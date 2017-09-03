package cn.xm.small.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liqiang
 * @version 创建时间：2017年8月23日 下午8:39:44
 * @description:
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username != null && !"".equals(username.trim()) && password != null && !"".equals(password.trim())) {
			// 登录成功后，session中保存user，并将页面重定向到主页面
			if ("root".equals(username) && "root".equals(password)) {
				request.getSession().setAttribute("user", "user");
				response.sendRedirect("fenYe");
			}
			// 登录失败，转发到查message.jsp
			else {
				request.setAttribute("msg", "账号或密码错误");
				request.getRequestDispatcher("message.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "账号或密码不能为空");
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
