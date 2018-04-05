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
		String key = req.getParameter("key");
		
		HelpDAO dao = new HelpDAO(req.getServletContext());
		HelpDTO dto = dao.selectOne(key);
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		dao.close();
		//필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto",dto);
		req.getRequestDispatcher("/serviceinfo/help/HelpEdit.jsp").forward(req,resp);
		
		}
		else {
			req.setCharacterEncoding("UTF-8");
			//3 요청 분석-수정 처리 요청
			//4 모델 호출 및 결과값 받기
			//파일 업로드와 롼련된 모델(비지니스 로직)호출
			//MultipartRequest mr = FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			//mr은 파일용량 초과시에만null임 파일첨부안하더라도 객체는 생성됨
			
			//수정 성공:1 실패:0 용량초과:-1
			
			int sucOrFail;
			String key = null;
			//if(mr != null) {//파일을 첨부했거나 안했거나
				
				//기터 파라미터 받아서 테이블에 수정처리
				key = req.getParameter("key");
				String title = req.getParameter("title");
				String content = req.getParameter("content");
				String regidate= req.getParameter("regidate");
				String normal_or_host = req.getParameter("normal_or_host");
				String category = req.getParameter("category");
				
				String id = req.getParameter("id");
				
				
				
				//String pass = req.getParameter("pass");
			
			/*	String attachedfile = mr.getFilesystemName("attachedfile");
				if(attachedfile == null) {
					attachedfile = mr.getParameter("originalfilename");
				}*/
				
				//데이터베이스crud작업과 관련된 모델 호출
				HelpDAO dao = new HelpDAO(req.getServletContext());
				HelpDTO dto = new HelpDTO();
				//dto.setAttachedfile(attachedadile);
				
				dto.setTitle(title);
				dto.setContent(content);
				dto.setRegidate(regidate);
				dto.setNormal_or_host(nomal_or_host);
				dto.setCategory(category);
				dto.setId(id);
				  try {
					//dto.setPass(PBKDF2.createHash(pass));
				} catch (Exception e) {e.printStackTrace();
					
					e.printStackTrace();
				} 
				*/
				sucOrFail=dao.update(dto);
				
				if(sucOrFail ==1 && mr.getFilesystemName("attachedfile") != null) {
					FileUtils.deleteFile(req, "/Upload", mr.getParameter("originalfilename"));
				}
				
				dao.close();
			}				
			else sucOrFail =-1;
				req.setAttribute("SUC_FAIL",sucOrFail);
				req.setAttribute("WHERE","EDT");
				//※파라미터로 전달된 값들을 multipartrequest가 가로채서
				//상새보기이동하기 위해 영역에 키값저장
				req.setAttribute("key",key);
				req.getRequestDispatcher("/servieceinfo/help/Message.jsp").forward(req,resp);
		
		
		
		}
 	}
}
