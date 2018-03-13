package controller.lmy;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.lmy.DataRoomDAO;
import controller.lmy.DataRoomDTO;

//1]사용자 요청을 받을 수 있도록 서블릿 클래스로 만들기(HttpServlet상속)
//즉 컨트롤러로 만들기
public class LmyController extends HttpServlet {
	/*2]사용자 요청이 GET방식이면 doGet(),
    POST방식이면 doPost() 오버라이딩]

	※GET 및 POST방식을 구분하지 않고 요청을 받으려면
	service()를 오버라이딩 하거나
	혹은 위의 두 메소드 즉 doGet() ,doPost()를 오버라이딩해서
	한쪽 메소드에서 받은 요청을 다른 쪽으로 전달하면 된다.
	예]
	@Override
	protected void doPost(HttpServletRequest req, 
			              HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}///////////////////////////////////
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//여기서 컨트롤러(서블릿)이 할일을 구현
	}
	*/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}/////////////////	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//가]사용자 요청을 받는다		  
		//나]요청을 분석한다.		  
		//다]모델에서 필요한 로직 호출해서 결과값이 있으면 받기 
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		
		List<DataRoomDTO> list=dao.selectList();
		dao.close();
		//라]결과값이 있으면 리퀘스트 영역에 저장
		
		req.setAttribute("list", list);//글목록들
		req.setAttribute("active","dataroom");//메뉴 활성화용
		
		//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/serviceinfo/notice/NoticeShow.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}///////////////////
}
