package controller.psh;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
		
		//메일 보내기 시작 - 180328 혁우/////////////////////////////////////////////////////////////////////////
		
		String host = "smtp.naver.com";
		
		final String username = "charlie8_supporter";
		final String password = "zhtmah0219";
		int port = 465;
		
		String receiver = list.get(0).getMail();
		System.out.println(receiver);
		String subject = "SpaceCloud에서 문의하신 내용에 답변드립니다.";
		
		String body = "안녕하세요. "+list.get(0).getName()+" 고객님!\r\n\r\n" +
						"서비스 이용에 궁금한 점이 있으셨군요."+
						"아래와 같이 문의 남겨주신 내용에 대해 답변드리겠습니다.\r\n\r\n" +
						"------------------------------------------------------------------------\r\n"+
						"문의제목: ["+list.get(0).getQuestion_title()+"]\r\n" +
						"문의내용: ["+list.get(0).getQuestion_content()+"]\r\n\r\n\r\n" +
						"■답변내용■\r\n"+
						dto.getContent() +"\r\n\r\n"+
						"------------------------------------------------------------------------\r\n\r\n"+
						"궁금하신 내용은 해결되었는지요.\r\n"+
						"앞으로도 편리한 서비스를 제공해드리기 위해 노력하겠습니다.\r\n"+
						"감사합니다.\r\n\r\n"+
						"SpaceCloud 관리자 드림";
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			String un=username;
			String pw=password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		
		try {
			mimeMessage.setFrom(new InternetAddress("charlie8_supporter@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			
			Transport.send(mimeMessage);
		} catch (AddressException e) {e.printStackTrace();}
		catch (MessagingException e) {e.printStackTrace();}
	
		
		//메일 보내기 끝////////////////////////////////////////////////////////////////////////////////////////////
		
		
		// 뷰선택]
		RequestDispatcher dispatcher = req.getRequestDispatcher("/question/current/CurrentView.jsp");
		// 포워딩]
		dispatcher.forward(req, resp);
	}
	
	
	
}
