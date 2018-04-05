package controller.lmy;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class HelpListController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}///
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//가]사용자 요청을 받는다		  
		//나]요청을 분석한다.		  
		//다]모델에서 필요한 로직 호출해서 결과값이 있으면 받기 
		HelpDAO dao = new HelpDAO(req.getServletContext());
		
		//지금 밑에 코드 부터 데이터가 안들어감.
		List<HelpDTO> list=dao.selectList();
		dao.close();
		//라]결과값이 있으면 리퀘스트 영역에 저장
		
		req.setAttribute("list", list);//글목록들
		req.setAttribute("active","dataroom");//메뉴 활성화용
		
		//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/serviceinfo/help/HelpList.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}///////////////////

}
