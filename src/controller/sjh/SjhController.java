package controller.sjh;

//공지사항

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//1]사용자 요청을 받을 수 있도록 서블릿 클래스로 만들기(HttpServlet상속)
//즉 컨트롤러로 만들기

public class SjhController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
		
	}/////////////////	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SjhDAO dao = new SjhDAO(req.getServletContext());
		
		List<SjhDTO> list=dao.selectList();
		dao.close();
		
		req.setAttribute("list", list);//글목록들
		//req.setAttribute("active","dataroom");//메뉴 활성화용
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/serviceinfo/normalinfo/normalinfo.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}///////////////////
}
