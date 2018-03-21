package controller.sjh;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.PBKDF2;
import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;
import controller.sjh.SjhDAO;
import controller.sjh.SjhDTO;


public class EditController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {/*
		
		//요청분석]		
		if(req.getMethod().toUpperCase().equals("GET")) {//수정폼으로 이동
			//키값 파라미터 받기]
			String title = req.getParameter("title");
			//모델 호출 및 결과 값 받기]
			SjhDAO dao = new SjhDAO(req.getServletContext());
			SjhDTO dto = dao.selectOne(title);
			dao.close();
			//리퀘스트 영역에 저장]
			req.setAttribute("dto", dto);
			//포워드]
			req.getRequestDispatcher("/serviceinfo/normalinfo/normaledit.jsp").forward(req, resp);
		}
		else {
			//※파라미터로 전달된 값들을 MultipartRequest가
			//가로채서 
			//상세보기로 이동하기 위해 영역에 키값 저장]
			
			//6]포워드<c:url value='/NormalInfo/List.do'/>
			req.getRequestDispatcher("/serviceinfo/normalinfo/normalinfo.jsp").forward(req, resp);
		}
	*/
	

		
		//요청분석]
		if(req.getMethod().toUpperCase().equals("GET")) {//수정폼으로 이동
			//키값 파라미터 받기]
			String title = req.getParameter("title");
			//모델 호출 및 결과 값 받기]
			SjhDAO dao = new SjhDAO(req.getServletContext());
			SjhDTO dto = dao.selectOne(title);
			dao.close();
			//리퀘스트 영역에 저장]
			req.setAttribute("dto", dto);
			//포워드]
			req.getRequestDispatcher("/serviceinfo/normalinfo/normaledit.jsp").forward(req, resp);
		}
		else {//수정처리-POST방식
			//한글처리]
			req.setCharacterEncoding("UTF-8");
			//3]요청분석- 수정처리 요청
			//4]모델호출 및 결과값 받기
			//파일 업로드와 관련된 모델(비지니스 로직) 호출
			MultipartRequest mr=FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			//mr은 파일용량 초과시에만 null임. 파일첨부 안하더라도 객체는 생성됨
			//수정성공:1,실패:0,용량초과:-1
			int sucOrFail;
			String key=null;
			if(mr != null) {//파일을 첨부했거나 안했거나
				////기타 파라미터 받아서 테이블에 수정처리]
				key= mr.getParameter("key");
				String name=mr.getParameter("name");
				String title=mr.getParameter("title");
				String pass=mr.getParameter("pass");
				String content=mr.getParameter("content");
				String attachedfile=mr.getFilesystemName("attachedfile");
				if(attachedfile ==null) {//파일 미교체
					attachedfile=mr.getParameter("originalfilename");
				}
				//데이타베이스 CRUD작업과 관련된 모델 호출]
				DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
				DataRoomDTO dto = new DataRoomDTO();
				dto.setAttachedfile(attachedfile);
				dto.setContent(content);
				dto.setName(name);
				dto.setNo(key);
				
				try {
					dto.setPass(PBKDF2.createHash(pass));
				} 
				catch (Exception e) {e.printStackTrace();}
				
				dto.setTitle(title);				
				sucOrFail=dao.update(dto);
				//DB 업데이트 성공 및 파일 교체시 기존 업로드된 파일 삭제
				if(sucOrFail==1 && mr.getFilesystemName("attachedfile") !=null) {
					FileUtils.deleteFile(req, "/Upload",mr.getParameter("originalfilename"));
				}
				dao.close();
				
			}
			else sucOrFail=-1;
			//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			//5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
			req.setAttribute("SUC_FAIL", sucOrFail);
			req.setAttribute("WHERE", "EDT");
			//※파라미터로 전달된 값들을 MultipartRequest가
			//가로채서 
			//상세보기로 이동하기 위해 영역에 키값 저장]
			req.setAttribute("title", title);
			//6]포워드
			req.getRequestDispatcher("/serviceinfo/normalinfo/normalinfo.jsp").forward(req, resp);
		}
	
	
	}////////////////////////////
}
