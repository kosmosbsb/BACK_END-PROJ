package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.admin.AdminDAO;
import model.admin.AdminDTO;
import model.admin.PagingUtil;

public class ListController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}/////////////////	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AdminDAO dao = new AdminDAO(req.getServletContext());

		List<AdminDTO> list=dao.selectList();
		dao.close();

		req.setAttribute("list", list);//글목록들
		req.setAttribute("active","active");//메뉴 활성화용
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/member/admin/AdminInfo.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}///////////////////
}
