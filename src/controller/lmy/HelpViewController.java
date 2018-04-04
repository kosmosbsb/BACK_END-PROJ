package controller.lmy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class HelpViewController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//3.요청분석
		String key = req.getParameter("key");
		//4 모델 호출및 결과값 받기
		HelpDAO dao = new HelpDAO(req.getServletContext());
		HelpDTO dto = dao.selectOne(key);
		//System.out.println("dto");
		//dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		//필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto",dto);
		req.getRequestDispatcher("/serviceinfo/help/HelpView.jsp").forward(req,resp);
		dao.close();
		
	}
	
	
}
