package controller.lmy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class HelpDeleteController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	//키 값 받기 !!
	String key = req.getParameter("key");
	HelpDAO dao = new HelpDAO(req.getServletContext());
	//레코드 삭제 전 파일명 얻기
	HelpDTO dto = dao.selectOne(key);
	int sucOrFail =0;
	if(dto != null) {

	sucOrFail = dao.delete(key);
	
	}
	dao.close();
	//리퀘스트 영역에 데이터 저장
	req.setAttribute("SUC_FAIL", sucOrFail);
	req.getRequestDispatcher("/serviceinfo/help/HelpDelete.jsp").forward(req,resp);
		
		
	
	}
}
