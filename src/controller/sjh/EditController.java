package controller.sjh;

import java.io.IOException;
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


public class EditController extends HttpServlet{
@Override
 	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	if(req.getMethod().toUpperCase().equals("GET")) {
		//파라미터 받기
		String key = req.getParameter("key");
		
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		DataRoomDTO dto = dao.selectOne(key);
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		dao.close();
		//필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto",dto);
		req.getRequestDispatcher("/Serviceinfo/normalinfo/normal.jsp").forward(req,resp);
		
		}
	
	
	
	}
}