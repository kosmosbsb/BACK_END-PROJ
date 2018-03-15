package controller.psh;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class QuestionController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/*	System.out.println("get방식");
		//if(req.getParameter("no")!=null) {doGet(req,resp);}
		System.out.println(req.getParameter("no"));*/
		QuestionDAO dao = new QuestionDAO(req.getServletContext());
		List<QuestionDTO> list = dao.selectList_A();
		List<QuestionDTO> list_N =dao.selectList_N();
		dao.close();
		//라]결과값이 있으면 리퀘스트 영역에 저장
		// 페이지용 문자열 생성]
		req.setAttribute("list", list);
		req.setAttribute("listn", list_N);
		//글목록들
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/question/current/Current.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}
	
}
