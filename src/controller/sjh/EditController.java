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
import controller.sjh.SjhDAO;
import controller.sjh.SjhDTO;


public class EditController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
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
	}////////////////////////////
}
