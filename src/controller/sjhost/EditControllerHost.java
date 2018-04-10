package controller.sjhost;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






public class EditControllerHost extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		//요청분석]		
		if(req.getMethod().toUpperCase().equals("GET")) {//수정폼으로 이동
			//키값 파라미터 받기]
			String no = req.getParameter("no");
			String category = req.getParameter("category");
						
			//모델 호출 및 결과 값 받기]
			SjhDAOHost dao = new SjhDAOHost(req.getServletContext());
			SjhDTOHost dto = dao.selectOne(no);
			dao.close();
			//리퀘스트 영역에 저장
			req.setAttribute("dto", dto);
			//포워드]
			req.getRequestDispatcher("/serviceinfo/hostinfo/hostedit.jsp").forward(req, resp);
		}
		else {//수정처리-POST방식
			
			//한글처리]
			req.setCharacterEncoding("UTF-8");
			//3]요청분석- 수정처리 요청
			//4]모델호출 및 결과값 받기
			//파일 업로드와 관련된 모델(비지니스 로직) 호출
			//MultipartRequest mr=FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			//mr은 파일용량 초과시에만 null임. 파일첨부 안하더라도 객체는 생성됨
			//수정성공:1,실패:0,용량초과:-1
			int sucOrFail;
			String no=null;
			
			
				////기타 파라미터 받아서 테이블에 수정처리]
				no= req.getParameter("key");
				
				String name=req.getParameter("name");
				String title=req.getParameter("title");
				String category = req.getParameter("category");
				String content=req.getParameter("content");
								
				//데이타베이스 CRUD작업과 관련된 모델 호출]
				SjhDAOHost dao = new SjhDAOHost(req.getServletContext());
				SjhDTOHost dto = new SjhDTOHost();
				
				dto.setNo(no);	
				dto.setName(name);							
				dto.setTitle(title);
				dto.setContent(content);
				dto.setCategory(category);
				
				
				sucOrFail=dao.update(dto);
								
				dao.close();
			
			//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
			req.setAttribute("SUC_FAIL", sucOrFail);
			req.setAttribute("WHERE", "EDT");
			//※파라미터로 전달된 값들을 MultipartRequest가
			//가로채서 
			//상세보기로 이동하기 위해 영역에 키값 저장]
			req.setAttribute("key", no);
			//6]포워드
			req.getRequestDispatcher("/serviceinfo/hostinfo/hostMessage.jsp").forward(req, resp);
		}
	
	}////////////////////////////service
	
}/////////////////////////////////////EditController

