package controller.sjhost;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




//1]HttpServlet상속-컨트롤러가 됨 즉 서블릿이 됨
public class WriteControllerHost extends HttpServlet {
	//[입력 폼으로 이동]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("두겟으로 들어옴");
		//3]요청분석- 입력폼 요청
		//4]모델호출 및 결과값 받기
		//5]결과값이 있으면 ,리퀘스트 영역에 저장
		//6]뷰 선택
		/*
		 *  절대경로 지정시
		 * 	포워딩:컨텍스트 루트 경로 미 포함
		 *  리다이렉트:컨텍스트 루트 포함.
		 *  단, server.xml에 Context태그의 path속성 값을
		 *  지울시에는 신경 쓸 필요없다.
		 */
		
		//req.setAttribute("active","dataroom"); 메뉴활성화용이라서 필요없어
		//포워드]		
		req.getRequestDispatcher("/serviceinfo/hostinfo/hostwrite.jsp").forward(req, resp);
		
		//리다이렉트]
		//resp.sendRedirect(req.getContextPath()+"/DataRoom13/Write.jsp");
		
	}//////////////////////
	//[입력 처리 즉 파일 업로드 및 데이타베이스 입력]
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("포스트로 들어옴");
		//한글처리]
		req.setCharacterEncoding("UTF-8");
		//오류시 입력값 보존을 위한 변수 선언]
		String category,name,title,content;
		//3]요청분석- 입력처리 요청
		//4]모델호출 및 결과값 받기
		//파일 업로드와 관련된 모델(비지니스 로직) 호출
		
		//DB입력 성공시에는 1,실패시 0, 파일용량 초과시에는 -1 저장
		int sucOrFail;
		
		//기타 파라미터 받아서 테이블에 입력처리]
		name = req.getParameter("name");
		category = req.getParameter("category");
		title= req.getParameter("title");			
		content = req.getParameter("content");
		
		//데이타베이스 CRUD작업과 관련된 모델 호출]
		SjhDAOHost dao = new SjhDAOHost(req.getServletContext());
		SjhDTOHost dto = new SjhDTOHost();
		
		dto.setName(name);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);	
		
		
		sucOrFail=dao.insert(dto);
		dao.close();
		
		/*else sucOrFail =-1;
		//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
		//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
		req.setAttribute("SUC_FAIL", sucOrFail);
		//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
		req.setAttribute("WHERE","INS");*/
		
		if(sucOrFail == 1) {//파일업로드 및 DB입력 성공
			//이동방법1]-바로 목록으로 이동:반드시 List.jsp가 아닌 List.do로
			req.getRequestDispatcher("/HostInfoList/Listhost.do").forward(req, resp);
			//이동방법2]-메시지 뿌려주는 페이지로 이동후 목록으로 이동
			//req.getRequestDispatcher("/DataRoom13/Message.jsp").forward(req, resp);
		}
		else {
			//이동방법2]메시지 뿌려주는 페이지로 이동후 다시 입력폼으로
			req.getRequestDispatcher("/serviceinfo/hostinfo/hostMessage.jsp").forward(req, resp);
			
		}
		
	}////////////////////////////
	
}////////////////////////////
