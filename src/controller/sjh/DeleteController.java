package controller.sjh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//키값 받기
		String key= req.getParameter("no");
		
		System.out.println(key);
		//레코드 삭제 성공후 파일 삭제하자]
		SjhDAO dao = new SjhDAO(req.getServletContext());
		//레코드 삭제전 파일명 얻기]
		SjhDTO dto= dao.selectOne(key);
		int sucOrFail=0;
		if(dto !=null) {				
			sucOrFail=dao.delete(key);			
		}
		dao.close();		
		//리퀘스트 영역에 데이타 저장]
		req.setAttribute("SUC_FAIL", sucOrFail);
		//포워드]
		req.getRequestDispatcher("/serviceinfo/normalinfo/Message.jsp").forward(req, resp);
	}////////////////////////////////////////////
}
