package cn.xm.small.Servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import cn.xm.small.bean.Register;
import cn.xm.small.service.RegisterService;
import cn.xm.small.service.impl.RegisterServiceImpl;

/**
 * @author liqiang
 * @version 创建时间：2017年8月23日 下午8:39:34
 * @description:
 */
@WebServlet("/productServlet")
public class ProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RegisterService service = new RegisterServiceImpl();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String type = request.getParameter("type");
		if (type != null && "add".equals(type)) {
			try {
				this.add(request, response, service);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (type != null && "query".equals(type)) {
			try {
				this.query(request, response, service);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (type != null && "update".equals(type)) {
			try {
				this.update(request, response, service);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (type != null && "delete".equals(type)) {
			try {
				this.delete(request, response, service);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@SuppressWarnings("unused")
	public void add(HttpServletRequest request, HttpServletResponse response, RegisterService service)
			throws Exception {
		// Thread.sleep(1000 * 3);
		String basePath = request.getContextPath();
		System.out.println("项目名字-----------" + basePath);
		// 判断带过的随机数是否有效
		boolean isValied = isAddTokenValid(request);
		if (!isValied) {
			request.setAttribute("msg", "请勿重复提交数据！！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		}
		String name = request.getParameter("name");
		String xinghao = request.getParameter("xinghao");
		String address = request.getParameter("address");
		String department = request.getParameter("department");
		String unit = request.getParameter("unit");
		String number = request.getParameter("number");
		String price = request.getParameter("price");
		String totalprice = request.getParameter("totalprice");
		String come = request.getParameter("come");
		String buytime = request.getParameter("buytime");
		String useperson = request.getParameter("useperson");
		String handleperson = request.getParameter("handleperson");
		String admini = request.getParameter("admini");
		Register reg = new Register();
		reg.setName(name);
		reg.setXinghao(xinghao);
		reg.setAddress(address);
		reg.setDepartment(department);
		reg.setUnit(unit);
		reg.setNumber(Integer.valueOf(number));
		reg.setPrice(Float.valueOf(price));
		reg.setTotalprice(Float.valueOf(totalprice));
		reg.setCome(come);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		reg.setBuytime(sdf.parse(buytime));
		reg.setUseperson(useperson);
		reg.setHandleperson(handleperson);
		reg.setAdmini(admini);
		service.addRegister(reg);
		// 增加完成跳到查询分页页面
		response.sendRedirect(basePath + "/fenYe");
	}

	// 根据id删除
	public void delete(HttpServletRequest request, HttpServletResponse response, RegisterService service)
			throws Exception {
		Integer id = Integer.valueOf(request.getParameter("id"));
		boolean result = service.deleteRegisterById(id);
		if (result) {
			response.getWriter().write("success delete!");
		}
	}

	// 修改
	public void update(HttpServletRequest request, HttpServletResponse response, RegisterService service)
			throws Exception {
		String basePath = request.getContextPath();
		System.out.println("项目名字-----------" + basePath);
		// 判断带过的随机数是否有效
		boolean isValied = isUpdateTokenValid(request);

		if (!isValied) {
			request.setAttribute("msg", "请勿重复提交数据！！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		}
		String name = request.getParameter("name2");
		String xinghao = request.getParameter("xinghao2");
		String address = request.getParameter("address2");
		String department = request.getParameter("department2");
		String unit = request.getParameter("unit2");
		String number = request.getParameter("number2");
		String price = request.getParameter("price2");
		String totalprice = request.getParameter("totalprice2");
		String come = request.getParameter("come2");
		String buytime = request.getParameter("buytime2");
		String useperson = request.getParameter("useperson2");
		String handleperson = request.getParameter("handleperson2");
		String admini = request.getParameter("admini2");
		Register reg = new Register();
		reg.setId(Integer.valueOf(request.getParameter("id2")));
		reg.setName(name);
		reg.setXinghao(xinghao);
		reg.setAddress(address);
		reg.setDepartment(department);
		reg.setUnit(unit);
		reg.setNumber(Integer.valueOf(number));
		reg.setPrice(Float.valueOf(price));
		reg.setTotalprice(Float.valueOf(totalprice));
		reg.setCome(come);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		reg.setBuytime(sdf.parse(buytime));
		reg.setUseperson(useperson);
		reg.setHandleperson(handleperson);
		reg.setAdmini(admini);
		service.updateRegisterById(reg);
		// 增加完成跳到查询分页页面
		response.sendRedirect(basePath + "/fenYe");
	}

	// 查询
	public void query(HttpServletRequest request, HttpServletResponse response, RegisterService service)
			throws Exception {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Register register = service.getRegisterById(id);
		// 转换日期格式，也可以new GsonBuilder().setDateFormat("yyyy-MM-dd
		// HH:mm:ss").create();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String json = gson.toJson(register);
		response.getWriter().write(json);
	}

	/*
	 * 防止表单重复提交
	 */
	private boolean isAddTokenValid(HttpServletRequest request) {

		// 服务器端带随机数
		String ser_hid = (String) request.getSession().getAttribute("add");

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

	/*
	 * 防止表单重复提交
	 */
	private boolean isUpdateTokenValid(HttpServletRequest request) {

		// 服务器端带随机数
		String ser_hid = (String) request.getSession().getAttribute("update");

		// 客户端带过来带随机数
		String cli_hid = request.getParameter("hid");
		System.out.println(ser_hid + "         " + cli_hid );
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

}
