package controller.admin;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.admin.AdminDAO;
import model.admin.AdminDTO;
import model.admin.PBKDF2;

public class EditController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			req.setCharacterEncoding("utf-8");
		
			AdminDTO dto = new AdminDTO();
			dto.setId(req.getParameter("id"));
			try {
				dto.setPwd(PBKDF2.createHash(req.getParameter("pwd")));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {e.printStackTrace();}
			dto.setAdmin_name(req.getParameter("admin_name"));
			dto.setAdmin_level(req.getParameter("admin_level"));
			
			AdminDAO dao = new AdminDAO(req.getServletContext());
			dao.editAdmin(dto);
			
			dao.close();
			
			req.getRequestDispatcher("/ADMIN/List.do").forward(req, resp);
	}
}
