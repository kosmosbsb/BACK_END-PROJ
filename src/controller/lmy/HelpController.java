package controller.lmy;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelpController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HelpDAO dao = new HelpDAO(req.getServletContext());
		
		List<HelpDTO> list=dao.selectList();
		dao.close();
		
		req.setAttribute("list", list);//글목록들
		req.setAttribute("active","active");//메뉴 활성화용
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/serviceinfo/help/HelpView.jsp");
		//포워딩]
		dispatcher.forward(req, resp);	
	}

	
}
