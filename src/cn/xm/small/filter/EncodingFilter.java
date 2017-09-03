package cn.xm.small.filter;




import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingFilter implements Filter{

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//request.setCharacterEncoding("UTF-8");
		
		//鍦ㄤ紶閫抮equest涔嬪墠瀵箁equest鐨刧etParameter鏂规硶杩涜澧炲己
		/*
		 * 瑁呴グ鑰呮ā寮�(鍖呰)
		 * 
		 * 1銆佸寮虹被涓庤澧炲己鐨勭被瑕佸疄鐜扮粺涓�鎺ュ彛
		 * 2銆佸湪澧炲己绫讳腑浼犲叆琚寮虹殑绫�
		 * 3銆侀渶瑕佸寮虹殑鏂规硶閲嶅啓 涓嶉渶瑕佸寮虹殑鏂规硶璋冪敤琚寮哄璞＄殑
		 * 
		 */
		
		//琚寮虹殑瀵硅薄
		HttpServletRequest req = (HttpServletRequest) request;
		//澧炲己瀵硅薄
		EnhanceRequest enhanceRequest = new EnhanceRequest(req);
		
		System.out.println("鍏ㄥ眬缂栫爜杩囨护鍣ㄦ墽琛�");
		chain.doFilter(enhanceRequest, response);
		
	}

	public void destroy() {
		
	}
	
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}

class EnhanceRequest extends HttpServletRequestWrapper{
	
	private HttpServletRequest request;

	public EnhanceRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	
	//瀵筭etParaameter澧炲己
	@Override
	public String getParameter(String name) {
		String parameter = request.getParameter(name);//涔辩爜
		try {
			parameter = new String(parameter.getBytes("iso8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return parameter;
	}
	
}
