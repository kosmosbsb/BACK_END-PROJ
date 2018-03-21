package controller.psh;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		QuestionDAO dao=new QuestionDAO(req.getServletContext());
		System.out.println(req.getParameter("no")+"번호1"+req.getParameter("content")+"내용1"+ req.getParameter("admin_id")+"아이디");
		QuestionDTO dto= dao.reply(req.getParameter("no"),req.getParameter("content"), req.getParameter("admin_id"));
		req.setAttribute("dto", dto);
		
		List<QuestionDTO> list = dao.viewQinfo(req.getParameter("no"));
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
		req.setAttribute("content", dto.getContent());
		
		
		// 뷰선택]
		RequestDispatcher dispatcher = req.getRequestDispatcher("/question/current/CurrentView.jsp");
		// 포워딩]
		dispatcher.forward(req, resp);
	}
	
	
	
}
