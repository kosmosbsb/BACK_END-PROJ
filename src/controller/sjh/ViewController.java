package controller.sjh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.sjh.SjhDAO;
import controller.sjh.SjhDTO;
//1]HttpServlet 상속 받는다
public class ViewController extends HttpServlet {
	
	//2]service()혹은 doGet() 혹은 doPost()오버라이딩
	@Override
	protected void service(HttpServletRequest req, 
			               HttpServletResponse resp) throws ServletException, IOException {
		//3]요청분석
		String key = req.getParameter("key");
		//4]모델 호출 및 결과값 받기
		SjhDAO dao = new SjhDAO(req.getServletContext());
		SjhDTO dto= dao.selectOne(key);
		//내용 줄바꿈
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		dao.close();
		//5]필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		//6]뷰 선택후 포워딩
		req.getRequestDispatcher("/serviceinfo/normalinfo/normalview.jsp").forward(req, resp);
	}////////////////////////
}
