package controller.lmy;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.PBKDF2;

public class HelpEditController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청분석
		if(req.getMethod().toUpperCase().equals("GET")) {
		//파라미터 받기
		String key = req.getParameter("notice_no");
		
		HelpDAO dao = new HelpDAO(req.getServletContext());
		HelpDTO dto = dao.selectOne(key);
		
		dao.close();
		//필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto",dto);
		req.getRequestDispatcher("/serviceinfo/help/HelpEdit.jsp").forward(req,resp);
		System.out.println("여기는 초반입니다");
		}
		else {
			req.setCharacterEncoding("UTF-8");
			//3 요청 분석-수정 처리 요청
			//4 모델 호출 및 결과값 받기
			//파일 업로드와 롼련된 모델(비지니스 로직)호출
			//MultipartRequest mr = FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			//mr은 파일용량 초과시에만null임 파일첨부안하더라도 객체는 생성됨
			
			//수정 성공:1 실패:0 용량초과:-1
			System.out.println("11여기는 중반입니다");
			int sucOrFail;
			String notice_no = null;
			//if(mr != null) {//파일을 첨부했거나 안했거나
				
				//기터 파라미터 받아서 테이블에 수정처리
				notice_no = req.getParameter("key");
				String title = req.getParameter("title");
				String content = req.getParameter("content");
				String normal_or_host = req.getParameter("normal_or_host");
				String category = req.getParameter("category");
				String id = req.getParameter("id");
				
				
				
			
				//데이터베이스crud작업과 관련된 모델 호출
				HelpDAO dao = new HelpDAO(req.getServletContext());
				HelpDTO dto = new HelpDTO();
			
				
				dto.setNotice_no(notice_no);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setNormal_or_host(normal_or_host);
				dto.setCategory(category);
				dto.setId(id);
			
			
				
				sucOrFail=dao.update(dto);
				dao.close();
				
			
				req.setAttribute("SUC_FAIL",sucOrFail);
				req.setAttribute("WHERE","EDT");
				
				req.setAttribute("key",notice_no);
				req.getRequestDispatcher("/serviceinfo/help/HelpMessage.jsp").forward(req,resp);
				
				
				
		
		}
 	}
}
