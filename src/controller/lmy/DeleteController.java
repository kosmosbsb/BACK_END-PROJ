package controller.lmy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationContext;

import controller.lmy.DataRoomDAO;
import controller.lmy.DataRoomDTO;


public class DeleteController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	//키 값 받기 !!
	String key = req.getParameter("key");
	DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
	//레코드 삭제 전 파일명 얻기
	DataRoomDTO dto = dao.selectOne(key);
	
	dao.close();
	//리퀘스트 영역에 데이터 저장
	
	req.getRequestDispatcher("/notice/NoticeShow.jsp").forward(req,resp);
		
		
	
	}
}
