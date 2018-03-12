package controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminDAO;

public class DeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
			String id = req.getParameter("id");
			
			AdminDAO dao = new AdminDAO(req.getServletContext());
			int affected = dao.deleteAdmin(id);
			
			dao.close();
			
			req.getRequestDispatcher("/ADMIN/List.do").forward(req, resp);
	}
}
