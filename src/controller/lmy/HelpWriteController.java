package controller.lmy;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.PBKDF2;


//1]HttpServlet상속-컨트롤러가 됨 즉 서블릿이 됨
public class HelpWriteController extends HttpServlet {
	//[입력 폼으로 이동]

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
	
		
		req.setAttribute("active","dataroom");
		
		//포워드]		
		req.getRequestDispatcher("/serviceinfo/help/HelpWrite.jsp").forward(req, resp);
		
		//리다이렉트]
		//resp.sendRedirect(req.getContextPath()+"/DataRoom13/Write.jsp");
		//System.out.println("writecontroller123 ");
	}//////////////////////
	//[입력 처리 즉 파일 업로드 및 데이타베이스 입력]
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		//한글처리]
		req.setCharacterEncoding("UTF-8");
		//오류시 입력값 보존을 위한 변수 선언]
		
		String title,content,category,normal_or_host,id;
		//3]요청분석- 입력처리 요청
		//4]모델호출 및 결과값 받기
		//파일 업로드와 관련된 모델(비지니스 로직) 호출
		//MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/Upload"));
		//DB입력 성공시에는 1,실패시 0, 파일용량 초과시에는 -1 저장
		
			int sucOrFail;
			
			title= req.getParameter("title");
			content = req.getParameter("content");
			normal_or_host =req.getParameter("normal_or_host");
			category =req.getParameter("category");
			id = req.getParameter("id");
		
			
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			
			HelpDAO dao = new HelpDAO(req.getServletContext());
			HelpDTO dto = new HelpDTO();
			
			dto.setTitle(title);
			dto.setContent(content);
			dto.setNormal_or_host(normal_or_host);
			dto.setCategory(category);
			dto.setId(id);
		
			
			sucOrFail = dao.insert(dto);
			dao.close();
			
			req.setAttribute("id",req.getParameter("id"));
			
			
		//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
		//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
	/*	req.setAttribute("SUC_FAIL", sucOrFail);
		//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
=		req.setAttribute("WHERE","INS");
*/
		/*
		if(sucOrFail == 1) {//파일업로드 및 DB입력 성공
			//이동방법1]-바로 목록으로 이동:반드시 List.jsp가 아닌 List.do로
			req.getRequestDispatcher("/DATAROOM/List.do").forward(req, resp);
			//이동방법2]-메시지 뿌려주는 페이지로 이동후 목록으로 이동
			//req.getRequestDispatcher("/DataRoom13/Message.jsp").forward(req,resp);
		
		}
		else {//파일 용량 초과 혹은 파일업로드는 됬으나 DB입력 실패한 경우
*/			//이동 방법1 - 자스의 history.back()으로 입력폼으로 이동.
			/*
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('"+(sucOrFail ==0?"DB입력실패":"파일용량초과")+"')");
			out.println("history.back();");
			
			out.println("</script>");
			*/
			//이동방법2 메시지 뿌려주는 페이지로 이동후 다시 입력폼으로..
			if(sucOrFail == 1) {
			req.getRequestDispatcher("/serviceinfo/help/HelpList.do").forward(req,resp);
			//이동방법3 비밀번호도 기존값 유지하기 위한 방법- 역시 입력폼으로 이동
			//MultipartRequset가 파라미터를 가로채니깐 
			//포워드 하러다로 전달안됨 그래서 영역에 저장
			}
			else {
				req.getRequestDispatcher("/serviceinfo/help/HelpMessage.jsp").forward(req,resp);
			}
			
			
				
			
		/*	if(mr == null) {
				mr = new MultipartRequest(req,
						req.getServletContext().getRealPath("/Upload"),"UTF-8");
			}*/
			
		
			
			
			
			//req.setAttribute("pass",req.getParameter("pass"));
			//req.setAttribute("attachedfile",mr.getOriginalFileName("attachedfile"));
			//req.setAttribute("error",sucOrFail == 0?"Input filure":"Exceed File Size");
			//req.getRequestDispatcher("/serviceinfo/help/HelpView.jsp").forward(req,resp);
		
		
	}////////////////////////////
	
	
	
}////////////////////////////
