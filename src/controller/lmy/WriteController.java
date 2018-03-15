package controller.lmy;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.PBKDF2;
import controller.lmy.DataRoomDAO;
import controller.lmy.DataRoomDTO;


//1]HttpServlet상속-컨트롤러가 됨 즉 서블릿이 됨
public class WriteController extends HttpServlet {
	//[입력 폼으로 이동]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setAttribute("active","dataroom");
		//포워드]		
		req.getRequestDispatcher("/serviceinfo/notice/Write.jsp").forward(req, resp);
		
		//리다이렉트]
		//resp.sendRedirect(req.getContextPath()+"/DataRoom13/Write.jsp");
		
	}//////////////////////
	//[입력 처리 즉 파일 업로드 및 데이타베이스 입력]
	
}