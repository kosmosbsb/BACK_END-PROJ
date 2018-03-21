package controller.psh;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.cjh.DataRoomDTO;
import controller.psy.PsyDTO;


public class QuestionController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("realid")!=null) {doGet(req,resp);}
		else {
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
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("realid")==null) {doPost(req,resp);}
		else {
		//System.out.println("겟방식");
		//System.out.println(req.getParameter("no"));
		//System.out.println(req.getParameter("realid"));
		String no = req.getParameter("no");
		req.getParameter("realid");
		QuestionDAO dao = new QuestionDAO(req.getServletContext());
		List<QuestionDTO> list = dao.viewQinfo(no);
		req.setAttribute("no", no);
		req.setAttribute("state", list.get(0).getState());
		req.setAttribute("question_type", list.get(0).getQuestion_type());
		req.setAttribute("question_title", list.get(0).getQuestion_title());
		req.setAttribute("regidate", list.get(0).getRegidate());
		req.setAttribute("question_content", list.get(0).getQuestion_content());//
		req.setAttribute("img", list.get(0).getImg());
		req.setAttribute("realid", list.get(0).getRealid());
		req.setAttribute("n_nickname", list.get(0).getId());
		req.setAttribute("grade", list.get(0).getGrade());
		req.setAttribute("gender", list.get(0).getGender());
		req.setAttribute("age", list.get(0).getAge());//
		req.setAttribute("mail", list.get(0).getMail());
		req.setAttribute("phone", list.get(0).getPhone());
		req.setAttribute("n_alarm_sms", list.get(0).getN_alarm_sms());
		req.setAttribute("n_alarm_mail", list.get(0).getN_alarm_mail());
		req.setAttribute("content", dao.content(no));
		
		
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/question/current/CurrentView.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
		}
	}
}
