package controller.psh;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
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
		
		
		//푸시알람 보내기 시작////////////////////////////////////////////////////////////
		
		
		//아이디랑 토큰 세팅합시다
		FCMTokenDAO fCMTokenDao = new FCMTokenDAO(getServletContext());
		String userToken = fCMTokenDao.getUserToken(list.get(0).getRealid());
		//아이디랑 토큰 세팅 됨ㅋ
		
		final String apiKey = "AAAAu2-Ecco:APA91bFK9WlCbvV00BvveSSUqSokR2I639j14IxOMEJ81pY-aecemd0nyaF_mp7R9u1yVp2W_xz7EUUN0Dq61dybulwvV11z4kibWgx6EkuZn2IAyjaT698mw4Bch6MlZUXQuXOe8obp";
        URL url = new URL("https://fcm.googleapis.com/fcm/send");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", "key=" + apiKey);

        conn.setDoOutput(true);
        
        // 이걸로 보내면 특정 토큰을 가지고있는 어플에만 알림을 날려준다  위에 둘중에 한개 골라서 날려주자
        String input = "{\"notification\" : {\"title\" : \" SpaceCloud 관리자 \", \"body\" : \"문의답변을 완료했습니다. 답변 내용을 확인해주세요.\"}, \"to\":\""+userToken+"\"}";

        OutputStream os = conn.getOutputStream();
        
        // 서버에서 날려서 한글 깨지는 사람은 아래처럼  UTF-8로 인코딩해서 날려주자
        os.write(input.getBytes("UTF-8"));
        os.flush();
        os.close();

        int responseCode = conn.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + input);
        System.out.println("Response Code : " + responseCode);
        
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        // print result
        System.out.println(response.toString());
		
		
		//푸시알람 보내기 끝//////////////////////////////////////////////////////////////////
		
        dao.close();
        
		// 뷰선택]
		RequestDispatcher dispatcher = req.getRequestDispatcher("/question/current/CurrentView.jsp");
		// 포워딩]
		dispatcher.forward(req, resp);
	}
	
	
	
}
